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
    public partial class viewAllOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)(Session["field1"]) == null || (string)(Session["field1"]) == "")
                Response.Redirect("login.aspx", true);
            else
                viewO();
        }
        protected void cancelOrder(object sender, EventArgs e)
        {
            string field1 = (string)(Session["field1"]);

            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            if (TextBox1.Text.ToString() == null || TextBox1.Text.ToString() == "")
            {
                Response.Write("You must write an order number");
            }
            else
            {
                SqlCommand command = new SqlCommand("SELECT * FROM Orders WHERE order_no = @o", conn);
                command.Parameters.Add("@o", SqlDbType.Int).Value = Convert.ToInt32(TextBox1.Text.ToString());
                SqlDataReader dR = command.ExecuteReader();
                dR.Read();
                //pass parameters to the stored procedure
                if (dR == null) { Response.Write("Write a correct order number"); }
                else
                {
                    dR.Close();
                    SqlCommand cmd = new SqlCommand("cancelOrder", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@orderid", TextBox1.Text.ToString()));

                    //Executing the SQLCommand
                    try
                    {
                        cmd.ExecuteNonQuery();
                        //Response.Write("Success");
                        Response.Redirect("viewAllOrders.aspx");
                    }
                    catch (SqlException ex)
                    {
                        Response.Write("Failed");
                    }
                }
            }
            conn.Close();


        }
        protected void viewO()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlDataAdapter sda = new SqlDataAdapter("select * from Orders where customer_name = @user", conn);
            //3ayza hena fl query select * from CustomerAddsToCartProduct where custome_name = user"
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