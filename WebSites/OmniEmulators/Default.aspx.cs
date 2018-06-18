using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using OmniModels;

public partial class Products : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		OmniContext DbContext = new OmniContext();
		List<Game> Games = DbContext.Games.ToList();
		ProductsList.DataSource = Games;
		ProductsList.DataBind();
	}


	//protected void ProductsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
	//{
	//	if (e.Item.ItemType == ListItemType.Item | e.Item.ItemType == ListItemType.AlternatingItem)
	//	{
	//		Game GameData = (Game)e.Item.DataItem;
	//		HtmlAnchor ProductLink = (HtmlAnchor)e.Item.FindControl("ProductLink");
	//		ProductLink.HRef = "/ProductDetail?id=" + GameData.gameid.ToString();
	//		ProductLink.InnerHtml = GameData.gametitle;

	//		HtmlGenericControl GameYear = (HtmlGenericControl)e.Item.FindControl("GameYear");
	//		GameYear.InnerHtml = GameData.gameyear;
	//		HtmlGenericControl GamePrice = (HtmlGenericControl)e.Item.FindControl("GamePrice");
	//		decimal priceDec = (decimal)GameData.gameprice;
	//		GamePrice.InnerHtml = String.Format("Price: {0:C}", GameData.gameprice);
	//		HtmlGenericControl GamePlayers = (HtmlGenericControl)e.Item.FindControl("GamePlayers");
	//		int? playerCount = GameData.gamenumplayers;
	//		GamePlayers.InnerHtml = String.Format("Supports {0} player{1}", playerCount, playerCount > 1 ? "s" : "");
	//		HtmlGenericControl GameGenre = (HtmlGenericControl)e.Item.FindControl("GameGenre");
	//		GameGenre.InnerHtml = "Game type: " + GameData.gamegenre;

	//	}
	//}

}