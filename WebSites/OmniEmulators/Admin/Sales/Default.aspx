<%@ Page Title="Sale Admin" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Sale" %>

<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>Sales List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView ID="ListView1" runat="server"
            DataKeyNames="saleid"
            ItemType="OmniModels.Sale"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Sales
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
                                <asp:LinkButton Text="Id" CommandName="Sort" CommandArgument="saleid" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Customer" CommandName="Sort" CommandArgument="custid" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Order Total" CommandName="Sort" CommandArgument="total" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Cart Contents" CommandName="Sort" CommandArgument="cartcontents" runat="Server" UIHint="HTML" />
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
                        <asp:DynamicControl runat="server" DataField="saleid" ID="saleid" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custid" ID="custid" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="total" ID="total" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="HtmlCart" ID="cartcontents" Mode="ReadOnly" HtmlEncode="false" />
                    </td>
                    <td>
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Sales/Edit", Item.saleid) %>' Text="Edit" />
                        | 
                       
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Sales/Delete", Item.saleid) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

