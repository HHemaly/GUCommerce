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
    public partial class cartView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)(Session["field1"]) == null || (string)(Session["field1"]) == ""){
                Response.Redirect("login.aspx");
            }
            else {
                fill();
            }
        }

        protected void makeOrder_Click(object sender, EventArgs e)
        {
            string field1 = (string)(Session["field1"]);

            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("makeOrder", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", field1));

            //Executing the SQLCommand
            conn.Open();
            cmd.ExecuteNonQuery();

            SqlCommand command = new SqlCommand("SELECT MAX(O.order_no) FROM Orders O WHERE O.customer_name = @cus", conn);
            command.Parameters.Add("@cus", SqlDbType.VarChar, 20).Value = field1;

            SqlDataReader dR = command.ExecuteReader();
            dR.Read();

            Session["order"] = Convert.ToInt32(dR.GetValue(0));
            dR.Close();

            SqlCommand command2 = new SqlCommand("SELECT total_amount FROM Orders WHERE order_no = @o", conn);
            command2.Parameters.Add("@o", SqlDbType.Int).Value = Session["order"];
            SqlDataReader dR2 = command2.ExecuteReader();
            dR2.Read();
            Session["total"] = dR2.GetValue(0);
            dR2.Close();

            conn.Close();

            Response.Redirect("orderDetails.aspx", true);
        }

        protected void fill()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlDataAdapter sda = new SqlDataAdapter("exec viewMyCart @user", conn);
            sda.SelectCommand.Parameters.Add("@user", (string)(Session["field1"]));
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Session["field1"] = null;
            Response.Redirect("login.aspx", true);
        }
    }
}