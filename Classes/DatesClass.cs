namespace GalconWebApi.Classes
{
    public class DatesClass
    {
        public bool DatesAreValid(string fromDate, string toDate)
        {
            // check if dates are valid and fromDate is less or equal to toDate
            try
            {
                int Year, Month, Day;
                string[] dateArr = new string[3];
                dateArr = fromDate.Split('/');
                Year = Convert.ToInt32(dateArr[2]);
                Month = Convert.ToInt32(dateArr[1]);
                Day = Convert.ToInt32(dateArr[0]);
                DateTime myFromDate = new DateTime(Year, Month, Day);
                dateArr = toDate.Split('/');
                Year = Convert.ToInt32(dateArr[2]);
                Month = Convert.ToInt32(dateArr[1]);
                Day = Convert.ToInt32(dateArr[0]);
                DateTime myToDate = new DateTime(Year, Month, Day);
                TimeSpan myTimeSpan = myToDate - myFromDate;
                return myToDate >= myFromDate;
            }
            catch
            {
                return false;
            }
        }

        public DateTime ConvertDateFromQueryToDateTime(string date)
        {
            // set date from query(dd/mm/yyyy) to db format(yyyymmdd)
            string[] dateArr = date.Split('/');
            return new DateTime(Convert.ToInt32(dateArr[2]), Convert.ToInt32(dateArr[1]), Convert.ToInt32(dateArr[0]));
        }
    }
}
