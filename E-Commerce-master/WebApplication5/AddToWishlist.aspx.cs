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
    public partial class AddToWishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["field1"] == null)
            {
                Response.Redirect("login.aspx", true);
            }
            else
            {
                if (Session["field2"].ToString() != "0")
                {
                    Response.Redirect("login.aspx");
                }

             
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
                //To read the input from the user
                string number = TextBox2.Text;
                string username = Session["field1"].ToString();
                string wish = TextBox1.Text; 
                //pass parameters to the stored procedure

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("AddtoWishlist", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if ((number.Length == 0) || number.Contains(" ")||(wish.Length==0) || wish.Contains(" "))
                    Response.Write("missing entries or ther is spaces ");

                else
                {
                    Response.Write(username);
                    cmd.Parameters.Add(new SqlParameter("@customername", username));
                    cmd.Parameters.Add(new SqlParameter("@serial", number));
                    cmd.Parameters.Add(new SqlParameter("@wishlistname", wish));


                    SqlParameter count = cmd.Parameters.Add("@available", SqlDbType.Bit);
                    count.Direction = ParameterDirection.Output;

                    conn.Open();

                    cmd.ExecuteNonQuery();


                    conn.Close();
                    if (count.Value.ToString().Equals("False"))
                    {
                        Response.Write("product no available");

                    }
                    else
                    {
                        Response.Write("success");



                    }
                }


            }
            catch (SqlException ex) { Response.Write("failed"); }
            catch (Exception excep) { Response.Write(excep.Message); }
        }


    }
}
        

