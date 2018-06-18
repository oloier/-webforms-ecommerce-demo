<%@ Page Title="Reviews Admin" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Review" %>

<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>Reviews List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView ID="ListView1" runat="server"
            DataKeyNames="reviewid"
            ItemType="OmniModels.Review"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Reviews
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
                                <asp:LinkButton Text="Id" CommandName="Sort" CommandArgument="reviewid" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="GameID" CommandName="Sort" CommandArgument="gameid" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Rating" CommandName="Sort" CommandArgument="reviewrating" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Date" CommandName="Sort" CommandArgument="reviewdate" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Review Notes" CommandName="Sort" CommandArgument="reviewnotes" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Customer ID" CommandName="Sort" CommandArgument="custid" runat="Server" />
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
                        <asp:DynamicControl runat="server" DataField="reviewid" ID="reviewid" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="gameid" ID="gameid" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="reviewrating" ID="reviewrating" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="reviewdate" ID="reviewdate" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="reviewnotes" ID="reviewnotes" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custid" ID="custid" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Reviews/Edit", Item.reviewid) %>' Text="Edit" />
                        | 
                       
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Reviews/Delete", Item.reviewid) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

