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
    public partial class vendorRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e) { 
       string connStr = ConfigurationManager.ConnectionStrings["Project"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
        SqlCommand cmd = new SqlCommand("vendorRegister", conn);
        cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username1 = username.Text;
        string password1 = password.Text;
        string first_name = firstname.Text;
        string last_name = lastname.Text;
        string email1 = email.Text;
            string company = companyname.Text;
            string bank = bankaccno.Text;


            SqlParameter count = cmd.Parameters.Add("@success", SqlDbType.Bit);
            count.Direction = ParameterDirection.Output;

            //pass parameters to the stored procedure
            if ((username1.Length == 0) || username1.Contains(" ") || (password1.Length == 0) || password1.Contains(" ") || (email1.Length == 0) || email1.Contains(" ") || (first_name.Length == 0) || first_name.Contains(" ") || (last_name.Length == 0) || last_name.Contains(" ")|| (company.Length == 0) ||  (company.Contains(" ")) ||(bank.Length == 0)||(bank.Contains(" ")))

            {
                Response.Write("please fill all fields");
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@username", username1));
                cmd.Parameters.Add(new SqlParameter("@user_password", password1));
                cmd.Parameters.Add(new SqlParameter("@first_name", first_name));
                cmd.Parameters.Add(new SqlParameter("@last_name", last_name));
                cmd.Parameters.Add(new SqlParameter("@email", email1));
                cmd.Parameters.Add(new SqlParameter("@company_name", company));
                cmd.Parameters.Add(new SqlParameter("@bank_acc_no", bank));

                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();

                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message);

                }
                conn.Close();


                if (count.Value.ToString().Equals("False"))
                {
                    Response.Write("Failed");

                }

                else
                {
                    Response.Redirect("login.aspx", true);

                }


            }
        }
    }
}