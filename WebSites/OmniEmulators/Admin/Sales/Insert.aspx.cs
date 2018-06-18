using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using System.Data.Entity;
using OmniModels;

public partial class Admin_Sales_Insert : System.Web.UI.Page
{
    protected OmniContext _db = new OmniContext();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public void InsertItem()
    {
        using (_db)
        {
            var item = new OmniModels.Sale();

            TryUpdateModel(item);

            if (ModelState.IsValid)
            {
                // Save changes
                _db.Sales.Add(item);
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