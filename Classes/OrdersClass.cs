using System.Data;
using System.Data.SqlClient;

namespace GalconWebApi.Classes
{
    public class OrdersClass
    {
        public DataTable GetOrdersByUser(int user)
        {
            DataTable dt = new DataTable();
            try
            {
                string connString = "Data Source=DESKTOP-7CK70L3\\SQLEXPRESS; Initial Catalog=Assignment_Galcon_Sergey; Integrated Security=true;";
                SqlConnection conn = new SqlConnection(connString);
                conn.Open();
                string query =  "SELECT * " +
                                "FROM Orders " +
                                "INNER JOIN Users ON U_ID = O_U_ID " +
                                "WHERE O_U_ID = " + user.ToString() ;
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                conn.Close();
                adapter.Dispose();
            }
            catch (Exception ex)
            {

                throw;
            }
            return dt;
        }
    }
}
