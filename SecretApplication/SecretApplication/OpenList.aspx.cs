using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecretApplication
{
    public partial class OpenList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=c:\\users\\rvallabhaneni\\source\\repos\\SecretApplication\\SecretApplication\\App_Data\\Database1.mdf;Integrated Security=True";
                string query = "SELECT VanID as ID,MorningPickUpLocation,MorningStartTime,MorningArrivalTime,EveningPickUpLocation,EveningStartTime,EveningArrivalTime,TotalSeats,SeatsAvailable FROM VanData";
                SqlCommand command = new SqlCommand(query, conn);
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DisplayGridView.DataSource = dt;
                DisplayGridView.DataBind();
                
                conn.Close();
            }

        }
    }
}