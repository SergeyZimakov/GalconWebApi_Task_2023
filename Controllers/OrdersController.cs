using GalconWebApi.Classes;
using GalconWebApi.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Security.Claims;

namespace GalconWebApi.Controllers
{
    // /api/orders/
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly IConfiguration _config;
        public OrdersController(IConfiguration config)
        {
            _config = config;
        }

        // /api/orders?user=__
        [HttpGet("")]
        public ActionResult GetOrdersByUser([FromQuery]int user)
        {
            ResponseClass MyResponse = new ResponseClass();
            List<Order> orders = new List<Order>();
            OrdersClass MyOrdersClass = new OrdersClass(_config);
            try
            {
                //set user=-1 if userID was not provided in query string
                if (HttpContext.Request.Query["user"].Count == 0) { user = -1; }
                
                //get orders
                orders = MyOrdersClass.GetOrdersByUser(user);
                
                //set response
                MyResponse.ResponseData.Add(new { orders });
                MyResponse.ResponseMessage = orders.Count > 0 ? "" : $"Orders for user with id {user} not found";
                return Ok(MyResponse);
            }
            catch (Exception ex)
            {
                MyResponse.ResponseMessage = ex.Message.ToString();
                return BadRequest(MyResponse);
            }
        }

        // /api/orders/total?user=__&from=dd/mm/yyyy&to=dd/mm/yyyy
        [HttpGet("total")]
        public ActionResult GetOrdersTotalPriceByUserAndDates([FromQuery][Required]int user, string from, string to)
        {
            ResponseClass MyResponse = new ResponseClass();
            OrdersClass MyOrdersClass = new OrdersClass(_config);
            DatesClass MyDatesClass = new DatesClass();
            List<Order> orders = new List<Order>();
            string responseMsg = "";
            decimal? totalPrice = null;
            try
            {
                if (MyDatesClass.DatesAreValid(from, to)) //check if dates are valid
                {
                    //get orders
                    orders = MyOrdersClass.GetOrdersByUser(user);
                    
                    if (orders.Count > 0) // user has orders 
                    {
                        // get only orders between dates
                        orders = orders.FindAll(o => o.OrderDate >= MyDatesClass.ConvertDateFromQueryToDateTime(from) && o.OrderDate <= MyDatesClass.ConvertDateFromQueryToDateTime(to));
                        
                        // calculate total price(set null if its no orders between dates)
                        totalPrice = orders.Count > 0 ? orders.Sum(o => o.TotalPrice) : (decimal?)null;
                        
                        // set msg for response
                        responseMsg = totalPrice != null ? "" : $"User {user} does not have orders between {from} and {to}";
                    }
                    else //user does not have orders
                    {
                        responseMsg = $"Orders for user {user} not found";
                    }

                    //set response
                    MyResponse.ResponseData.Add(new { totalPrice });
                    MyResponse.ResponseMessage = responseMsg;
                    return Ok(MyResponse);
                }
                else
                {
                    // go to catch block and return with bad request status
                    throw new Exception("Dates are not valid");
                }
                
            }
            catch (Exception ex)
            {
                MyResponse.ResponseMessage = ex.Message.ToString();
                return BadRequest(MyResponse);
            }
            
        }
    }
}
