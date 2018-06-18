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
    protected Customer Customer { get; set; }
    protected bool IsAdmin { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] != null)
        {
            Customer = (Customer)Session["customer"];
            IsAdmin = Customer.custadmin;
            
            if (IsAdmin)
            {
                panel.Visible = false;
                regLink.Visible = false;
            } 
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
                // Check for administrator before committing
                Customer = LoggedInCustomer;
                IsAdmin = Customer.custadmin;
                Session["Customer"] = LoggedInCustomer;
                if (IsAdmin)
                {
                    // here to hide login and confirm admin login
                    Response.Redirect("/Admin?report=Logged in! Welcome, " + LoggedInCustomer.custfirstname +"...you administrator you.");
                }
            }
        }
    }

}