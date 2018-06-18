<%@ Page Title="Edit Customer" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Admin_Customers_Edit" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:FormView runat="server"
        ItemType="OmniModels.Customer" DefaultMode="Edit" DataKeyNames="custid"
        UpdateMethod="UpdateItem" SelectMethod="GetItem"
        OnItemCommand="ItemCommand" RenderOuterTable="false">
        <EmptyDataTemplate>
            Cannot find the Customer with Id <%: Request.QueryString["Id"] %>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <table class="table">
                <legend>Edit Customer</legend>
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <tr>
                    <td>First Name: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custfirstname" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Last Name: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custlastname" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Birth Date: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custdob" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custemail" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Phone: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custphone" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Address1: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custaddress1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Address2: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custaddress2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>City: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custcity" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>State: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custstate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Zip: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custzip" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Customer Notes: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custaddlnotes" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Username: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custusername" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custpassword" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Administrator: </td>
                    <td>
                        <asp:DynamicControl Mode="Edit" DataField="custadmin" runat="server" />
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
