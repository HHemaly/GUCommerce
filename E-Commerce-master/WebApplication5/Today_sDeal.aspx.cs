using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class Today_sDeal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void createTodaysDeal(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("createTodaysDeal", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string admin_username = (String)Session["field1"];
            string deal_amount = TextBox1.Text;
            string expiry_date = TextBox6.Text;

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@deal_amount", deal_amount));
            cmd.Parameters.Add(new SqlParameter("@admin_username", admin_username));
            cmd.Parameters.Add(new SqlParameter("@expiry_date", expiry_date));


            //SqlParameter count = cmd.Parameters.Add("@success", SqlDbType.Bit);
            //count.Direction = ParameterDirection.Output;

            //Save the output from the procedure
            /// SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);
            //count.Direction = ParameterDirection.Output;

            //Executing the SQLCommand
            //conn.Open();
            //cmd.ExecuteNonQuery();
            //conn.Close();

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("Todays Deal is created ");

            }
            catch (SqlException ex)
            {
                Response.Write("");

            }
            conn.Close();


            /*  if (count.Value.ToString().Equals("False"))
              {
                  Response.Write("Failed");

              }

              else
              {
                  Response.Redirect("login.aspx", true);

              }*/

        }

        protected void checkTodaysDealOnProduct(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["guccommerce"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("checkTodaysDealOnProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string serial_no = TextBox2.Text;



            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@serial_no", serial_no));



            //Save the output from the procedure
            SqlParameter activeDeal = cmd.Parameters.Add("@activeDeal", SqlDbType.Bit);
            activeDeal.Direction = ParameterDirection.Output;

            //Executing the SQLCommand
            //conn.Open();
            //cmd.ExecuteNonQuery();
            //conn.Close();
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                if (activeDeal.Value.ToString().Equals("True"))
                {
                    Response.Write("Todays Deal is active");

                }
                else
                    Response.Write("Todays Deal is not active");

            }
            catch (SqlException ex)
            {
                Response.Write("ERROR");

            }
            conn.Close();

        }

        protected void addTodaysDealOnProduct(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("addTodaysDealOnProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string deal_id = TextBox3.Text;
            string serial_no = TextBox8.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@deal_id", deal_id));
            cmd.Parameters.Add(new SqlParameter("@serial_no", serial_no));

            //Save the output from the procedure
            //SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);
            // count.Direction = ParameterDirection.Output;

            //Executing the SQLCommand
            // conn.Open();
            //cmd.ExecuteNonQuery();
            // conn.Close();

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();

                Response.Write("Todays Deal is added");



            }
            catch (SqlException ex)
            {
                Response.Write("ERROR");

            }
            conn.Close();



        }

        protected void removeExpiredDeal(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["guccommerce"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("removeExpiredDeal", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string deal_iD = TextBox4.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@deal_iD", deal_iD));

            //Save the output from the procedure
            SqlParameter check = cmd.Parameters.Add("@check", SqlDbType.Int);
            check.Direction = ParameterDirection.Output;

            //Executing the SQLCommand
            /*conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();*/
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                if (check.Value.Equals(1))
                {
                    Response.Write(" Deal expired removed");
                }
                else
                {
                    Response.Write("Deal is not expired yet");
                }



            }
            catch (SqlException ex)
            {
                Response.Write("ERROR");

            }
            conn.Close();


        }


    }
}