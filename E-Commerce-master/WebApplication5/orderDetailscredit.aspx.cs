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
    public partial class orderDetailscredit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)(Session["field1"]) == null || (string)(Session["field1"]) == "")
            {
                Response.Redirect("login.aspx", true);
            }
            else
            {
                Label order = new Label();
                order.Text = "Order id: " + Session["order"];
                Label tot = new Label();
                tot.Text = "Total Amount: " + Session["total"];
                PlaceHolder1.Controls.Add(order);
                PlaceHolder1.Controls.Add(new LiteralControl("<br>"));
                PlaceHolder1.Controls.Add(tot);
                PlaceHolder1.Controls.Add(new LiteralControl("<br>"));
            }
        }


        protected void choosecredit(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("ChooseCreditCard", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (creditnum.Text == "")
            {
                Response.Write("You must write a credit card number");
            }
            else
            {

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@creditcard", creditnum.Text));
                cmd.Parameters.Add(new SqlParameter("@orderid", Session["order"]));
                //Executing the SQLCommand
                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();

                    SqlCommand command = new SqlCommand("SELECT creditCard_number FROM Orders WHERE order_no= @o", conn);
                    command.Parameters.Add("@o", SqlDbType.Int).Value = Session["order"];
                    SqlDataReader dR = command.ExecuteReader();
                    dR.Read();
                    if (dR.GetValue(0) == null || dR.GetValue(0).ToString() == "")
                    {
                        Response.Write("Credit card is not valid");
                    }
                    else
                    {
                        Response.Redirect("orderDetails2.aspx", true);
                    }
                    dR.Close();
                }
                catch(SqlException ex)
                {
                    Response.Write(ex.Message);
                }
                conn.Close();
            }
        }

    } 
}