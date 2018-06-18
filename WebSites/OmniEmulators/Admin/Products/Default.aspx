<%@ Page Title="Product Admin" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Product" %>

<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>Products List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView ID="ListView1" runat="server"
            DataKeyNames="gameid"
            ItemType="OmniModels.Game"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Games
           
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
                                <asp:LinkButton Text="Id" CommandName="Sort" CommandArgument="gameid" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Title" CommandName="Sort" CommandArgument="gametitle" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Price" CommandName="Sort" CommandArgument="gameprice" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="NumPlayers" CommandName="Sort" CommandArgument="gamenumplayers" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Developer" CommandName="Sort" CommandArgument="gamecompany" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Genre" CommandName="Sort" CommandArgument="gamegenre" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Year" CommandName="Sort" CommandArgument="gameyear" runat="Server" />
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
                        <asp:DynamicControl runat="server" DataField="gameid" ID="gameid" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="gametitle" ID="gametitle" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="gameprice" ID="gameprice" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="gamenumplayers" ID="gamenumplayers" Mode="ReadOnly" />
                    </td>
                                        <td>
                        <asp:DynamicControl runat="server" DataField="gamecompany" ID="gamecompany" Mode="ReadOnly" />
                    </td>
                                        <td>
                        <asp:DynamicControl runat="server" DataField="gamegenre" ID="gamegenre" Mode="ReadOnly" />
                    </td>
                                        <td>
                        <asp:DynamicControl runat="server" DataField="gameyear" ID="gameyear" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Products/Edit", Item.gameid) %>' Text="Edit" />
                        | 
                       
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Products/Delete", Item.gameid) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

