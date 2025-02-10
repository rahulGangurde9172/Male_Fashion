using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MELEFASHION.Pages
{
    public partial class ConfirmOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadOrderProduct();
        }
        void LoadOrderProduct()
        {
            List<Product> items = Session["cart"] as List<Product>;

            if (items != null)
            {
                ConfirmOrderItems.DataSource = items;
                ConfirmOrderItems.DataBind();
            }
            else
            {
                //Response.Write("Null");
                alert.Attributes["class"] = "d-flex alert alert-danger";
                alert.InnerHtml = " <strong> Your order could not found placed.</strong> Please try again later or contact support.";
            }
        }
    }
}