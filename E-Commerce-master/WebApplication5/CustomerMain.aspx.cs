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
    public partial class CustomerMain : System.Web.UI.Page
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
            string field1 = (string)(Session["field1"]);

            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand command = new SqlCommand("SELECT points FROM Customer WHERE username = @c", conn);
            command.Parameters.Add("@c", SqlDbType.VarChar, 20).Value = Session["field1"];
            SqlDataReader dR = command.ExecuteReader();
            dR.Read();
            Label point = new Label();
            point.Text = "Points: " + dR.GetValue(0).ToString();
            Points.Controls.Add(point);
            dR.Close();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("customerviewProducts.aspx", true);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("addOrRemoveFromWishlist.aspx", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("addCreditCard.aspx", true); 
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("addOrRemoveFromCart.aspx", true);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("addTelephone.aspx", true);
        }


        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("cartView.aspx", true);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewAllOrders.aspx", true);
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Session["field1"] = null;
            Response.Redirect("login.aspx", true);
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("createWishlist.aspx", true);
        }
    }
}