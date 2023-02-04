namespace GalconWebApi.Classes
{
    public class ResponseClass
    {
        public List<dynamic> ResponseData { get; set; }
        public string ResponseMessage { get; set; }
        public DateTime ResponseDate { get; set; }
        
        public ResponseClass()
        {
            ResponseData = new List<dynamic>();
            ResponseMessage = "";
            ResponseDate = DateTime.Now;
        }
    }
}
