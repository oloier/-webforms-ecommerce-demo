<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <h2><%: Title %> OmniEmulators</h2>

    <div><strong>Support:</strong>   <a href="mailto:Support@example.com">support@example.com</a></div>
    <div><strong>Marketing:</strong> <a href="mailto:Marketing@example.com">marketing@example.com</a></div>

    <address class="mt-3">
        123 Fake St.<br />
        Chicago, IL 60614<br />
        <abbr title="Phone">P:</abbr> <a href="tel:5551231234">555-123-1234</a>
    </address>

</asp:Content>
