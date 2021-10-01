using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP.NET
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // only calling id , purple - method, tool - properties
            PanOrder.Visible = PanPricing.Visible = false; // not to show the info

            if (!Page.IsPostBack) //  Page.IsPostBack == false
            {
                txtAddress.Visible = false;
                lblAddress.Visible = false;
                //
                //cboPizza.Items.Add(new ListItem("Select a Pizza", "0"));
                cboPizza.Items.Add(new ListItem("Vegetarian", "10")); // when we checked vegetarian pizza, we gonna associate with this one
                cboPizza.Items.Add(new ListItem("Hawaiian", "12")); // text/key - value *** associative key
                cboPizza.Items.Add(new ListItem("All dressed", "8"));
                cboPizza.Items.Add(new ListItem("Halal", "20"));
                //
                lstSize.Items.Add(new ListItem("Small", "1"));
                lstSize.Items.Add(new ListItem("Medium", "1.5"));
                lstSize.Items.Add(new ListItem("Large", "2"));

                lstSize.SelectedIndex = 0;

                //
                chklstToppings.Items.Add(new ListItem("Bacon", "3"));
                chklstToppings.Items.Add(new ListItem("Mushroom", "1.5"));
                chklstToppings.Items.Add(new ListItem("Extra Cheese", "2"));
                chklstToppings.Items.Add(new ListItem("Olive", "2.5"));
                //
                radlstCrust.Items.Add(new ListItem("Normal"));
                radlstCrust.Items.Add(new ListItem("Thin"));
                radlstCrust.Items.Add(new ListItem("Thick"));

                radlstCrust.SelectedIndex = 0;
            }
           
            if (cboPizza.SelectedIndex > 0)
            {
                
                calculatePrice();
             
            }
          
        }// end page load

        private void calculatePrice()
        {
            decimal baseP = 0, delivery = 0, total = 0, toppings = 0, subTotal = 0, tax = 0;

        

            baseP = Convert.ToDecimal(cboPizza.SelectedItem.Value) * Convert.ToDecimal(lstSize.SelectedItem.Value);
            litPricing.Text = "<br/><b> Base Price: $ </b> " + baseP + "<br/>";
            if (chkDelivery.Checked)
            {
                delivery = 3;
                litPricing.Text += "<b>Delivery Price: $ </b>" + delivery + "<br/>"; 
            }
            foreach (ListItem item in chklstToppings.Items)
            {
                // if a topping is selected, add the value of the topping, else add 0
                toppings += (item.Selected) ? Convert.ToDecimal(item.Value) : 0; // ternary operation  - a sharp if

            }
            litPricing.Text += "<b>Topping Price: $ </b>" + toppings + "<br/>";

            subTotal = toppings + baseP + delivery;
            litPricing.Text += "<b>Subtotal Price: $ </b>" + subTotal + "<br/>";

            tax = Math.Round((subTotal * Convert.ToDecimal(0.15)), 2) ;
            litPricing.Text += "<b>Taxes Price: $ </b>" + tax + "<br/>";

            total = Math.Round(subTotal + tax, 2);
            litPricing.Text += "<b>Total Price: $ </b>" + total + "<br/>";

            PanPricing.Visible = true;

        }// end function

        protected void chkDelivery_CheckChanged(object sender, EventArgs e)
        {
            /*  if (chkDelivery.Checked == true)
              {
                  txtAddress.Visible = lblAddress.Visible = true;
              }
              else
              {

                  txtAddress.Visible = lblAddress.Visible = false;
              } */

            txtAddress.Visible = lblAddress.Visible = chkDelivery.Checked;
            // txtAddress.Visible = lblAddress.Visible = (chkDelivery.Checked) ? true : false;
        }

        protected void btnOrderNow_Click(object sender, EventArgs e)
        {
            PanOrder.Visible = true;

            litOrder.Text = "Sir/Miss" + txtCustomer.Text + ", <br/> Your order for a " + lstSize.SelectedItem.Text
                + "<br/> " + cboPizza.SelectedItem.Text + " Pizza <br/> with toppings of: " + "<ul>";
            foreach (ListItem item in chklstToppings.Items)
            {
                litOrder.Text += item.Selected ? "<li>" + item.Text + "</li>" : "";
            }
            litOrder.Text += "</ul><br/>";
            litOrder.Text += "On a " + radlstCrust.SelectedItem.Text + " crust <br/>";
            if (chkDelivery.Checked == true)
            {
                litDelivery.Visible = true;
                litDelivery.Text = "The Pizza is picked up";
            }
            else
            {
                litDelivery.Visible = false;
            }

        }
    }// end public class
}// end namespace;