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
    public partial class Post : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void post(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("postProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string vendorUsername = (string)(Session["field1"]);
            if (vendorUsername.Trim().Length == 0)
            {
                Response.Redirect("login.aspx", true);
            }
            string product_name = txt_productname.Text;
            string category = txt_category.Text;
            string product_description = txt_productdescription.Text;
            string price = txt_price.Text;
            string color = txt_color.Text;
            if (product_name.Trim().Length == 0 || category.Trim().Length == 0 || product_description.Trim().Length == 0
                || price.Trim().Length == 0 || color.Trim().Length == 0)
            {
                Response.Write("Please fill in all details.");
            }
            else
            {

                cmd.Parameters.Add(new SqlParameter("@vendorUsername", vendorUsername));
                cmd.Parameters.Add(new SqlParameter("@product_name", product_name));
                cmd.Parameters.Add(new SqlParameter("category", category));
                cmd.Parameters.Add(new SqlParameter("@product_description", product_description));
                try
                {
                    cmd.Parameters.Add(new SqlParameter("@price", Decimal.Parse(price)));
                }
                catch (Exception)
                {
                    Response.Write("Please enter a decimal number in the price input box.");
                }
                cmd.Parameters.Add(new SqlParameter("@color", color));


                SqlParameter assert = cmd.Parameters.Add("@assert", SqlDbType.Int);
                assert.Direction = ParameterDirection.Output;
                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                catch (SqlException)
                {
                    Response.Write("Failed. Database exception.");
                }

                if (assert.Value.ToString().Equals("1"))
                {
                    
                    Response.Write("Post operation was successfull.");
                }
                else
                {
                    Response.Write("Sorry, your product was not saved. Please reenter all product details.");
                }
            }
        }

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("VendorHome.aspx", true);
        }
    }
}
