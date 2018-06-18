<%@ Page Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="Admin_Reviews_Insert" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:FormView runat="server"
        ItemType="OmniModels.Review" DefaultMode="Insert"
        InsertItemPosition="FirstItem" InsertMethod="InsertItem"
        OnItemCommand="ItemCommand" RenderOuterTable="false">
        <InsertItemTemplate>
            <table class="table">
                <legend>Insert Review</legend>
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <tr>
                    <td>Game ID: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="gameid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Rating: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="reviewrating" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Date: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="reviewdate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Review Notes: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="reviewnotes" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Customer ID: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="custid" runat="server" />
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

