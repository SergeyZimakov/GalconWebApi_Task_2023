using GalconWebApi.Classes;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace GalconWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        [HttpGet("{role}")]
        public async Task<ActionResult<List<string>>> GetUsersByRole(string role)
        {
            List<string> users = new List<string>();
            UsersClass MyUsersClass = new UsersClass();
            DataTable UsersTable = MyUsersClass.GetUsersByRole(role);
            foreach (DataRow row in UsersTable.Rows)
            {
                users.Add(row["U_FirstName"].ToString());
            }
            return Ok(users);
        }
    }
}
