using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OmniModels;

public partial class Admin_Sale : System.Web.UI.Page
{
    protected OmniContext _db = new OmniContext();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public IQueryable<OmniModels.Sale> GetData()
    {
        return _db.Sales;
    }
}