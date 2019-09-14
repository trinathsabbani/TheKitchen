using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheKitchenProject
{
    public partial class DisplayItems : System.Web.UI.Page
    {
        KitchenDBcontext kc = new KitchenDBcontext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                
                userlbl.Text = "Welcome"+"  " +(Session["user"].ToString());
            }

            if (!IsPostBack)
            {
                DropDownList1.DataTextField = "Category";
                DropDownList1.DataValueField = "Id";
                DropDownList1.DataSource = kc.tbl_Category.ToList();
                DropDownList1.DataBind();

                DropDownList1.Items.Insert(0, new ListItem() { Text = "---select category----", Value = "-1" });
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != "-1")
            {
                if (IsValid)
                {
                    GridView1.DataSource = Items(Convert.ToInt32(DropDownList1.SelectedValue));
                    GridView1.DataBind();

                    DropDownList2.DataTextField = "Description";
                    DropDownList2.DataValueField = "Id";
                    DropDownList2.DataSource = ItemsSelection(Convert.ToInt32(DropDownList1.SelectedValue));
                    DropDownList2.DataBind();
                }
            }
        }
       
        protected List<Sp_Display_Result> Items(int id)
        {
            return  kc.Sp_Display(id).ToList();
           
        }
        protected List<Sp_Select_Result> ItemsSelection(int id)
        {
            return kc.Sp_Select(id).ToList();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Session["Items"] = DropDownList2.SelectedItem.Text;
            Session["NumberofItems"] = DropDownList3.SelectedItem.Text;

            Sp_Price_Result classprice = kc.Sp_Price(Convert.ToInt32(DropDownList2.SelectedValue)).ToList().FirstOrDefault(it => it.id == Convert.ToInt32(DropDownList2.SelectedValue));
            int i = Convert.ToInt32(DropDownList3.SelectedItem.Text);
            int bill = Convert.ToInt32(classprice.price) * i;
          Session["price"] =  Label1.Text = bill.ToString();

          Response.Write("items added to cart");
           
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Sp_Price_Result classprice = kc.Sp_Price(Convert.ToInt32(DropDownList2.SelectedValue)).ToList().FirstOrDefault(it => it.id == Convert.ToInt32(DropDownList2.SelectedValue));
            int i = Convert.ToInt32(DropDownList3.SelectedItem.Text);
            int bill = Convert.ToInt32(classprice.price) * i;
            Label1.Text = bill.ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart items.aspx");
        }
    }
}