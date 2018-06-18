<%@ Page Language="C#" Title="Edit Sale" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Admin_Sales_Edit" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:FormView runat="server"
        ItemType="OmniModels.Sale" DefaultMode="Edit" DataKeyNames="saleid"
        UpdateMethod="UpdateItem" SelectMethod="GetItem"
        OnItemCommand="ItemCommand" RenderOuterTable="false">
        <EmptyDataTemplate>
            Cannot find the Sale with Id <%: Request.QueryString["Id"] %>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <table class="table">
                <legend>Edit Sale</legend>
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <tr>
                    <td>Customer ID: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Total: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="total" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Cart Contents: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="cartcontents" runat="server" />
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
