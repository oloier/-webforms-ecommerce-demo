<%@ Page Title="Customer Admin" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Customer" %>

<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>Customers List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView ID="ListView1" runat="server"
            DataKeyNames="custid"
            ItemType="OmniModels.Customer"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Customers
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
                                <asp:LinkButton Text="Id" CommandName="Sort" CommandArgument="custid" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="First Name" CommandName="Sort" CommandArgument="custfirstname" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Last Name" CommandName="Sort" CommandArgument="custlastname" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Birth Date" CommandName="Sort" CommandArgument="custdob" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Email" CommandName="Sort" CommandArgument="custemail" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Phone" CommandName="Sort" CommandArgument="custphone" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Address1" CommandName="Sort" CommandArgument="custaddress1" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Address2" CommandName="Sort" CommandArgument="custaddress2" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="City" CommandName="Sort" CommandArgument="custcity" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="State" CommandName="Sort" CommandArgument="custstate" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Zip" CommandName="Sort" CommandArgument="custzip" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Notes" CommandName="Sort" CommandArgument="custaddlnotes" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Username" CommandName="Sort" CommandArgument="custusername" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Password (unencrypted)" CommandName="Sort" CommandArgument="custpassword" runat="Server" />
                            </th>
                            <th>
                                <asp:LinkButton Text="Administrator" CommandName="Sort" CommandArgument="custadmin" runat="Server" />
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
                        <asp:DynamicControl runat="server" DataField="custid" ID="custid" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custfirstname" ID="custfirstname" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custlastname" ID="custlastname" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custdob" ID="custdob" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custemail" ID="custemail" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custphone" ID="custphone" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custaddress1" ID="custaddress1" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custaddress2" ID="custaddress2" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custcity" ID="custcity" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custstate" ID="custstate" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custzip" ID="custzip" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custaddlnotes" ID="custaddlnotes" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custusername" ID="custusername" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custpassword" ID="custpassword" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="custadmin" ID="custadmin" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Customers/Edit", Item.custid) %>' Text="Edit" />
                        | 
                       
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Customers/Delete", Item.custid) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

