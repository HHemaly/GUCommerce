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
    public partial class PostOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void post(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("addOffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string offeramount = txt_offeramount.Text;
            string expirydate = txt_expirydate.Text;
            if (Session["field1"].Equals(null))
            {
                Response.Redirect("login.aspx", true);
            }
            if (offeramount.Trim().Length == 0 || expirydate.Trim().Length == 0)
            {
                Response.Write("Please fill in all details.");
            }
            else
            {
                try
                {
                    cmd.Parameters.Add(new SqlParameter("@offeramount", Int32.Parse(offeramount)));
                }
                catch (Exception)
                {
                    Response.Write("Please enter an integer in the offer amount input box.");
                }
                try
                {
                    cmd.Parameters.Add(new SqlParameter("@expiry_date", expirydate));
                }
                catch (SqlException)
                {
                    Response.Write("Please enter the date as MM/DD/YYYY.");
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
                if(assert.Value == null)
                {
                    Response.Write("Incorrect input format.");
                }
                else if (assert.Value.ToString().Equals("1"))
                {
                    Response.Write("The offer was added successfully.");
                }
            }
        }

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("VendorHome.aspx", true);
        }
    }
}
