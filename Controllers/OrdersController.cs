using GalconWebApi.Classes;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace GalconWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        [HttpGet("{user}")]
        public async Task<ActionResult<List<string>>> GetOrdersByUser(int user)
        {
            List<dynamic> orders = new List<dynamic>();
            OrdersClass MyOrdersClass = new OrdersClass();
            DataTable OrdersTable = MyOrdersClass.GetOrdersByUser(user);
            foreach (DataRow row in OrdersTable.Rows)
            {
                orders.Add(new
                {
                    FirstName = row["U_FirstName"].ToString(),
                    TotalPrice = row["O_TotalPrice"].ToString(),
                    Date = row["O_Date"].ToString(),
                });
            }
            return Ok(orders);
        }
    }
}
