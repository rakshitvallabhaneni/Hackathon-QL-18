using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecretApplication
{
    public partial class Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=c:\\users\\rvallabhaneni\\source\\repos\\SecretApplication\\SecretApplication\\App_Data\\Database1.mdf;Integrated Security=True";
                string query = "SELECT ID FROM Login WHERE Username = @username";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.Add(new SqlParameter("username", Session["Username"]));
                int Id = -1;
                conn.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Id = reader.GetInt32(0);  
                    }
                }

                string profileQuery = "SELECT FirstName from profile where Id = @id";
                SqlCommand cmd = new SqlCommand(profileQuery, conn);
                cmd.Parameters.Add(new SqlParameter("id", Id));

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while(reader.Read())
                    {
                        lblProfileName.Text = "&nbsp" + reader[0].ToString();
                    }
                }

            }
        }

        protected void btnVanpool_Click(object sender, EventArgs e)
        {
            Response.Redirect("FindVanpool.aspx");
        }

        protected void btnVanpoolPost_Click(object sender, EventArgs e)
        {
            Response.Redirect("PostVanpool.aspx");
        }
    }
}