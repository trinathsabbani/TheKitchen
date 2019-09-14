using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheKitchenProject
{
    public partial class Cart_items : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Items"] != null)
            {
                Label1.Text = Session["Items"].ToString();
            }
            else
            {
                Label1.Text = "NO items added to cart";
            }

            if (Session["NumberofItems"] != null)
            {
                Label2.Text = Session["NumberofItems"].ToString();
            }
            else
            {
                Label2.Text = "NO items added to cart";
            }

            if (Session["price"] != null)
            {
                Label3.Text = Session["price"].ToString();
            }
            else
            {
                Label3.Text = "NO items added to cart";
            }


        }
    }
}