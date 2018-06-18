<%@ Page Title="Edit Console" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Admin_Consoles_Edit" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:FormView runat="server"
        ItemType="OmniModels.Console" DefaultMode="Edit" DataKeyNames="consoleid"
        UpdateMethod="UpdateItem" SelectMethod="GetItem"
        OnItemCommand="ItemCommand" RenderOuterTable="false">
        <EmptyDataTemplate>
            Cannot find the Console with Id <%: Request.QueryString["Id"] %>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <table class="table">
                <legend>Edit Console</legend>
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <tr>
                    <td>Name: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="consolename" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Company: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="consolecompany" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Num Controllers: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="consolecontrollers" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Year: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="consoleyear" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Resolution: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="consoleresolution" runat="server" />
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
