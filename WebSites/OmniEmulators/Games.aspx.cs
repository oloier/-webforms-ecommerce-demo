using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Games : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_addtocart_Click(object sender, EventArgs e)
    {
        // Get the control and value of the flight (product) number
        Label gamenum = (Label)FormView1.FindControl("gamenumLabel");
        string gamenumber = gamenum.Text;

        // Create local array for games
        ArrayList games = new ArrayList();

        // Get the current game values from the session variable
        // What the customer has already purchased in the past
        games = (ArrayList)Session["cartgame"];

        // Add the new selection to the temporary local arrays
        games.Add(gamenumber);     // Flight Number

        // Update the session variables with the values in the local arrays
        Session["cartgame"] = games;

        // Send the user to view the contents of the shopping cart
        Response.Redirect("cart.aspx");

    }

}