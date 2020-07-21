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
    public partial class ApplyOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void apply(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("applyOffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string vendorname = (string)(Session["field1"]);
            string serial = txt_serial.Text;
            string offerid = txt_offerid.Text;

            if (vendorname.Trim().Length == 0)
            {
                Response.Redirect("login.aspx", true);
            }


            if (serial.Trim().Length == 0 || offerid.Trim().Length == 0)
            {
                Response.Write("Please fill in all details.");
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@vendorname", vendorname));
                try
                {
                    cmd.Parameters.Add(new SqlParameter("@serial", Int32.Parse(serial)));
                    cmd.Parameters.Add(new SqlParameter("@offerid", Int32.Parse(offerid)));
                }
                catch (Exception)
                {
                    Response.Write("Please enter an integer number in the serial number and offer id input fields.");
                }

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

                if (assert.Value.ToString().Equals("0"))
                {
                    Response.Write("This product already has an active offer. Please choose another product.");
                }
                else if(assert.Value.ToString().Equals("1"))
                {
                    Response.Write("The offer was successfully applied to the specified product.");
                }
            }
        }

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("VendorHome.aspx", true);
        }
    }
}
