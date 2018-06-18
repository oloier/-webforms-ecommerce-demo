<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerReg.aspx.cs" Inherits="Account_CustomerReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <br /><br /><br />

    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="custid" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="546px" OnPageIndexChanging="FormView1_PageIndexChanging" Width="576px" ForeColor="#333333" OnItemInserting="FormView1_ItemInserting">
    <EditItemTemplate>
       <%-- custid:
        <asp:Label ID="custidLabel1" runat="server" Text='<%# Eval("custid") %>' />
        <br />--%>
        custfirstname:
        <asp:TextBox ID="custfirstnameTextBox" runat="server" Text='<%# Bind("custfirstname") %>' />
        <br />
        custlastname:
        <asp:TextBox ID="custlastnameTextBox" runat="server" Text='<%# Bind("custlastname") %>' />
        <br />
        custdob:
        <asp:TextBox ID="custdobTextBox" runat="server" Text='<%# Bind("custdob") %>' />
        <br />
        custemail:
        <asp:TextBox ID="custemailTextBox" runat="server" Text='<%# Bind("custemail") %>' />
        <br />
        custphone:
        <asp:TextBox ID="custphoneTextBox" runat="server" Text='<%# Bind("custphone") %>' />
        <br />
        custaddress1:
        <asp:TextBox ID="custaddress1TextBox" runat="server" Text='<%# Bind("custaddress1") %>' />
        <br />
        custaddress2:
        <asp:TextBox ID="custaddress2TextBox" runat="server" Text='<%# Bind("custaddress2") %>' />
        <br />
        custcity:
        <asp:TextBox ID="custcityTextBox" runat="server" Text='<%# Bind("custcity") %>' />
        <br />
        custstate:
        <asp:TextBox ID="custstateTextBox" runat="server" Text='<%# Bind("custstate") %>' />
        <br />
        custzip:
        <asp:TextBox ID="custzipTextBox" runat="server" Text='<%# Bind("custzip") %>' />
        <br />
        custaddlnotes:
        <asp:TextBox ID="custaddlnotesTextBox" runat="server" Text='<%# Bind("custaddlnotes") %>' />
        <br />
        cartid:
        <asp:TextBox ID="cartidTextBox" runat="server" Text='<%# Bind("cartid") %>' />
        <br />
        custusername:
        <asp:TextBox ID="custusernameTextBox" runat="server" Text='<%# Bind("custusername") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <InsertItemTemplate>
        Customer ID:
        <asp:TextBox ID="custidTextBox" runat="server" Text='<%# Bind("custid") %>' />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User Name:
        <asp:TextBox ID="custusernameTextBox" runat="server" Text='<%# Bind("custusername") %>' />
        <br />
        <br />
        First Name:
        <asp:TextBox ID="custfirstnameTextBox" runat="server" Text='<%# Bind("custfirstname") %>' />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Last Name:
        <asp:TextBox ID="custlastnameTextBox" runat="server" Text='<%# Bind("custlastname") %>' />
        <br />
        <br />
        Date of Birth:
        <asp:TextBox ID="custdobTextBox" runat="server" Text='<%# Bind("custdob") %>' />
        <br />
        <br />
        Email:
        <asp:TextBox ID="custemailTextBox" runat="server" Height="18px" Text='<%# Bind("custemail") %>' Width="180px" />
        <br />
        <br />
        Phone Number:
        <asp:TextBox ID="custphoneTextBox" runat="server" Text='<%# Bind("custphone") %>' />
        <br />
        <br />
        Address:
        <asp:TextBox ID="custaddress1TextBox" runat="server" Text='<%# Bind("custaddress1") %>' />
        <br />
        <br />
        custaddress2:
        <asp:TextBox ID="custaddress2TextBox" runat="server" Text='<%# Bind("custaddress2") %>' />
        <br />
        <br />
        City:
        <asp:TextBox ID="custcityTextBox" runat="server" Text='<%# Bind("custcity") %>' />
        <br />
        <br />
        State:
        <asp:TextBox ID="custstateTextBox" runat="server" Text='<%# Bind("custstate") %>' />
        <br />
        <br />
        Zip Code:
        <asp:TextBox ID="custzipTextBox" runat="server" Text='<%# Bind("custzip") %>' />
        <br />
        <br />
        Additional Notes:
        <asp:TextBox ID="custaddlnotesTextBox" runat="server" Text='<%# Bind("custaddlnotes") %>' />
        <br />
        <br />
        cartid:
        <asp:TextBox ID="cartidTextBox" runat="server" Text='<%# Bind("cartid") %>' />
        <br />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        custid:
        <asp:Label ID="custidLabel" runat="server" Text='<%# Eval("custid") %>' />
        <br />
        custfirstname:
        <asp:Label ID="custfirstnameLabel" runat="server" Text='<%# Bind("custfirstname") %>' />
        <br />
        custlastname:
        <asp:Label ID="custlastnameLabel" runat="server" Text='<%# Bind("custlastname") %>' />
        <br />
        custdob:
        <asp:Label ID="custdobLabel" runat="server" Text='<%# Bind("custdob") %>' />
        <br />
        custemail:
        <asp:Label ID="custemailLabel" runat="server" Text='<%# Bind("custemail") %>' />
        <br />
        custphone:
        <asp:Label ID="custphoneLabel" runat="server" Text='<%# Bind("custphone") %>' />
        <br />
        custaddress1:
        <asp:Label ID="custaddress1Label" runat="server" Text='<%# Bind("custaddress1") %>' />
        <br />
        custaddress2:
        <asp:Label ID="custaddress2Label" runat="server" Text='<%# Bind("custaddress2") %>' />
        <br />
        custcity:
        <asp:Label ID="custcityLabel" runat="server" Text='<%# Bind("custcity") %>' />
        <br />
        custstate:
        <asp:Label ID="custstateLabel" runat="server" Text='<%# Bind("custstate") %>' />
        <br />
        custzip:
        <asp:Label ID="custzipLabel" runat="server" Text='<%# Bind("custzip") %>' />
        <br />
        custaddlnotes:
        <asp:Label ID="custaddlnotesLabel" runat="server" Text='<%# Bind("custaddlnotes") %>' />
        <br />
        cartid:
        <asp:Label ID="cartidLabel" runat="server" Text='<%# Bind("cartid") %>' />
        <br />
        custusername:
        <asp:Label ID="custusernameLabel" runat="server" Text='<%# Bind("custusername") %>' />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
    </ItemTemplate>
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:omniemulatorsConnectionString %>" DeleteCommand="DELETE FROM [Customer] WHERE [custid] = @custid" InsertCommand="INSERT INTO [Customer] ([custid], [custfirstname], [custlastname], [custdob], [custemail], [custphone], [custaddress1], [custaddress2], [custcity], [custstate], [custzip], [custaddlnotes], [cartid], [custusername]) VALUES (@custid, @custfirstname, @custlastname, @custdob, @custemail, @custphone, @custaddress1, @custaddress2, @custcity, @custstate, @custzip, @custaddlnotes, @cartid, @custusername)" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [custfirstname] = @custfirstname, [custlastname] = @custlastname, [custdob] = @custdob, [custemail] = @custemail, [custphone] = @custphone, [custaddress1] = @custaddress1, [custaddress2] = @custaddress2, [custcity] = @custcity, [custstate] = @custstate, [custzip] = @custzip, [custaddlnotes] = @custaddlnotes, [cartid] = @cartid, [custusername] = @custusername WHERE [custid] = @custid">
    <DeleteParameters>
        <asp:Parameter Name="custid" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="custid" Type="Int32" />
        <asp:Parameter Name="custfirstname" Type="String" />
        <asp:Parameter Name="custlastname" Type="String" />
        <asp:Parameter DbType="Date" Name="custdob" />
        <asp:Parameter Name="custemail" Type="String" />
        <asp:Parameter Name="custphone" Type="String" />
        <asp:Parameter Name="custaddress1" Type="String" />
        <asp:Parameter Name="custaddress2" Type="String" />
        <asp:Parameter Name="custcity" Type="String" />
        <asp:Parameter Name="custstate" Type="String" />
        <asp:Parameter Name="custzip" Type="String" />
        <asp:Parameter Name="custaddlnotes" Type="String" />
        <asp:Parameter Name="cartid" Type="Int32" />
        <asp:Parameter Name="custusername" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="custfirstname" Type="String" />
        <asp:Parameter Name="custlastname" Type="String" />
        <asp:Parameter DbType="Date" Name="custdob" />
        <asp:Parameter Name="custemail" Type="String" />
        <asp:Parameter Name="custphone" Type="String" />
        <asp:Parameter Name="custaddress1" Type="String" />
        <asp:Parameter Name="custaddress2" Type="String" />
        <asp:Parameter Name="custcity" Type="String" />
        <asp:Parameter Name="custstate" Type="String" />
        <asp:Parameter Name="custzip" Type="String" />
        <asp:Parameter Name="custaddlnotes" Type="String" />
        <asp:Parameter Name="cartid" Type="Int32" />
        <asp:Parameter Name="custusername" Type="String" />
        <asp:Parameter Name="custid" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

