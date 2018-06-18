<%@ Page Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="Admin_Products_Insert" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:FormView runat="server"
        ItemType="OmniModels.Game" DefaultMode="Insert"
        InsertItemPosition="FirstItem" InsertMethod="InsertItem"
        OnItemCommand="ItemCommand" RenderOuterTable="false">
        <InsertItemTemplate>
            <table class="table">
                <legend>Add New Product</legend>
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <tr>
                    <td>Title: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="gametitle" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="gameprice" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Num Players: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="gamenumplayers" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Developer: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="gamecompany" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Year: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="gameyear" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Genre: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="gamegenre" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Console ID: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert"
                            DataField="consoleid"
                            DataTypeName="OmniModels.Console"
                            DataTextField="consolename"
                            DataValueField="consoleid"
                            UIHint="ForeignKey" runat="server" />
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

