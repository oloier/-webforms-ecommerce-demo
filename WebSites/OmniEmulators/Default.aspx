<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="jumbotron">
        <h3>Welcome to OmniEmulators!</h3>
        <p>Please browse our products, view product details, leave a review, or hopefully buy something. Thanks for visiting!</p>
    </div>

    <div class="games-container">
        <asp:Repeater ID="ProductsList" runat="server" ClientIDMode="predictable"><%--OnItemDataBound="ProductsList_ItemDataBound"--%>
            <ItemTemplate>
                <div class="product p-2 mb-3">
                    <a href='<%#"/Product?id=" + Eval("gameid") %>' id="ProductLink" runat="server" class="d-block font-weight-bold"><%#Eval("gametitle") %></a>
                    <div class="" id="GameYear" runat="server"><%#Eval("gameyear") %></div>
                    <strong class="d-block" id="GamePrice" runat="server"><%#String.Format("Price: {0:C}", (decimal)Eval("gameprice")) %></strong>
                    <div class="" id="GamePlayers" runat="server"><%#String.Format("Supports {0} player{1}", Eval("gamenumplayers"), (int)Eval("gamenumplayers") > 1 ? "s" : "")%></div>
                    <em class="d-block" id="GameGenre" runat="server">Game type: <%#Eval("gamegenre") %></em>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
