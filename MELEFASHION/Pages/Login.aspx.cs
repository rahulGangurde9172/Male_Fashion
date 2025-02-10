using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace MELEFASHION.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        private string connstring = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            //Response.Write("clicked");
            using (SqlConnection conn = new SqlConnection(connstring))
            {
                try
                {
                    conn.Open();
                    string selectQuery = "SELECT * FROM regestertbl WHERE MOBILENUMBER = @mobilenumber AND PASSWORD = @password";
                    SqlCommand CMD = new SqlCommand(selectQuery, conn);
                    CMD.Parameters.AddWithValue("@mobilenumber", mobiletxt.Text.Trim());
                    CMD.Parameters.AddWithValue("@password", passwordtxt.Text.Trim());
                    SqlDataReader reader = CMD.ExecuteReader();

                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            string name = reader["NAME"].ToString();
                            string username = reader["SECONDNAME"].ToString();
                            string email = reader["EMAIL"].ToString();
                            string mobilenumber = reader["MOBILENUMBER"].ToString();
                            string password = reader["PASSWORD"].ToString();
                            if (Session["Username"] == null)
                            {
                                Session["Name"] = name;
                                Session["Username"] = username;
                                Session["Email"] = email;
                                Session["Mobilenumber"] = mobilenumber;
                                Session["Password"] = password;
                                Session["logedIN"] = true;
                                break;
                            }
                        }
                        
                        Response.Redirect("Default.aspx");
                        //Response.Write("user  found");
                    }
                    else
                    {

                        alertBox.Attributes["class"] = "alert alert-danger alert-dismissible fade show";
                        alertBox.InnerText = "User not found. Please check your credentials.";

                        mobiletxt.Text = "";
                        passwordtxt.Text = "";

                        //Response.Write("user not found");
                    }



                }
                catch (Exception ex) { Response.Write("Error: " + ex.Message); }
            }
        }
    }
}