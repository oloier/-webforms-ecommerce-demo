<%@ Page Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Admin_Products_Edit" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:FormView runat="server"
        ItemType="OmniModels.Game" DefaultMode="Edit" DataKeyNames="gameid"
        UpdateMethod="UpdateItem" SelectMethod="GetItem"
        OnItemCommand="ItemCommand" RenderOuterTable="false">
        <EmptyDataTemplate>
            Cannot find the Product with Id <%: Request.QueryString["Id"] %>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <table class="table">
                <legend>Edit Product</legend>
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <tr>
                    <td>Title: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="gametitle" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="gameprice" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Num Players: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="gamenumplayers" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Developer: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="gamecompany" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Year: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="gameyear" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Genre: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="gamegenre" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Console ID: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit"
                            DataField="consoleid"
                            DataTypeName="OmniModels.Console"
                            DataTextField="consolename"
                            DataValueField="consoleid"
                            UIHint="ForeignKey" runat="server" />
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
