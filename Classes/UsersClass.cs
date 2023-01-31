using System.Data;
using System.Data.SqlClient;

namespace GalconWebApi.Classes
{
    public class UsersClass
    {
        public DataTable GetUsersByRole(string role)
        {
            DataTable dt = new DataTable();
            try
            {
                string connString = "Data Source=DESKTOP-7CK70L3\\SQLEXPRESS; Initial Catalog=Assignment_Galcon_Sergey; Integrated Security=true;";
                SqlConnection conn = new SqlConnection(connString);
                conn.Open();
                string query =  "SELECT * " +
                                "FROM Users " +
                                "INNER JOIN User_Role ON UR_ID = U_UR_ID " +
                                "WHERE UPPER(UR_Name) = '" + role.ToUpper() + "'";
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
