using System;
using System.IO;

namespace MELEFASHION.Admin_Panel
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Session["user"] = "rahul";
            }
           
            string currentPage =Request.Url.AbsolutePath.ToString();
            //Response.Write(currentPage);

            if (currentPage.EndsWith(".aspx"))
            {
                currentPage = currentPage.Replace(".aspx", "");
            }

            sitePath.Attributes["class"] = "alert alert-secondary text-success fw-bold d-block";
            sitePath.InnerText = " You are on : "+ currentPage;


            //if (currentPage.Contains("Admin_Panel/Dashboard.aspx"))
            //{
            //    Dashboard.Attributes["class"] = "active";
            //}
            //else if (currentPage.Contains("Product.aspx"))
            //{
            //    Dashboard.Attributes["class"] = "active";
            //}
            //else if (currentPage.Contains("OrderManager.aspx"))
            //{
            //    Dashboard.Attributes["class"] = "active";
            //}
            //else if (currentPage.Contains("Settings.aspx"))
            //{
            //    Dashboard.Attributes["class"] = "active";
            //}
            //else if (currentPage.Contains("UserManagement.aspx"))
            //{
            //    Dashboard.Attributes["class"] = "active";
            //}
        }

       
    }
}