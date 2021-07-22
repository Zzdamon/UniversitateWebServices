namespace UniversitateWebServices
{
    public class User : System.Web.Services.Protocols.SoapHeader
    {
        public string userName { get; set; }
        public string password { get; set; }


        public bool IsValid()
        {

            return this.userName == "Damon" && this.password == "1234";
        }
    }
}