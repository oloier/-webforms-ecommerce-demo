using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using System.Data.Entity;
using OmniModels;

public partial class Admin_Products_Insert : System.Web.UI.Page
{
    protected OmniContext _db = new OmniContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        // Always check for login and administrator priveleges
        bool IsAdmin = false;
        if (Session["Customer"] != null)
        {
            Customer Customer = (Customer)Session["customer"];
            if (Customer.custadmin)
            {
                IsAdmin = true;
            }
        }
        // If they're not logged in or not admin and we're not on the login page, push them there
        if (!IsAdmin)
        {
            Response.Redirect("/Admin?report=Only administrators are allowed access to the administration panel");
        }

    }

    public void InsertItem()
    {
        using (_db)
        {
            var item = new OmniModels.Game();

            TryUpdateModel(item);

            if (ModelState.IsValid)
            {
                // Save changes
                _db.Games.Add(item);
                _db.SaveChanges();

                Response.Redirect("Default");
            }
        }
    }

    protected void ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
        {
            Response.Redirect("Default");
        }
    }

}