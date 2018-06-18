<%@ Page Title="Sale Delete" Language="C#" MasterPageFile="~/Admin/Site.master" CodeFile="Delete.aspx.cs" AutoEventWireup="true" Inherits="Admin_Sales_Delete" %>
 
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <p>&nbsp;</p>
        <h3>Are you sure want to delete this Sale?</h3>
        <asp:FormView runat="server"
            ItemType="OmniModels.Sale" DataKeyNames="saleid"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Sale with Id <%: Request.QueryString["Id"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete Sale</legend>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Id</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="saleid" ID="saleid" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Customer ID</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="custid" ID="custid" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Total</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="total" ID="total" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Cart Contents</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="HtmlCart" ID="HtmlCart" HtmlEncode="false" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        &nbsp;
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
                        </div>
                    </div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>