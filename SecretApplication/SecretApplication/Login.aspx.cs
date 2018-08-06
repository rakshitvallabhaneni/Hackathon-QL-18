using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecretApplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var Username = txtboxUsername.Text;
            var Password = txtboxPassword.Text;

            Session["Username"] = Username;
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=c:\\users\\rvallabhaneni\\source\\repos\\SecretApplication\\SecretApplication\\App_Data\\Database1.mdf;Integrated Security=True";
                string query = "SELECT count(*) FROM Login WHERE Username = @username AND Password = @password";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.Add(new SqlParameter("username", Username));
                command.Parameters.Add(new SqlParameter("password", Password));

                conn.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader.GetInt32(0) == 1)
                        {
                            Response.Redirect("Profile.aspx");
                        }
                    }
                }
            }
        }
    }
}