<%@ Page Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Admin_Reviews_Edit" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:FormView runat="server"
        ItemType="OmniModels.Review" DefaultMode="Edit" DataKeyNames="reviewid"
        UpdateMethod="UpdateItem" SelectMethod="GetItem"
        OnItemCommand="ItemCommand" RenderOuterTable="false">
        <EmptyDataTemplate>
            Cannot find the Review with Id <%: Request.QueryString["Id"] %>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <table class="table">
                <legend>Edit Review</legend>
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <tr>
                    <td>Game ID: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="gameid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Rating: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="reviewrating" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Date: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="reviewdate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Review Notes: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="reviewnotes" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Customer ID: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custid" runat="server" />
                    </td>
                </tr>
            </table>
            <div class="form-group mt-5">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button runat="server" ID="UpdateButton" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                    <asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
                </div>
            </div>
            </table>
        </EditItemTemplate>
    </asp:FormView>
</asp:Content>
