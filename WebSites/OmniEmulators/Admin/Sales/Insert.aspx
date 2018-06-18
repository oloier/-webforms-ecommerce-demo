<%@ Page Language="C#" Title="Insert Sale" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="Admin_Sales_Insert" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:FormView runat="server"
        ItemType="OmniModels.Sale" DefaultMode="Insert"
        InsertItemPosition="FirstItem" InsertMethod="InsertItem"
        OnItemCommand="ItemCommand" RenderOuterTable="false">
        <InsertItemTemplate>
            <table class="table">
                <legend>Insert Sale</legend>
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <tr>
                    <td>Customer ID: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="custid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Total: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="total" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Cart Contents XML: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="cartcontents" runat="server" />
                    </td>
                </tr>
            </table>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button runat="server" ID="InsertButton" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                    <asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
                </div>
            </div>
        </InsertItemTemplate>
    </asp:FormView>
</asp:Content>

