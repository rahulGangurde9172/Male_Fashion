using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MELEFASHION.Pages
{
    public partial class Shop : System.Web.UI.Page
    {
        string connction = DBconnection.DBCONNECTION();
        protected void Page_Load(object sender, EventArgs e)
        {

           

            if (!IsPostBack)
            {
                Productcards();
            }
        }

        void Productcards()
        {
            using (SqlConnection conn =  new SqlConnection(connction))
            {
                string selectCard = "SELECT * FROM PRODUCTS";
                SqlDataAdapter DA = new SqlDataAdapter(selectCard,conn);
               
                DataTable dataTable = new DataTable();

                DA.Fill(dataTable);

                ProductCard.DataSource = dataTable;
                ProductCard.DataBind();
            }
        }
        void ProductFilter(long price)
        {
            using (SqlConnection conn = new SqlConnection(connction))
            {
                string selectCard = "SELECT * FROM PRODUCTS WHERE Product_Price < @price ";
               
                SqlCommand cmd = new SqlCommand(selectCard, conn);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);

                cmd.Parameters.AddWithValue("@price", price);
                DataTable dataTable = new DataTable();

                DA.Fill(dataTable);

                ProductCard.DataSource = dataTable;
                ProductCard.DataBind();
            }
        }

        protected void filterProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string item = filterProduct.SelectedItem.Text;
            //Response.Write(item);
            int selectedIndex = filterProduct.SelectedIndex;
            if (selectedIndex <= 0)
            {
                Productcards(); // Default product list
            }
            else
            {
                //long price = Convert.ToInt64(filterProduct.SelectedValue);
                long price = long.Parse(filterProduct.SelectedValue);
                ProductFilter(price);
            }


        }

      
        protected void Minus_Clicked(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            TextBox totalItem = (TextBox)item.FindControl("totalitemtxt");
            int current = int.Parse(totalItem.Text);

            if (current>0)
            {
                current = current - 1;
                totalItem.Text = current.ToString();
            }
        }


        protected void Plus_Clicked(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            TextBox totalItem = (TextBox)item.FindControl("totalitemtxt");
            int current = int.Parse(totalItem.Text);

            if (current >= 0)
            {
                current = current + 1;
                totalItem.Text = current.ToString();
            }
        }
        //protected void AddtoCart_Clicked(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Button btn = (Button)sender;
        //        string productId = btn.CommandArgument;

        //        // Now you have access to the Product_ID via CommandArgument
        //        Response.Write($"Product ID: {productId} - add to cart click");
        //    }
        //    catch(Exception ex)
        //    {
        //        Response.Write(ex);
        //    }
        //}

        protected void AddtoCart_Clicked(object sender, EventArgs e)
        {

            if (Session["Username"] != null)
            {
            Button btn = (Button)sender; //create refrence btn for determine each cart separete

            int Product_Id = int.Parse(btn.CommandArgument); //getting using id using commandArgument ///changes

            RepeaterItem item = (RepeaterItem)btn.NamingContainer; 

            TextBox totalItem = (TextBox)item.FindControl("totalitemtxt"); //finding control

            int quntity = int.Parse(totalItem.Text);

            if (quntity == 0)
            {
                quntity = 1;
            }




            using (SqlConnection conn = new SqlConnection(connction))
            {
                conn.Open();
                string selectQuery = "SELECT Product_Name , Product_Price , Product_Image FROM PRODUCTS WHERE Product_ID = @product_id";
                SqlCommand cmd = new SqlCommand(selectQuery, conn);

                cmd.Parameters.AddWithValue("@product_id", Product_Id);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string productName = reader["Product_Name"].ToString();
                    object ProductPrice = reader["Product_Price"];
                    string ProductImage = reader["Product_Image"].ToString();

                    if (ProductPrice != DBNull.Value && ProductPrice != null)
                    {
                        long productPrice = Convert.ToInt64(ProductPrice);
                    }

                    List<Product> cart = Session["cart"] as List<Product> ?? new List<Product>(); // creating the list of product class and storing it in session["cart"] if list if not available then creating new list of product class

                    Product existProduct = cart.FirstOrDefault(p=>p.ProductID==Product_Id);
           
                    if (existProduct != null)
                    {
                        existProduct.quantity++;
                    }
                    else
                    {
                        cart.Add(new Product { Name = productName, Price = (long)ProductPrice, quantity = quntity, ProductImage = ProductImage }); //adding data in list
                           

                        }
                    totalItem.Text = "0";
                    CartMessage.Attributes["class"] = "d-flex alert alert-success alert-dismissible fade show w-25";
                    CartMessage.InnerHtml = "<strong>Success!</strong> Product Added..";

                    Session["cart"] = cart;
                    if (cart != null && cart.Count > 0)
                    {
                        long cartTotal = cart.Sum(p => p.Price * p.quantity);//finding total 
                        //Response.Write(cartTotal); // Debugging output
                        Session["grandTotal"] = cartTotal;
                    }
                    else
                    {
                        Session["grandTotal"] = 0; // Ensure no null values in session
                    }



                }


             }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }



    }
}