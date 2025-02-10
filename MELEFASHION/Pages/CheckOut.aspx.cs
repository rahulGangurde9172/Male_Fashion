using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MELEFASHION.Pages
{
    public partial class CheckOut : System.Web.UI.Page
    {


        List<string> PaymentModes = new List<string>()
            {
                "Cash on delivery",
                "Paypal",
                "UPI"
            };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckBoxDataBinding();
                LoadCartProduct();
            //string Add = $"{CustomerName.Text} {CustomerLastName.Text} {country.Text} {Address.Text} {TownCity.Text} {Postcode.Text} {Phone.Text} {Email.Text}";
            }

        }
        void CheckBoxDataBinding()
        {
            paymentMode.DataSource= PaymentModes;
            paymentMode.DataBind();
        }
        
        protected void SelectedIndex_changed(object sender , EventArgs e)
        {
            foreach (ListItem list in paymentMode.Items)
            {
                if (list.Selected)
                {
                    foreach(ListItem item in paymentMode.Items)
                    {
                        if(item != list)
                        {
                            item.Selected = false;
                        }
                    }
  
                    break;
                }
            }
        }

        void LoadCartProduct()
        {
            List<Product> product = Session["cart"] as List<Product>;

            if (product!=null)
            {
                Cart_repeater.DataSource = product;
                Cart_repeater.DataBind();
                
            }
            else
            {
                Response.Write("No products");
            }

        }

        protected void PlaceOrder_Clicked(object sender , EventArgs args)
        {
            string Name = $"{CustomerName.Text.Trim().ToUpper()} {CustomerLastName.Text.Trim().ToUpper()}";
            string address = Address.Text.ToUpper();
            string State = CountryState.Text.ToUpper();
            string Country = country.Text.ToUpper();
            long postcode = long.Parse(Postcode.Text);
            long MobileN = long.Parse(Phone.Text);
            string email = Email.Text.ToUpper();

            string connectionString = DBconnection.DBCONNECTION();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string OrderInsert = "INSERT INTO ORDER_DETAILS(FULLNAME,ADDRESS,COUNTRYSTATE,COUNTRY,POSTCODE,PHONENUMBER,EMAILIC) VALUES(@name,@address , @state,@country,@postcode,@mobileN,@email)";
                SqlCommand cmd = new SqlCommand(OrderInsert,conn);
                cmd.Parameters.AddWithValue("@name", Name);
                cmd.Parameters.AddWithValue ("@address", address);
                cmd.Parameters.AddWithValue("@state", State);
                cmd.Parameters.AddWithValue("@country", Country);
                cmd.Parameters.AddWithValue("@postcode",postcode);
                cmd.Parameters.AddWithValue("@mobileN", MobileN);
                cmd.Parameters.AddWithValue("@email",email);

                int result = cmd.ExecuteNonQuery();

                if (result>0)
                {
                    //Response.Write("Order Place");
                    Response.Redirect("ConfirmOrder.aspx");
                   



                }
                else
                {
                    Response.Write("Facing some issues");
                }
            }



        }
    }
}