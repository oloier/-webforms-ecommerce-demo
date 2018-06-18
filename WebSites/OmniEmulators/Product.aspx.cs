using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using OmniModels;
using System.Text.RegularExpressions;

public partial class ProductDetail : System.Web.UI.Page
{
	protected Cart Cart { get; set; }
	protected Customer Customer { get; set; }

    protected OmniModels.Game Game { get; set; }
	protected OmniModels.Console Console { get; set; }
	protected List<Review> Reviews { get; set; }

    protected OmniContext DbContext;

	protected void Page_Init(object sender, EventArgs e)
	{
		// Load existing cart / login session, if present
		Cart = (Cart)Session["cart"];
		Customer = (Customer)Session["customer"];

        // Grab our query string and load in our requested title from the database
        string gameId = Request.QueryString["id"];
		int requestedGame = 0;
		int.TryParse(gameId, out requestedGame);

		// verify we actually got an ID on some level, redirect if not
		if (requestedGame > 0)
		{
			DbContext = new OmniContext();
			Game = DbContext.Games.FirstOrDefault(x => x.gameid == requestedGame);

			// check to make sure we got results, redirect if not
			if (Game == null)
			{
                Response.Redirect("/");
            }
            else
			{
				// Easy street that child
				Console = Game.Console;
                Reviews = Game.Reviews.ToList();
                ReviewsList.DataSource = Reviews;
                ReviewsList.DataBind();

                // Show reviews if they're logged in.
                if (Customer != null)
                {
                    ReviewsContainer.Visible = true;
                    LoginContainer.Visible = false;
                }
            }
        }
		else
		{
            Response.Redirect("/");
        }

	}

	protected void CartAdd_Click(object sender, EventArgs e)
	{
		int quantityToAdd = 0;
		string qtyText = qty.Text;
		int.TryParse(qtyText, out quantityToAdd);

		if (quantityToAdd > 0)
		{
			// Update our object, add to cart
			Game.Quantity = quantityToAdd;
			Cart = (Cart)Session["cart"];
			Cart.Add(Game);

			// Update the session
			Session["cart"] = Cart;

			// Redirect customer to cart to confirm addition
			Response.Redirect("/Cart");
		}
	}

    protected void Review_Click(object sender, EventArgs e)
    {
        // Connext to database and setup our new review
        DbContext = new OmniContext();
        Review newReview = new Review();

        // Point to the current game
        newReview.gameid = Game.gameid;

        // Parse the score to an integer
        string reviewStr = rating.SelectedItem.Value;
        int reviewScore = 0;
        int.TryParse(reviewStr, out reviewScore);
        newReview.reviewrating = reviewScore;

        // Pull out HTML/JS values for somewhat plaintext reviews
        newReview.reviewnotes = StripHTML(notes.Text);

        // getDate() in SQL wasn't cooperating with NOT NULL combined iwth entity. Inserting here.
        DateTime reviewDate = DateTime.Now;
        //string sqlFormattedDate = reviewDate.ToString("yyyy-MM-dd HH:mm:ss.fff");
        newReview.reviewdate = reviewDate;

        // Connect to the customer
        newReview.custid = Customer.custid;

        // Apply our changes and GET OUT
        DbContext.Reviews.Add(newReview);
        DbContext.SaveChanges();

        Response.Redirect("/Product?id=" + Game.gameid + "&report=Thanks for your review!");
    }

    // really basic input sanitizing
    public static string StripHTML(string input)
    {
        return Regex.Replace(input, "<.*?>", String.Empty);
    }

}