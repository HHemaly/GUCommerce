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
    public partial class addTelephone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if((string)(Session["field1"])==null || (string)(Session["field1"]) == "")
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //buttonclick++;
            //for (int i = 0; i < buttonclick; i++)
            //{
            //    TextBox tb = new TextBox();
            //    tb.ID = "Textbox" + buttonclick;
            //    PlaceHolder1.Controls.Add(tb);
            //    PlaceHolder1.Controls.Add(new LiteralControl("<br>"));
            //}
            // Response.Write(count.ToString());

            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("addMobile", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            if(TextBox1.Text == "" || TextBox1.Text == null)
            {
                Response.Write("You must write a phone number");
            }
            else
            {
                //To read the input from the user
                cmd.Parameters.Add(new SqlParameter("@username", (string)Session["field1"]));
                cmd.Parameters.Add(new SqlParameter("@mobile_number", TextBox1.Text));

                SqlParameter assert = cmd.Parameters.Add("@success", SqlDbType.Int);
                assert.Direction = ParameterDirection.Output;
                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    if (assert.Value.ToString().Equals("True"))
                    {
                        Response.Write("Success");
                    }else
                    Response.Write("Failed");
                    TextBox1.Text = "";
                }
                catch
                {
                    Response.Write("This phone number has been already added");
                }
                conn.Close();
            }

        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    for(int i = 0; i <= buttonclick; i++)
        //    {
        //        string field1 = (string)(Session["field1"]);

        //        string connStr = ConfigurationManager.ConnectionStrings["GUCComm"].ToString();

        //        SqlConnection conn = new SqlConnection(connStr);

        //        SqlCommand cmd = new SqlCommand("addMobile", conn);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        //it gives null
        //        TextBox tmp = (TextBox)PlaceHolder1.Controls[i] as TextBox;

        //        //pass parameters to the stored procedure
        //        cmd.Parameters.Add(new SqlParameter("@username", field1));
        //        cmd.Parameters.Add(new SqlParameter("@mobilenumber", tmp.Text));

        //        //Executing the SQLCommand
        //        conn.Open();
        //        try
        //        {
        //            cmd.ExecuteNonQuery();
        //            Response.Write("Success");
        //        }
        //        catch (SqlException ex)
        //        {
        //            Response.Write("Failed");
        //        }
        //        conn.Close();
        //    }
        //}
    }
}