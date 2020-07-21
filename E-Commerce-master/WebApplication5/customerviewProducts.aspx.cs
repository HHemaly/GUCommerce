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
    public partial class viewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try { 
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
                        SqlConnection conn = new SqlConnection(connStr);
                        SqlCommand cmd = new SqlCommand("showProducts", conn);
                        cmd.CommandType = CommandType.StoredProcedure;

                        conn.Open();

                        cmd.ExecuteNonQuery();

                        DataTable t = new DataTable();
                        using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(t);
                        }
                        this.GridView1.Visible = true;
                        this.GridView1.DataSource = t;
                        GridView1.DataBind();


                        

                        string field1 = (string)(Session["field1"]);
                        Response.Write(field1);
                    }
                  
                }
            }
            catch (SqlException ex) { Response.Write(ex.Message); }
            catch (Exception excep) { Response.Write(excep.Message); }
        }
    }
}