using MELEFASHION.Admin_Panel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MELEFASHION.Pages
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCart();

        }

        void LoadCart()
        {
            List<Product> Cart = Session["cart"] as List<Product>;
            if (Cart != null)
            {
                cart_repeater.DataSource = Cart;
                cart_repeater.DataBind();
            }
           
        }

        //protected void CartItemRemove_Clicked(object sender, EventArgs e)
        //{
        //    List<Product> cart = Session["cart"] as List<Product>;

        //    if (cart != null)
        //    {
        //        Button btn = (Button)sender;
        //        string productIdStr = btn.CommandArgument;

        //        if (int.TryParse(productIdStr, out int productId))
        //        {
        //            // Find product by ProductID
        //            Product productToRemove = cart.FirstOrDefault(p => p.ProductID == productId);

        //            if (productToRemove != null)
        //            {
        //                cart.Remove(productToRemove);
        //            }
        //        }

        //        // Update session after removal
        //        Session["cart"] = cart;

        //        if (cart != null && cart.Count > 0)
        //        {
        //            long cartTotal = cart.Sum(p => p.Price * p.quantity);//finding total 
        //                                                                 //Response.Write(cartTotal); // Debugging output
        //            Session["grandTotal"] = cartTotal;
        //        }
        //        Response.Write("CommandArgument: " + productIdStr + "<br>");
        //    }
        //    Response.Write("hello");

           

        //}

    }
}