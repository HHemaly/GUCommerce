using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication5
{
    public partial class ExpiredOffers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void remove(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("checkandremoveExpiredoffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string offerid = txt_offerid.Text;
            if (Session["field1"].Equals(null))
            {
                Response.Redirect("login.aspx", true);
            }

            if (offerid.Trim().Length == 0)
            {
                Response.Write("Please fill in all details.");
            }
            else
            {
                try
                {
                    cmd.Parameters.Add(new SqlParameter("@offerid", Int32.Parse(offerid)));
                }
                catch (Exception)
                {
                    Response.Write("Please enter an integer number in the offer id input box.");
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

                if (assert.Value.ToString().Equals("1"))
                {
                    Response.Write("The offer has expired and was removed successfully.");
                }
                else
                {
                    Response.Write("This offer may have not expired already or it may have been removed.");
                }
            }

        }

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("VendorHome.aspx", true);
        }
    }
}
