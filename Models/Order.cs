namespace GalconWebApi.Models
{
    public class Order
    {
        public int OrderID { get; set; }
        public int UserID { get; set; }
        public decimal TotalPrice { get; set; }
        public DateTime OrderDate { get; set; }
        public Order(int orderID, int userID, decimal totalPrice, DateTime orderDate)
        {
            OrderID = orderID;
            UserID = userID;
            TotalPrice = totalPrice;
            OrderDate = orderDate;
        }
    }
}
