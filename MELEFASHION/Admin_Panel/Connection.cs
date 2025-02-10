using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;


namespace MELEFASHION.Admin_Panel
{
    public class Connection
    {
        public static string  DBconnection()
        {
            string conn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            return conn;
        }
    }
}