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
    public partial class addOrRemoveFromCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                    else
                    {
                        string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
                        //create a new connection
                        String username = Session["field1"].ToString();
                        SqlConnection conn = new SqlConnection(connStr);
                        SqlCommand cmd = new SqlCommand("viewMyCart", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@customer", username));
                        conn.Open();

                        cmd.ExecuteNonQuery();



                        //IF the output is a table, then we can read the records one at a time
                        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                        while (rdr.Read())
                        {
                            //Get the value of the attribute name in the Company table
                            string productName = rdr.GetString(rdr.GetOrdinal("product_name"));
                            //Get the value of the attribute field in the Company table
                            string description = rdr.GetString(rdr.GetOrdinal("product_description"));

                            decimal price = rdr.GetDecimal(rdr.GetOrdinal("price"));
                            decimal final_price = rdr.GetDecimal(rdr.GetOrdinal("final_price"));
                            string color = rdr.GetString(rdr.GetOrdinal("color"));

                            //Create a new label and add it to the HTML form
                            Label lbl_ProductName = new Label();
                            lbl_ProductName.Text = "<br /> <br />"+"product: " + productName + "  description:  ";
                            form1.Controls.Add(lbl_ProductName);
                            Label lbl_description = new Label();
                            lbl_description.Text = description + " price: ";
                            form1.Controls.Add(lbl_description);
                            Label lbl_price = new Label();
                            lbl_price.Text = price + " final_price: ";
                            form1.Controls.Add(lbl_price);
                            Label lbl_final_price = new Label();
                            lbl_final_price.Text = final_price + " color: ";
                            form1.Controls.Add(lbl_final_price);
                            Label lbl_color = new Label();
                            lbl_color.Text = color + "<br /> <br />";
                            form1.Controls.Add(lbl_color);
                        }

                        string field1 = (string)(Session["field1"]);
                        Response.Write(field1);
                    }

                }
            }
            catch (SqlException ex) { Response.Write(ex.Message); }
            catch (Exception excep) { Response.Write(excep.Message); }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addToCart.aspx", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemoveFromCart.aspx", true);
        }
    }
}
