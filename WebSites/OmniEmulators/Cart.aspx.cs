using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;
using OmniModels;
using System.Reflection;
using Microsoft.AspNet.Identity;

public partial class ShoppingCart : System.Web.UI.Page
{

    protected Cart Cart { get; set; }
    protected Customer Customer { get; set; }
    protected List<Game> Items { get; set; }
    protected OmniContext DbContext;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Load the cart, bind it to our page repeater
        Cart = (Cart)Session["cart"];
        Customer = (Customer)Session["customer"];

        if (Cart != null && Cart.Contents != null && Cart.Contents.Count > 0)
        {
            Items = Cart.Contents;
            CartContents.DataSource = Items;
            CartContents.DataBind();
        }
        else
        {
            Response.Redirect("/?report=Your cart is currently empty.");
        }

        if (Customer != null)
        {
            Authenticated.Visible = true;
        }
        else
        {
            Unauthenticated.Visible = true;
        }

    }

    protected void CartContents_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item | e.Item.ItemType == ListItemType.AlternatingItem)
        {
            // Assign an index to the row for removal later
            HiddenField Row = (HiddenField)e.Item.FindControl("RowID");
            Row.Value = e.Item.ItemIndex.ToString();
        }
    }

    protected void CartRemove_Click(object sender, EventArgs e)
    {
        // Navigate the stupid markup to find our row index. There must be an easier way to do this, not sure right now.
        HtmlButton btn = (HtmlButton)sender;
        RepeaterItem row = (RepeaterItem)btn.NamingContainer;
        HiddenField RowID = (HiddenField)row.FindControl("RowID");
        int rowToRemove = 0;
        int.TryParse(RowID.Value, out rowToRemove);

        // Nuke it, Rico.
        Cart.Remove(rowToRemove);

        // Update the session
        Session["cart"] = Cart;
    }

    protected void Checkout_Click(object sender, EventArgs e)
    {
        // Identity not working properly, or something. Skipping at the moment.
        //SalesOrder.custid = User.Identity.GetUserId<int>();
        if (Customer != null)
        {
            // Convert cart contents to a datatable, export to XML
            DataTable orderTable = ToDataTable(Cart.Contents);
            StringWriter writer = new StringWriter();
            orderTable.WriteXml(writer, XmlWriteMode.WriteSchema, false);
            string CartXml = writer.ToString();

            // Connect to our DB Context
            DbContext = new OmniContext();

            // Build the new Sales Order
            Sale SalesOrder = new Sale();
            SalesOrder.cartcontents = CartXml;
            SalesOrder.custid = Customer.custid;
            SalesOrder.total = Cart.Total;

            // Add to database
            DbContext.Sales.Add(SalesOrder);
            DbContext.SaveChanges();

            // empty out the cart
            Session["cart"] = null;

            // Send them to the thank you page
            Response.Redirect("/Thanks");
        }
        else
        {
            Response.Redirect("/Cart?report=Please login before completing your order");
        }
    }


    //
    // List to Datatable code provided by Harshil Raval via StackOverflow.com
    // https://stackoverflow.com/questions/18100783/how-to-convert-a-list-into-data-table
    //
    public static DataTable ToDataTable<T>(List<T> items)
    {
        DataTable dataTable = new DataTable(typeof(T).Name);

        //Get all the properties
        PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
        foreach (PropertyInfo prop in Props)
        {
            //Defining type of data column gives proper data table 
            var type = (prop.PropertyType.IsGenericType && prop.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>) ? Nullable.GetUnderlyingType(prop.PropertyType) : prop.PropertyType);
            //Setting column names as Property names
            dataTable.Columns.Add(prop.Name, type);
        }
        foreach (T item in items)
        {
            var values = new object[Props.Length];
            for (int i = 0; i < Props.Length; i++)
            {
                //inserting property values to datatable rows
                values[i] = Props[i].GetValue(item, null);
            }
            dataTable.Rows.Add(values);
        }
        //put a breakpoint here and check datatable
        return dataTable;
    }
}