using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MELEFASHION.Pages
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        private string connstring = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void changepasswordbtn_Click(object sender, EventArgs e)
        {
            using(SqlConnection conn= new SqlConnection(connstring))
            {
                conn.Open();
                string UpdateQuery = " UPDATE regestertbl SET PASSWORD = @password WHERE MOBILENUMBER = @mobileNumber";
                SqlCommand cmd = new SqlCommand(UpdateQuery, conn);
                cmd.Parameters.AddWithValue("@password", passwordtxt.Text.Trim());
                cmd.Parameters.AddWithValue("@mobileNumber", mobiletxt.Text.Trim());

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    alertBox.Attributes["class"] = "alert alert-danger alert-dismissible fade show";
                    alertBox.InnerText = "User not found. Please check your credentials.";
                }
            }
        }

        protected void cancelbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}