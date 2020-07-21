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
    public partial class orderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)(Session["field1"]) == null || (string)(Session["field1"]) == "")
            {
                Response.Redirect("login.aspx",true);
            }
            else
            {
                Label order = new Label();
                order.Text = "Order id: "+ Session["order"];
                Label tot = new Label();
                tot.Text = "Total Amount: "+ Session["total"];
                PlaceHolder1.Controls.Add(order);
                PlaceHolder1.Controls.Add(new LiteralControl("<br>"));
                PlaceHolder1.Controls.Add(tot);
                PlaceHolder1.Controls.Add(new LiteralControl("<br>"));
            }

        }

        protected void specifyamount(object sender, EventArgs e)
        {
            string field1 = (string)(Session["field1"]);

            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            if (cashamount.Text == "" || creditamount.Text == "")
            {
                Response.Write("You must fill all the textboxes");
            }
            else
            {

                SqlCommand cmd = new SqlCommand("specifyAmount", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@customername", field1));
                cmd.Parameters.Add(new SqlParameter("@orderID", Session["order"]));
                cmd.Parameters.Add(new SqlParameter("@cash", cashamount.Text));
                cmd.Parameters.Add(new SqlParameter("@credit", creditamount.Text));

                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    SqlCommand command = new SqlCommand("SELECT credit_amount,cash_amount FROM Orders WHERE order_no = @o", conn);
                    command.Parameters.Add("@o", SqlDbType.Int).Value = Session["order"];
                    SqlDataReader dR = command.ExecuteReader();
                    dR.Read();
                    Console.WriteLine(dR.GetValue(0));
                    Console.WriteLine(dR.GetValue(1));
                    if ((dR.GetValue(0) == null && dR.GetValue(1) == null))
                    {
                        Response.Write("Invalid payment");
                    }
                    else
                    {
                        if (dR.GetValue(0).ToString() != "")
                            Response.Redirect("orderDetailscredit.aspx", true);//credit
                        else if (dR.GetValue(1).ToString() != "")
                            Response.Redirect("orderDetails2.aspx", true); //cash
                    }
                    dR.Close();
                }
                catch (SqlException ex)
                {
                    Response.Write("Failed");
                }
                conn.Close();
            }
        }
    }
}