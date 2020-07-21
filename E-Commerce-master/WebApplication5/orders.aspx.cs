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
    public partial class orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void viewOrders(object sender, EventArgs e)
        { 
            

           Response.Redirect("reviewOrders.aspx", true);
        }


        protected void updateOrderStatus(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
           
            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("updateOrderStatusInProcess", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string order = TextBox1.Text;
           
            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@order_no", order));

            SqlParameter check = cmd.Parameters.Add("@check", SqlDbType.Int);
            check.Direction = ParameterDirection.Output;



            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                if (check.Value.Equals(1))
                { 
                Response.Write("Order is now In Process ");
            }
                else
                {
                    Response.Write("Order Number does not exist");
                }

            }
            catch (Exception ex) 
            {
              
                Response.Write("Please add an existing order number ");
            }
            finally
            {
                conn.Close();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx", true);
        }


        // if (count.Value.ToString().Equals("1"))
        // {
        //To send response data to the client side (HTML)
        //  Response.Write("Passed");

        /*ASP.NET session state enables you to store and retrieve values for a user
        as the user navigates ASP.NET pages in a Web application.
        This is how we store a value in the session*/
        //Session["field1"] = "HIIII";

        //To navigate to another webpage
        // Response.Redirect("Order.aspx", true);

        // }
        //else
        //{
        // Response.Write("Failed");
        // }


    }
    }

