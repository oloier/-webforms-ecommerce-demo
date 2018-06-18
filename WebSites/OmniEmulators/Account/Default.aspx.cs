using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OmniModels;

public partial class Account_Default : System.Web.UI.Page
{
    protected OmniContext _db = new OmniContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] != null)
        {
            //// Bounce back logged in customers
            //Response.Redirect("/Account?report=You are already logged in");
            //// Hide registration of new customers, disabled for testing purposes
            //regLink.Visible = false;
        }
    }

    protected void LogIn(object sender, EventArgs e)
    {
        // Match the username/password in database
        string Username = username.Text;
        string Password = password.Text;
        if (Username != "" && Password != "")
        {
            Customer LoggedInCustomer = _db.Customers
                .FirstOrDefault(m => m.custusername == Username && m.custpassword == Password);

            // Check to make sure we found an entry
            if (LoggedInCustomer == null)
            {
                report.Visible = true;
            }
            else
            {
                // Update session and inform customer
                Session["Customer"] = LoggedInCustomer;
                if (Session["cart"] != null)
                {
                    // redirect to cart/checkout for logged in people
                    Response.Redirect("/Cart?report=Logged in! Welcome, " + LoggedInCustomer.custfirstname);
                }
                else
                {
                    Response.Redirect("/?report=Logged in! Welcome, " + LoggedInCustomer.custfirstname);
                }
            }

        }
        else report.Visible = true;
    }

}