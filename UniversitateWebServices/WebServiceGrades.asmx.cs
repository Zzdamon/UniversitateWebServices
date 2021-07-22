using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;
using System.Web.Services.Protocols;

namespace UniversitateWebServices
{
    /// <summary>
    /// Summary description for WebServiceGrades
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceGrades : System.Web.Services.WebService
    {
        private string conString = "Data Source=DESKTOP-604Q3G8;Initial Catalog=Universitate;Integrated Security=True";
        public User user ;

        [WebMethod]
        [SoapHeader("user", Required = true)]
        public string getGrades(int id)
        {
            //LOGIN DATA to test

            //user = new User();
            //user.userName = "Damon";
            //user.password = "1234";

            if (user==null || !user.IsValid())
            {
                return "Error in authentication";
            }

            SqlConnection sqlConnection = new SqlConnection(conString);
            sqlConnection.Open();
            if (sqlConnection.State == System.Data.ConnectionState.Open)
            {
                var queryString = "select m.Nume, n.Nota from  Note n, Materie m where n.Student = @id AND n.Materie = m.Id group by n.Materie, m.Nume, n.Nota;";
                var command = new SqlCommand(queryString, sqlConnection);
                command.Parameters.Add("@id", SqlDbType.Int);
                command.Parameters["@id"].Value = id;
                using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command) )
                {

                    DataTable dataTable = new DataTable();
                    sqlDataAdapter.Fill(dataTable);
                    return JsonConvert.SerializeObject(dataTable);

                }
            }
            return null;
        }


    }


}
