using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication5
{
    public partial class ViewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void view(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("vendorviewProducts", conn);
            cmd.CommandType = CommandType.StoredProcedure;


            if (Session["field1"].Equals(null))
            {
                Response.Redirect("login.aspx", true);
            }
            cmd.Parameters.Add(new SqlParameter("@vendorname", (string)Session["field1"]));

            SqlParameter assert = cmd.Parameters.Add("@assert", SqlDbType.Int);
            assert.Direction = ParameterDirection.Output;

            DataTable table = new DataTable();

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
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                da.Fill(table);
            }

            if (assert.Value.ToString().Equals("1"))
            {

                Response.Write("View operation was succesfull.");
                this.GridView1.Visible = true;
                this.GridView1.DataSource = table;
                GridView1.DataBind();


            }

        }

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("VendorHome.aspx", true);
        }
    }
}
