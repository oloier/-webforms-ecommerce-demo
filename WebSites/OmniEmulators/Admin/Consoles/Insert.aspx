<%@ Page Language="C#" Title="Insert Console" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="Admin_Consoles_Insert" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:FormView runat="server"
        ItemType="OmniModels.Console" DefaultMode="Insert"
        InsertItemPosition="FirstItem" InsertMethod="InsertItem"
        OnItemCommand="ItemCommand" RenderOuterTable="false">
        <InsertItemTemplate>
            <table class="table">
                <legend>Insert Console</legend>
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <tr>
                    <td>Name: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="consolename" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Company: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="consolecompany" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Num Controllers: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="consolecontrollers" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Resolution: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="consoleresolution" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Year: </td>
                    <td>
                        <asp:DynamicControl Mode="Insert" DataField="consoleyear" runat="server" />
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

