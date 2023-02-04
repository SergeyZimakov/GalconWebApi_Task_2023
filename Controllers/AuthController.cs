using GalconWebApi.Classes;
using GalconWebApi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace GalconWebApi.Controllers
{
    // /api/auth/
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _config;
        public AuthController(IConfiguration config)
        {
            _config = config;
        }

        // /api/auth/login
        [AllowAnonymous]
        [HttpPost("login")]
        public ActionResult Login([FromBody]UserLogin userLogin)
        {
            ResponseClass MyResponse = new ResponseClass();
            UsersClass MyUsersClass = new UsersClass(_config);
            string token = "";
            try
            {
                // get user
                User user = MyUsersClass.AuthenticateUser(userLogin);
                
                //generate token
                if (user != null)
                {
                    
                    token = GenerateToken(user);
                }

                //set response
                MyResponse.ResponseData.Add(new { token });
                MyResponse.ResponseMessage = user != null ? "User Logged In" : "User Not Found";
                return Ok(MyResponse);
            }
            catch (Exception ex)
            {
                MyResponse.ResponseMessage = ex.Message.ToString();
                return BadRequest(MyResponse);
            }
            
        }

        // generate JWT token for user authentication
        // token includes user name and role
        // token valid for 1 day from its creation 
        private string GenerateToken(User user)
        {
            SymmetricSecurityKey securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"].ToString()));
            SigningCredentials credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            Claim[] claims = new[]
            {               
                new Claim("UserName", user.UserName),                
                new Claim("Role", user.Role),
            };

            JwtSecurityToken token = new JwtSecurityToken
            (
                _config["Jwt:Issuer"].ToString(),
                _config["Jwt:Audience"].ToString(),
                claims,
                expires: DateTime.Now.AddDays(1),
                signingCredentials: credentials
            );
            JwtSecurityTokenHandler tokenHandler = new JwtSecurityTokenHandler();
            string tokenStr = tokenHandler.WriteToken(token);
            return tokenStr;
        }
    }
}
