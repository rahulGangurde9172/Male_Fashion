using System;
using System.Data.SqlClient;
using System.Configuration;


namespace MELEFASHION.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        private string Connstring = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            //Response.Write("CLicked");
            using (SqlConnection conn = new SqlConnection(Connstring))
            {
                try
                {
                    conn.Open();
                    string insertQuery = "INSERT INTO regestertbl(NAME, SECONDNAME,EMAIL,MOBILENUMBER,PASSWORD)VALUES(@name,@username,@email,@mobilenumber,@password)";
                    SqlCommand CMD = new SqlCommand(insertQuery, conn);
                    CMD.Parameters.AddWithValue("@name", nametxt.Text.Trim());
                    CMD.Parameters.AddWithValue("@username", usernametxt.Text.Trim());
                    CMD.Parameters.AddWithValue("@email", emailtxt.Text.Trim());
                    CMD.Parameters.AddWithValue("@mobilenumber", mobiletxt.Text.Trim());
                    CMD.Parameters.AddWithValue("@password", passwordtxt.Text.Trim());

                    int result = CMD.ExecuteNonQuery();

                    if (result > 0)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        Response.Write("Registration fails");

                    }
                }
                catch (Exception ex){ Response.Write("An error occurred: " + ex.Message); }
            }
        }
    }
}