using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices.CompensatingResourceManager;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace MELEFASHION.Admin_Panel
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowProductData();
            }
            else
            {
                ShowProductData();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string Name = txtProductName.Text;
            long Stock = long.Parse(txtProductStock.Text);
            long Price = long.Parse(txtProductPrice.Text);
            string Description = txtProductDescription.Text;

            InsertProduct(Name,Stock,Price,Description);
            ShowProductData();
        }

        void InsertProduct(string pname , long pstock , long Pprice ,string pdescription)
        {
            string ConnectionString = Connection.DBconnection();

            string path = Server.MapPath("images/");

            if (ProductImage.HasFile)
            {
                string Filename = Path.GetFileName(ProductImage.FileName);
                string FileExtension = Path.GetExtension(Filename).ToLower();

                HttpPostedFile postedFile = ProductImage.PostedFile;

                if (FileExtension.Equals(".jpg") || FileExtension.Equals(".jpeg") || FileExtension.Equals(".png"))
                {
                    ProductImage.SaveAs(path + Filename);
                    //string name = "images/" + Filename;
                    string name = "/Admin_Panel/images/" + Filename;


                    using (SqlConnection conn = new SqlConnection(ConnectionString))
                    {
                        string insertProduct = "INSERT INTO PRODUCTS (Product_Name,Product_Stock, Product_Price,Product_Description,Product_Image) VALUES(@pname,@pstock,@pPrice,@pdesc,@pimg)";
                        SqlCommand cmd = new SqlCommand(insertProduct, conn);
                        cmd.Parameters.AddWithValue("@pname", pname);
                        cmd.Parameters.AddWithValue("@pstock", pstock);
                        cmd.Parameters.AddWithValue("@pPrice", Pprice);
                        cmd.Parameters.AddWithValue("@pdesc", pdescription);
                        cmd.Parameters.AddWithValue("@pimg", name);
                        conn.Open();
                        int result = cmd.ExecuteNonQuery();
                        conn.Close();
                        if (result > 0)
                        {
                            //Response.Write("Data insert succesful");
                            Alert.Attributes["class"] = "alert alert-success d-block";
                            Alert.InnerText = "Product Added";
                            EmptyTxt();
                        }
                        else
                        {
                            Alert.Attributes["class"] = "alert alert-danger d-block";  
                            Alert.InnerText = "Data insert failed";
                            //Response.Write("Data insert fails");
                        }
                    }

                }
                else
                {
                    Response.Write("Invalid File Extension");
                }
            }


        }

        void EmptyTxt()
        {
            txtProductName.Text = "";
            txtProductStock.Text = "";
            txtProductPrice.Text = "";
            txtProductDescription.Text = "";
            ProductImage.Attributes.Clear();
        }

        void ShowProductData()
        {
            string ConnectionString = Connection.DBconnection();

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                string selectQuery = "SELECT * FROM PRODUCTS";
                SqlDataAdapter DA = new SqlDataAdapter(selectQuery,conn);
                DataTable tbl = new DataTable();
                DA.Fill(tbl);
                productData.DataSource = tbl;
                productData.DataBind();

            }
        }

        protected void productData_SelectedIndexChanged(object sender, EventArgs e)
        {
            //name , stock , price , desciption,img
        
            GridViewRow row = productData.SelectedRow;
            string Name = row.Cells[1].Text;
            string Stock = row.Cells[2].Text;
            string Price = row.Cells[3].Text;
            string Desciption = row.Cells[4].Text;

            //string img = row.Cells[1].Text;

            txtProductName.Text = Name;
            txtProductStock.Text = Stock.ToString();
            txtProductPrice.Text = Price.ToString();
            txtProductDescription.Text = Desciption;
        }

    }
}