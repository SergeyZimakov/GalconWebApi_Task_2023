namespace GalconWebApi.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Role{ get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public User(int id, string role, string userName, string firstName, string lastName)
        {
            Id = id;
            Role = role;
            UserName = userName;
            FirstName = firstName;
            LastName = lastName;
        }
    }
}
