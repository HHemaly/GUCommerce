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
    public partial class reviewOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("orders.aspx", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("reviewOrders", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            try
            {

                cmd.ExecuteNonQuery();
                Response.Write("All Orders are here ");
                DataTable table = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(table);
                }
                this.GridView1.Visible = true;
                this.GridView1.DataSource = table;
                GridView1.DataBind();
            }
            catch (SqlException ex)
            {
                Response.Write("No Orders yet");
            }
            conn.Close();

        }
    }
}
