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
    public partial class orderDetails2 : System.Web.UI.Page
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
                fill();
            }

        }

        protected void comfirmDel(object sender, EventArgs e)
        {
            string field1 = (string)(Session["field1"]);

            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("specifydeliverytype", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            if (TextBox1.Text.ToString() == null || TextBox1.Text.ToString() == "")
            {
                Response.Write("Failed");
            }

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@deliveryID", TextBox1.Text.ToString()));
            cmd.Parameters.Add(new SqlParameter("@orderID", Session["order"]));


            //Executing the SQLCommand
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("Order has completed successfully.");
                Session["order"] = "";
                Session["total"] = "";
            }
            catch (SqlException ex)
            {
                Response.Write("Failed");
            }
            conn.Close();
        }
        protected void fill()
        {
            string connSt = ConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection con = new SqlConnection(connSt);
            SqlDataAdapter sda = new SqlDataAdapter("exec vewDeliveryTypes", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            con.Close();
        }
    }
}