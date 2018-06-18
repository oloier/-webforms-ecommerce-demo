using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_CustomerReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*
         * 
         * 1: Find the control that needs to receive the username value
         * : Populate the username value in the FormView control
         *  */

        TextBox username = (TextBox)FormView1.FindControl("custusernameTextBox");

        username.Text = Context.User.Identity.Name;


    }

    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }

    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        Response.Redirect("~/Default");
    }
}