using GalconWebApi.Classes;
using GalconWebApi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace GalconWebApi.Controllers
{
    // /api/users
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IConfiguration _config;
        public UsersController(IConfiguration config)
        {
            _config = config;
        }

        // /api/users/admin or /api/users/user
        [HttpGet("{role}")]
        public ActionResult GetUsersByRole(string role)
        {
            ResponseClass MyResponse = new ResponseClass();
            List<User> users = new List<User>();
            UsersClass MyUsersClass = new UsersClass(_config);
            try
            {
                //get users
                users = MyUsersClass.GetUsersByRole(role);

                //set response
                MyResponse.ResponseData.Add(new { users });
                MyResponse.ResponseMessage = users.Count > 0 ? "" : $"Users with role {role} are not found";
                return Ok(MyResponse);
            }
            catch (Exception ex)
            {
                MyResponse.ResponseMessage = ex.Message.ToString();
                return BadRequest(MyResponse);
            }
        }
    }
}
