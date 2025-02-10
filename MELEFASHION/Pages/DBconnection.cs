using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
namespace MELEFASHION.Pages
{
    public class DBconnection
    {
        public static  string DBCONNECTION()
        {
            string connstring = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            return connstring;
        }
    }
}