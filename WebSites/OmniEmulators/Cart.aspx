<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="ShoppingCart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table ">
        <tr style="background:rgba(255,255,255,.2)">
            <th>Product</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Subtotal</th>
            <th></th>
        </tr>
        <asp:Repeater ID="CartContents" runat="server" OnItemDataBound="CartContents_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("gametitle") %></td>
                    <td><%#Eval("quantity") %></td>
                    <td><%#Eval("price") %></td>
                    <td><%#Eval("subtotal") %></td>
                    <td><button class="btn btn-large btn-danger" runat="server" id="remove" onserverclick="CartRemove_Click">×</button></td>
                </tr>
                <asp:HiddenField id="RowID" runat="server" />
            </ItemTemplate>
        </asp:Repeater>
        <tr style="background:rgba(0,0,0,.2)">
            <th>Order Total</th>
            <td></td>
            <td></td>
            <th><%=String.Format("{0:C}", Cart.Total)%></th>
            <td></td>
        </tr>
    </table>

 
    <p id="Unauthenticated" runat="server" visible="false">You must <a href="/Account">log in</a> or <a href="/Account/Register">register with us</a> before you can complete your order.</p>
    <div id="Authenticated" runat="server" visible="false">
        Thank you for your business! Please confirm your information before completing your order.
        <asp:linkbutton id="CompleteOrder" runat="server" class="btn btn-large btn-warning" OnClick="Checkout_Click">Checkout ►</asp:linkbutton>
    </div>

    <div class="text-right">
        <!-- <a href="/Checkout" class="btn btn-large btn-warning"></a> -->
    </div>
</asp:Content>
