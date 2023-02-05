using GalconWebApi.Models;
using System.Data;
using System.Data.SqlClient;

namespace GalconWebApi.Classes
{
    public class UsersClass
    {
        private readonly IConfiguration _config;
        public UsersClass(IConfiguration config)
        {
            _config = config;
        }
        public List<User> GetUsersByRole(string role)
        {
            List<User> users = new List<User>();
            string connString = _config["DB_ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("SP_GetUsersByRoleName", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RoleName", role);           
            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while(reader.Read())
                    {
                        User user = new User
                            (
                                reader.GetInt32("UserID"),
                                reader.GetString("Role"),
                                reader.GetString("UserName"),
                                reader.GetString("FirstName"),
                                reader.GetString("LastName")
                            );
                        users.Add(user);
                    }
                }
                reader.Close();
                conn.Close();
                
            }
            catch
            {
                conn.Close();
            }
            return users;
        }

        public User AuthenticateUser(UserLogin userLogin)
        {
            User user = null;
            string connString = _config["DB_ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("SP_GetUserByUserNameAndPassword", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", userLogin.UserName);
            cmd.Parameters.AddWithValue("@Password", userLogin.Password);
            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        user = new User
                            (
                                reader.GetInt32("UserID"),
                                reader.GetString("Role"),
                                reader.GetString("UserName"),
                                reader.GetString("FirstName"),
                                reader.GetString("LastName")
                            );                       
                    }
                }
                reader.Close();
                conn.Close();
            }
            catch
            {
                conn.Close();
            }
            return user;
        }
    }
}
