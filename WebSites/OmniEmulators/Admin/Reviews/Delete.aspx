<%@ Page Title="Review Delete" Language="C#" MasterPageFile="~/Admin/Site.master" CodeFile="Delete.aspx.cs" AutoEventWireup="true" Inherits="Admin_Reviews_Delete" %>
 
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <p>&nbsp;</p>
        <h3>Are you sure want to delete this Review?</h3>
        <asp:FormView runat="server"
            ItemType="OmniModels.Review" DataKeyNames="reviewid"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Review with Id <%: Request.QueryString["Id"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete Review</legend>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Id</strong> 
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="reviewid" ID="reviewid" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Game ID</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="gameid" ID="gameid" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Ratring</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="reviewrating" ID="reviewrating" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Date</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="reviewdate" ID="reviewdate" Mode="ReadOnly" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 text-right">
                            <strong>Review Notes</strong>
                        </div>
                        <div class="col-sm-4">
                            <asp:DynamicControl runat="server" DataField="reviewnotes" ID="reviewnotes" Mode="ReadOnly" />
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