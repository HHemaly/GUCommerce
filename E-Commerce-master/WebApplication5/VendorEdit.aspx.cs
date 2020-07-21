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
    public partial class VendorEdit : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void edit(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("EditProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string vendorname = (string)(Session["field1"]);
            if (vendorname.Trim().Length == 0)
            {
                Response.Redirect("login.aspx", true);
            }
            string serialnumber = txt_serialnumber.Text;
            string productname = txt_productname.Text;
            string category = txt_category.Text;
            string productdescription = txt_productdescription.Text;
            string price = txt_price.Text;
            string color = txt_color.Text;



            SqlParameter assert = cmd.Parameters.Add("@assert", SqlDbType.Int);
            assert.Direction = ParameterDirection.Output;
            if (serialnumber.Trim().Length == 0 || productname.Trim().Length == 0 ||
                category.Trim().Length == 0 || productdescription.Trim().Length == 0 || price.Trim().Length == 0 || color.Trim().Length == 0)
            {
                Response.Write("Please fill in all details.");
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@vendorname", vendorname));
                try
                {
                    cmd.Parameters.Add(new SqlParameter("@serialnumber", Int32.Parse(serialnumber)));
                }
                catch (Exception)
                {
                    Response.Write("Please enter an integer in the serial number input box.");
                }
                cmd.Parameters.Add(new SqlParameter("@product_name", productname));
                cmd.Parameters.Add(new SqlParameter("@category", category));
                cmd.Parameters.Add(new SqlParameter("@product_description", productdescription));
                try
                {
                    cmd.Parameters.Add(new SqlParameter("@price", Decimal.Parse(price)));
                }
                catch (Exception)
                {
                    Response.Write("Please enter a decimal or an integer number in the price input box.");
                }
                cmd.Parameters.Add(new SqlParameter("@color", color));

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

                if (assert.Value.ToString().Equals("2"))
                {
                    Response.Write("This product has already been added to the cart of some customer and cannot be edited.");
                }
                if (assert.Value.ToString().Equals("1"))
                {
                    Response.Write("Edit operation was successfull.");
                }
                if (assert.Value.ToString().Equals("3"))
                {
                    Response.Write("You have to be the vendor who posted this product in order to edit it.");
                }
            }
        }

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("VendorHome.aspx", true);
        }
    }
}
