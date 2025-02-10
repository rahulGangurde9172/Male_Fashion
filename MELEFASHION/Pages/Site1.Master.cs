using System;


namespace MELEFASHION.Pages

{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void logoutbtn_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Session["Username"] = null;

             
                Session.Clear();
                Session.Abandon();
               
                Response.Redirect("Default.aspx");
            }
        }




      
       
    }
}