using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecretApplication
{
    public partial class FindVanpool : Page
    {
        public List<Location> Points { get; set; }
        public string JSON { get; set; }
        public void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=c:\\users\\rvallabhaneni\\source\\repos\\SecretApplication\\SecretApplication\\App_Data\\Database1.mdf;Integrated Security=True";
                string query = "SELECT Longitude,Latitude FROM VanData";
                SqlCommand command = new SqlCommand(query, conn);
                conn.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    Points = new List<Location>();
                    while (reader.Read())
                    {
                        var tempLong = reader.GetDouble(0);
                        var tempLat = reader.GetDouble(1);

                        Location point = new Location();
                        point.lat = tempLat;
                        point.lng = tempLong;
                        Points.Add(point);
                    }
                }
            }
            System.Web.Script.Serialization.JavaScriptSerializer oSerializer =
            new System.Web.Script.Serialization.JavaScriptSerializer();
            JSON = oSerializer.Serialize(Points);
            //Response.Redirect("https://wwww.google.com?=" + JSON);
        }
    }
}


