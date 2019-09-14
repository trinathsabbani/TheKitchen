using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace TheKitchenProject
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        KitchenDBcontext kc = new KitchenDBcontext();
        protected void Button1_Click(object sender, EventArgs e)
        {
          //int returnconde = Convert.ToInt32( kc.SP_Login(TextBox1.Text, TextBox2.Text).ToList().Find(it=>it==TextBox1.Text));

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
         using(SqlConnection con = new SqlConnection(cs))
            {
            SqlCommand cmd = new SqlCommand("SP_Login",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", TextBox1.Text);
            cmd.Parameters.AddWithValue("@password", TextBox2.Text);

            con.Open();
            int returncode = (int)cmd.ExecuteScalar();
            if (returncode == -1)
            {
                lblMessage.Text = "Please register";
            }
            else
            {
                Session["user"] = TextBox1.Text;
                Response.Redirect("DisplayItems.aspx");
            }
            }
          
         
        }
    }
}