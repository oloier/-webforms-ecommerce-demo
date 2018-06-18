using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using System.Data.Entity;
using OmniModels;

public partial class Admin_Sales_Edit : System.Web.UI.Page
{
    protected OmniContext _db = new OmniContext();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public void UpdateItem([FriendlyUrlSegmentsAttribute(0)]int? Id)
    {
        using (_db)
        {
            var item = _db.Sales.FirstOrDefault(m => m.saleid == Id);

            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", Id));
                return;
            }

            TryUpdateModel(item);

            if (ModelState.IsValid)
            {
                // Save changes here
                _db.SaveChanges();
                Response.Redirect("../Default");
            }
        }
    }

    public Sale GetItem([FriendlyUrlSegmentsAttribute(0)]int? Id)
    {
        if (Id == null)
        {
            return null;
        }

        using (_db)
        {
            return _db.Sales.FirstOrDefault(m => m.saleid == Id);
        }
    }

    protected void ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
        {
            Response.Redirect("../Default");
        }
    }

}