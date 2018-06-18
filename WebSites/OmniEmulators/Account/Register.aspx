<%@ Page Title="Register as a new user" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="panel" DefaultButton="submit">
        <table class="table">
            <legend>Register with OmniEmulators</legend>
            <tr>
                <td width="25%">Username:</td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="username" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="password" textmode="Password" runat="server" />
                </td>
            </tr>
            <tr>
                <td>First Name: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="firstname" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Last Name: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="lastname" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Date of Birth: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="dob" runat="server" type="date" />
                </td>
            </tr>
            <tr>
                <td>Email: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="email" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Phone: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="phone" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Address1: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="address1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Address2: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="address2" runat="server" />
                </td>
            </tr>
            <tr>
                <td>City: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="city" runat="server" />
                </td>
            </tr>
            <tr>
                <td>State: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="state" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Zip: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="zip" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Register as Admin?: </td>
                <td>
                    <asp:Checkbox CssClass="form-check" ID="admin" runat="server" />
                </td>
            </tr>
        </table>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:LinkButton runat="server" ID="submit" Text="Register" OnClick="Register" CssClass="btn btn-primary" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>

