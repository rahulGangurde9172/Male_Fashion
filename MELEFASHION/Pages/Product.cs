using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MELEFASHION.Pages
{
    public class Product
    {
        public int ProductID { get; set; } // changes
        public string Name {  get; set; }
        public long Price {  get; set; }
        public int quantity {  get; set; }


        public string ProductImage { get; set; }    

        public long totalPrice => Price * quantity;

       
    }
}