using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

public partial class ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource ds = new SqlDataSource();

        // Create local array games
        ArrayList games = new ArrayList();

        // get the current games and values from the session
        games = (ArrayList)Session["cartgame"];


        if (games.Count > 0)
        {
            //README 
            // THIS IS THE ORIGINAL CODE THAT MADE AN SQL STATEMENT IM NOT SURE HOW TO CHANGE IT TO MY GAME TABLE
            // ANYWHERE THAT HAS FLIGHT, IT SHOULD BE GAME INSTEAD, I left the "f.flightnum" because i dont know
            // where the f gets defined and dont know how to connect it to games instead
            // HE HAD FLIGHTS AND SEATS IN HIS

            //string sqlstatement = "SELECT ROW_NUMBER() over(order by f.flightnum) as ROWNUM, f.flightnum, l.locname as origination, l2.locname as destination, f.departtime, f.arrivaltime, f.aircraft, f.priceeconbasic, 0 as QTY_ORDER, 0 as LineTotal  FROM Flight f,  Location l, Location l2 WHERE f.originlocid = l.locid AND f.destlocid = l2.locid AND ( ";
            string sqlstatement = "temporary to be changed";

            if (games.Count > 1)
            {
                // SQL NEEDS TO BE GAMES ISNTEAD OF FLIGHTS BUT I DIDNT WANNA PUT WRONG THING IN
                sqlstatement = sqlstatement + "f.flightnum = '" + games[0].ToString() + "' ";
                for (int i = 1; i < games.Count; i++)
                {
                    sqlstatement = sqlstatement + " OR f.flightnum = '" + games[i].ToString() + "' ";
                }
            }
            else
            {
                sqlstatement = sqlstatement + " f.flightnum = '" + games[0].ToString() + "' ";
            }
            sqlstatement = sqlstatement = ")";



            ds.SelectCommand = sqlstatement;
            ds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["omniemulatorsConnectionString"].ConnectionString;

            ds.DataBind();

            GridView1.DataSource = ds;
            GridView1.DataBind();



            // Populate Seat Quantities
            // for (int i = 0; i < seats.Count; i++)
            // {
            //      GridView1.Rows[i].Cells[9].Text = seats[i].ToString();
            //  }


        
            // SOME OF THESE VARIABLES MIGHT BE BROKEN BECAUSE IT WAS TO HIS BUT THIS BASICALLY JUST GETS
            // THE QUANTITIES AND ADDS THEM UP, I FIXED THE CELLS TO REPRESENT MY GRIDVIEW ON the CART PAGE
            decimal gameprice;
            int quantityof;
            decimal linetoresult = 0;
            decimal basket_total = 0;
            int qty_total = 0;

            // Populate Line Totals and Accumulate Basket Total
            for (int i = 0; i < games.Count; i++)
            {
                gameprice = Decimal.Parse(GridView1.Rows[i].Cells[7].Text);

                // THESE ALL BREAK WHEN I TRY TO USE THEM, CANT SEEM TO GET THE QUANTITY

                //quantityof = Int16.Parse(GridView1.Rows[i].Cells[8]).Text);
                //linetoresult = gameprice * quantityof;
               // qty_total = (int)qty_total + quantityof;


                basket_total = basket_total + linetoresult;
                GridView1.Rows[i].Cells[9].Text = linetoresult.ToString("C", CultureInfo.CurrentCulture);
            }

            // Provide Summary
            GridView1.FooterRow.Cells[8].Text = "Totals";
            GridView1.FooterRow.Cells[8].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[9].Text = qty_total.ToString();
            GridView1.FooterRow.Cells[10].Text = basket_total.ToString("C", CultureInfo.CurrentCulture);
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Create local array for games
        ArrayList games = new ArrayList();

        // Get current game values from the session variable
        games = (ArrayList)Session["cartgame"];

        // Remove the elements local arrays
        games.RemoveAt(e.RowIndex);

        // Update the session variables with the values in the local arrays
        Session["cartgame"] = (ArrayList)games;

        // Send the user to view the contents of the shopping cart
        Response.Redirect("cart.aspx");
    }


    protected void btn_checkout_Click(object sender, EventArgs e)
    {
        ArrayList games = new ArrayList();

        games = (ArrayList)Session["cartgame"];

        string username = Context.User.Identity.Name;
        if (username != "")
        {
            DateTime currdatetime = DateTime.Now;
            int custid = 0;

            // Establish database connection
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["omniemulatorsConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            // Get Customer ID based on username
            try
            {
                var dataSet = new DataSet();
                string select_cmd = "select custid from customer where custusername='" + username + "'";

                SqlCommand scmd = new SqlCommand(select_cmd, conn);
                var dataAdapter = new SqlDataAdapter { SelectCommand = scmd };

                dataAdapter.Fill(dataSet);

                custid = (int)dataSet.Tables[0].Rows[0]["custid"];
            }
            catch (Exception ex)
            { throw new Exception(ex.Message, ex); }
            finally
            { if (conn != null) { conn.Close(); } }

            // Insert data in the purchase table
            string insert_cmd = "INSERT INTO RESERVATION(custid, flightnum, traveldate, seatlocation, price) values(@custid, @flightnum, @traveldate, @seatlocation, @price)";
            try
            {
                conn.Open();
                NumberStyles style;
                style = NumberStyles.AllowCurrencySymbol | NumberStyles.AllowDecimalPoint | NumberStyles.AllowThousands | NumberStyles.AllowParentheses;
                for (int i = 0; i < games.Count; i++)
                {
                    SqlCommand icmd = new SqlCommand(insert_cmd, conn);
                    icmd.Parameters.AddWithValue("@custid", custid);
                    icmd.Parameters.AddWithValue("@gameid", games[i]);
                    // icmd.Parameters.AddWithValue("@traveldate", currdatetime);
                    // icmd.Parameters.AddWithValue("@seatlocation", seats[i]);
                    icmd.Parameters.AddWithValue("@price", Decimal.Parse(GridView1.Rows[i].Cells[10].Text, style));
                    icmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            { throw new Exception(ex.Message, ex); }
            finally
            { if (conn != null) { conn.Close(); } }

            // Reset the session variables
            Session["cartgame"] = new ArrayList();

            // Send the confirmation note
            Response.Redirect("confirm.aspx");
        }

        else
        { Response.Redirect("Account-Old/Login"); }
    }
}