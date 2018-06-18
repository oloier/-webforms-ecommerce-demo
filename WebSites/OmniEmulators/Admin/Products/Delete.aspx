<%@ Page Title="ProductDelete" Language="C#" MasterPageFile="~/Admin/Site.master" CodeFile="Delete.aspx.cs" AutoEventWireup="true" Inherits="Admin_Products_Delete" %>
 
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <p>&nbsp;</p>
        <h3>Are you sure want to delete this Product?</h3>
        <asp:FormView runat="server"
            ItemType="OmniModels.Game" DataKeyNames="gameid"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Product with Id <%: Request.QueryString["Id"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete Product</legend>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Id</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="gameid" ID="gameid" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Title</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="gametitle" ID="gametitle" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Price</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="gameprice" ID="gameprice" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>NumPlayers</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="gamenumplayers" ID="gamenumplayers" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Developer</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="gamecompany" ID="gamecompany" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Genre</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="gamegenre" ID="gamegenre" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Year</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="gameyear" ID="gameyear" Mode="ReadOnly" />
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