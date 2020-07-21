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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Btn_login_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("userLogin", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = txt_username.Text;
            string password = txt_password.Text;

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@user_password", password));

            //Save the output from the procedure
            SqlParameter count = cmd.Parameters.Add("@success", SqlDbType.Bit);
            count.Direction = ParameterDirection.Output;

            SqlParameter count2 = cmd.Parameters.Add("@type", SqlDbType.Int);
            count2.Direction = ParameterDirection.Output;

            //Executing the SQLCommand
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if ((username.Length == 0) || (password.Length == 0))
          
            {
                Response.Write("No username or password");
            }
            else
            {
                if (count.Value.ToString().Equals("False"))
                {
                    Response.Write("Failed");

                }
                else
                {
                    //To send response data to the client side (HTML)
              

                    /*ASP.NET session state enables you to store and retrieve values for a user
                    as the user navigates ASP.NET pages in a Web application.
                    This is how we store a value in the session*/
                    Session["field1"] = username;
                    Session["field2"] = count2.Value.ToString();
                    if (count2.Value.ToString().Equals("0"))
                    {

                        Response.Redirect("CustomerMain.aspx", true);
                    }
                    if (count2.Value.ToString().Equals("1"))
                    {

                        Response.Redirect("VendorHome.aspx", true);
                    }
                    if (count2.Value.ToString().Equals("2"))
                    {
                         Response.Redirect("Admin.aspx", true);
                    }
                    else
                    {
                        Response.Write("success"); 
                    }

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx", true);
        }
    }
}