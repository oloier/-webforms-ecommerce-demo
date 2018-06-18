<%@ Page Title="Console Admin" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Console" %>

<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>Consoles List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView ID="ListView1" runat="server"
            DataKeyNames="consoleid"
            ItemType="OmniModels.Console"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Consoles
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
                                <asp:LinkButton Text="Id" CommandName="Sort" CommandArgument="consoleid" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Title" CommandName="Sort" CommandArgument="consolename" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Year" CommandName="Sort" CommandArgument="consoleyear" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Company" CommandName="Sort" CommandArgument="consolecompany" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Num Controllers" CommandName="Sort" CommandArgument="consolecontrollers" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Resolution" CommandName="Sort" CommandArgument="consoleresolution" runat="Server" />
                            </th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder" />
                    </tbody>
                </table>
                <asp:DataPager PageSize="10" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                        <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                    </Fields>
                </asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:DynamicControl runat="server" DataField="consoleid" ID="consoleid" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="consolename" ID="consolename" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="consoleyear" ID="consoleyear" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="consolecompany" ID="consolecompany" Mode="ReadOnly" />
                    </td>
                                        <td>
                        <asp:DynamicControl runat="server" DataField="consolecontrollers" ID="consolecontrollers" Mode="ReadOnly" />
                    </td>
                                        <td>
                        <asp:DynamicControl runat="server" DataField="consoleresolution" ID="consoleresolution" Mode="ReadOnly" />
                    <td>
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Consoles/Edit", Item.consoleid) %>' Text="Edit" />
                        | 
                       
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Consoles/Delete", Item.consoleid) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

