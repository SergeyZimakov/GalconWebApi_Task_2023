using GalconWebApi.Models;
using System.Data;
using System.Data.SqlClient;

namespace GalconWebApi.Classes
{
    public class OrdersClass
    {
        private readonly IConfiguration _config;
        public OrdersClass(IConfiguration config)
        {
            _config = config;
        }
        public List<Order> GetOrdersByUser(int user)
        {
            List<Order> orders = new List<Order>();
            string connString = _config["DB_ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("SP_GetOrdersByUser", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", user);
            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Order order = new Order
                            (
                                reader.GetInt32("OrderID"),
                                reader.GetInt32("UserID"),
                                reader.GetDecimal("TotalPrice"),
                                reader.GetDateTime("OrderDate")                            
                            );
                        orders.Add(order);
                    }
                }
                reader.Close();
                conn.Close();
            }
            catch
            {
                conn.Close();
            }
            return orders;
        }       
    }
}
