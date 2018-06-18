<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('.qty').keypress(function (e) {
                if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
                    console.log('test!');
                    e.preventDefault();
                    __doPostBack('ctl00$MainContent$CartAdd', '');
                }
            });
        });
    </script>

    <h3>
        <%= Game.gametitle %>
        <small class="text-muted d-block"><%= Game.gamegenre + " &ndash; " + Game.gameyear %></small>
    </h3>
    <p>
        Developed by <%= Game.gamecompany %> in <%= Game.gameyear %>, this title for the 
        <%=Console.consolecompany +" "+ Console.consolename %> supports 
        <%= String.Format("{0} player{1}",Game.gamenumplayers,  Game.gamenumplayers < 2 ? "" : "s")%>.
    </p>

    <div class="mt-5"><big><strong><%= Game.gametitle %></strong> &mdash; <%=String.Format("Price: {0:C}", (decimal)Game.gameprice) %></big></div>
    <div class="form-group ">
        <asp:TextBox Width="70" type="number" pattern="[0-9]*" ID="qty" class="qty form-control d-inline-block text-center" placeholder="qty" runat="server" />
        <asp:LinkButton class="btn btn-primary" Style="vertical-align: top;" ID="CartAdd" runat="server" OnClick="CartAdd_Click">Add to Cart</asp:LinkButton>
    </div>

    <h4>Customer Reviews</h4>

    <div class="reviews-container">
        <asp:Repeater ID="ReviewsList" runat="server" ClientIDMode="predictable">
            <%--OnItemDataBound="ProductsList_ItemDataBound"--%>
            <ItemTemplate>
                <div class="report card mt-3 p-3">
                    <div class="cart-header">
                        <strong><%# Eval("Customer.custfirstname") %>'s <%= Game.gametitle %> Review &mdash; <%#Eval("reviewrating") %>/5 Stars</strong>
                        <small class="float-right"> </small>
                    </div>
                    <div class="card-block">
                        <h4 ></h4>
                        <p class="card-text"><%#Eval("reviewnotes") %> </p>
                    </div>
                    <footer class="mt-3 small text-right">Written by <strong><%# Eval("Customer.custfirstname") %> <%# Eval("Customer.custlastname") %></strong> on <%#Eval("reviewdate") %></footer>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="mt-4 p-3"  style="background:rgba(0,0,0,.2); border-radius:.3em" id="LoginContainer" visible="true" runat="server">
        You must <a href="/Account">Log in</a> before writing a review.
    </div>
    <div class="form mt-4" id="ReviewsContainer" runat="server" visible="false">
        <h5>Share Your Rating With Us</h5>
        <div class="form-group">
            <asp:DropDownList runat="server" ID="rating" class="form-control">
                <asp:ListItem Value="1" Text="1 Star" />
                <asp:ListItem Value="2" Text="2 Stars" />
                <asp:ListItem Value="3" Text="3 Stars" />
                <asp:ListItem Value="4" Text="4 Stars" />
                <asp:ListItem Value="5" Text="5 Stars" />
            </asp:DropDownList>
        </div>
        <asp:TextBox class="form-control mb-2" style="min-width:50em!important" Rows="5" runat="server" ID="notes" TextMode="Multiline" MaxLength="1000" placeholder="Enter your review here..." />
        <div>
            <asp:LinkButton class="btn btn-primary" runat="server" ID="ReviewSubmit" OnClick="Review_Click">Submit Review</asp:LinkButton>
        </div>
    </div>
</asp:Content>
