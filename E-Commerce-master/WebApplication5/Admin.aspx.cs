
            using System;
            using System.Collections.Generic;
            using System.Linq;
            using System.Web;
            using System.Web.UI;
            using System.Web.UI.WebControls;
            using System.Configuration;
            using System.Data.SqlClient;
            using System.Data;

namespace WebApplication5
    {
        public partial class Admin : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {


            }
            protected void toActivateVendor(object sender, EventArgs e)
            {
                //Get the information of the connection to the database
                string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("activateVendors", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                //Session["field1"] = username;
                //To read the input from the user
       
                string admin = (String)Session["field1"];
                string vendor = TextBox1.Text;

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@admin_username", admin));
                cmd.Parameters.Add(new SqlParameter("@vendor_username", vendor));

            //Save the output from the procedure
             SqlParameter check = cmd.Parameters.Add("@check", SqlDbType.Int);
             check.Direction = ParameterDirection.Output;

            //Executing the SQLCommand
            //conn.Open();
            //cmd.ExecuteNonQuery();
            //conn.Close();
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                if (check.Value.Equals(1))
                {
                   
                    Response.Write("Vendor is activated");
                }
                else
                {
                    Response.Write("No vendor with this username");
                }

               
            }
            catch (SqlException ex) {
                Response.Write("ERROR") ;
            }
            conn.Close();


            //  if (count.Value.ToString().Equals("1"))
            // {
            //To send response data to the client side (HTML)
            //  Response.Write("Vendor activated");
            //// ??????????????????????????????????????
            //  cmd.Parameters.Add(new SqlParameter("@activated", 1));

            /*ASP.NET session state enables you to store and retrieve values for a user
            as the user navigates ASP.NET pages in a Web application.
            This is how we store a value in the session*/
            // Session["field1"] = "HIIII";

            //To navigate to another webpage
            // Response.Redirect("orders.aspx", true);

            ////  }
            //else
            // {
            //   Response.Write("Vendor not found");
            //}


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("orders.aspx", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Today_sDeal.aspx", true);
        }
    }
    }
