using GoogleMaps.LocationServices;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecretApplication
{
    public partial class PostVanpool : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var Name = txtboxName.Text;
            var MorningStartingLocation = txtboxMrngLocation.Text + " " + txtboxMrngLocation2.Text;
            var MorningStartTime = txtboxPickUpTimeMrng.Text;
            var MorningArrivalTime = txtboxArrivalTimeMrng.Text;
            var EveningStartingLocation = txtboxEvngLocation.Text + " " + txtboxEvngLocation2.Text;
            var EveningStartTime = txtboxPickUpTimeEvng.Text;
            var EveningArrivalTime = txtboxArrivalTimeEvng.Text;
            var TotalSeats = txtBoxTotalSeats.Text;
            var AvailableSeats = TxtboxVacancies.Text;

            var locationService = new GoogleLocationService();
            var point = locationService.GetLatLongFromAddress(MorningStartingLocation);

            var latitude = point.Latitude;
            var longitude = point.Longitude;


            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=c:\\users\\rvallabhaneni\\source\\repos\\SecretApplication\\SecretApplication\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = "INSERT INTO VanData (MorningPickUpLocation, MorningStartTime, MorningArrivalTime, EveningPickUpLocation, EveningStartTime, EveningArrivalTime,TotalSeats,SeatsAvailable,Longitude,Latitude) " +
                   "VALUES (@MorningPickUpLocation, @MorningStartTime, @MorningArrivalTime, @EveningPickUpLocation, @EveningStartTime, @EveningArrivalTime, @TotalSeats,@SeatsAvailable,@Longitude,@Latitude) ";

            // create connection and command
            using (SqlConnection cn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                // define parameters and their values
                cmd.Parameters.Add("@MorningPickUpLocation", SqlDbType.VarChar, 500).Value = MorningStartingLocation;
                cmd.Parameters.Add("@MorningStartTime", SqlDbType.VarChar, 100).Value = MorningStartTime;
                cmd.Parameters.Add("@MorningArrivalTime", SqlDbType.VarChar, 100).Value = MorningArrivalTime;
                cmd.Parameters.Add("@EveningPickUpLocation", SqlDbType.VarChar, 500).Value = EveningStartingLocation;
                cmd.Parameters.Add("@EveningStartTime", SqlDbType.VarChar, 500).Value = EveningStartTime;
                cmd.Parameters.Add("@EveningArrivalTime", SqlDbType.VarChar, 500).Value = EveningArrivalTime;
                cmd.Parameters.Add("@TotalSeats", SqlDbType.Int).Value = TotalSeats;
                cmd.Parameters.Add("@SeatsAvailable", SqlDbType.Int).Value = AvailableSeats;
                cmd.Parameters.Add("@Longitude", SqlDbType.Float).Value = longitude;
                cmd.Parameters.Add("@Latitude", SqlDbType.Float).Value = latitude;


                // open connection, execute INSERT, close connection
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }

        }

    }
}