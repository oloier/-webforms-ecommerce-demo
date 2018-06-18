<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Account_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="panel" DefaultButton="submit">
        <h3>Administrator Login</h3>
        <div class="alert alert-danger" id="report" runat="server" visible="false">
            You are not registered as an administrator.
        </div>
        <div class="form-group">
            <label>
                <div class="font-weight-bold">Username:</div>
                <asp:TextBox runat="server" ID="username" CssClass="form-control" placeholder="Username"></asp:TextBox>
            </label>
        </div>
        <div class="form-group">
            <label>
                <div class="font-weight-bold">Password:</div>
                <asp:TextBox TextMode="password" runat="server" ID="password" CssClass="form-control" placeholder="Password"></asp:TextBox>
            </label>
        </div>

        <div class="form-group">
            <div class="">
                <asp:LinkButton runat="server" ID="submit" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
            </div>
        </div>
    </asp:Panel>    
    <p runat="server" id="regLink">
        <a href="/Account/Register" runat="server" id="register">Register new account</a> if you haven't already.
    </p>
</asp:Content>

