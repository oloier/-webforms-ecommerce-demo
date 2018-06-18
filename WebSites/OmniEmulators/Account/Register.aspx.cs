using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OmniModels;

public partial class Account_Register : System.Web.UI.Page
{
    protected OmniContext _db = new OmniContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] != null)
        {
            Response.Redirect("/?report=You are already logged in");
        }
    }

    protected void Register(object sender, EventArgs e)
    {
        if (RegistrationValidated())
        {
            // Build the new customer
            Customer newCustomer = new Customer();
            newCustomer.custusername = username.Text;
            newCustomer.custpassword = password.Text;
            newCustomer.custfirstname = firstname.Text;
            newCustomer.custlastname = lastname.Text;
            DateTime birthday = Convert.ToDateTime(dob.Text);
            newCustomer.custdob = birthday;
            newCustomer.custemail = email.Text;
            newCustomer.custphone = phone.Text;
            newCustomer.custaddress1 = address1.Text;
            newCustomer.custaddress2 = address2.Text;
            newCustomer.custcity = city.Text;
            newCustomer.custstate = state.Text;
            newCustomer.custzip = zip.Text;
            // Let users register as admins, testing purposes.
            newCustomer.custadmin = admin.Checked;

            // Got it all built up, commit it.
            try
            {
                _db.Customers.Add(newCustomer);
                _db.SaveChanges();
                // as long as it committed to the DB, update session and push them through
                Session["Customer"] = newCustomer;
                Response.Redirect("/?report=Welcome, "+ firstname.Text +"! You're now logged in.");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

    private bool RegistrationValidated()
    {
        if ((username.Text ?? password.Text ?? firstname.Text ?? dob.Text ?? email.Text ?? phone.Text ?? address1.Text ?? address2.Text ?? city.Text ?? state.Text ?? zip.Text) == "")
        {
            return false;
        }
        return true;
    }
}