<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Games.aspx.cs" Inherits="Games" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /><br /><br /><br />
    
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:omniemulatorsConnectionString %>' SelectCommand="SELECT dbo.Game.gametitle, dbo.Game.gameyear, dbo.Game.gamegenre, dbo.Game.gamecompany, dbo.Game.gamenumplayers, dbo.Game.gameprice, dbo.Console.consolename FROM dbo.Game INNER JOIN dbo.Console ON dbo.Game.consoleid = dbo.Console.consoleid"></asp:SqlDataSource>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="gametitle" HeaderText="Title" SortExpression="gametitle"></asp:BoundField>
            <asp:BoundField DataField="consolename" HeaderText="Console" SortExpression="consolename"></asp:BoundField>
            <asp:BoundField DataField="gameyear" HeaderText="Release Year" SortExpression="gameyear"></asp:BoundField>
            <asp:BoundField DataField="gamegenre" HeaderText="Genre" SortExpression="gamegenre"></asp:BoundField>
            <asp:BoundField DataField="gamecompany" HeaderText="Company" SortExpression="gamecompany"></asp:BoundField>
            <asp:BoundField DataField="gamenumplayers" HeaderText="Number of Players" SortExpression="gamenumplayers"></asp:BoundField>
            <asp:BoundField DataField="gameprice" HeaderText="Price" SortExpression="gameprice"></asp:BoundField>
            
        </Columns>
        <FooterStyle BackColor="Tan"></FooterStyle>

        <HeaderStyle BackColor="Tan" Font-Bold="True"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue"></PagerStyle>

        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#FAFAE7"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#DAC09E"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E1DB9C"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#C2A47B"></SortedDescendingHeaderStyle>
    </asp:GridView>


    <br /><br /><br />

    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            gametitle:
            <asp:TextBox Text='<%# Bind("gametitle") %>' runat="server" ID="gametitleTextBox" /><br />
            gameyear:
            <asp:TextBox Text='<%# Bind("gameyear") %>' runat="server" ID="gameyearTextBox" /><br />
            gamegenre:
            <asp:TextBox Text='<%# Bind("gamegenre") %>' runat="server" ID="gamegenreTextBox" /><br />
            gamecompany:
            <asp:TextBox Text='<%# Bind("gamecompany") %>' runat="server" ID="gamecompanyTextBox" /><br />
            gamenumplayers:
            <asp:TextBox Text='<%# Bind("gamenumplayers") %>' runat="server" ID="gamenumplayersTextBox" /><br />
            gameprice:
            <asp:TextBox Text='<%# Bind("gameprice") %>' runat="server" ID="gamepriceTextBox" /><br />
            consolename:
            <asp:TextBox Text='<%# Bind("consolename") %>' runat="server" ID="consolenameTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            gametitle:
            <asp:TextBox Text='<%# Bind("gametitle") %>' runat="server" ID="gametitleTextBox" /><br />
            gameyear:
            <asp:TextBox Text='<%# Bind("gameyear") %>' runat="server" ID="gameyearTextBox" /><br />
            gamegenre:
            <asp:TextBox Text='<%# Bind("gamegenre") %>' runat="server" ID="gamegenreTextBox" /><br />
            gamecompany:
            <asp:TextBox Text='<%# Bind("gamecompany") %>' runat="server" ID="gamecompanyTextBox" /><br />
            gamenumplayers:
            <asp:TextBox Text='<%# Bind("gamenumplayers") %>' runat="server" ID="gamenumplayersTextBox" /><br />
            gameprice:
            <asp:TextBox Text='<%# Bind("gameprice") %>' runat="server" ID="gamepriceTextBox" /><br />
            consolename:
            <asp:TextBox Text='<%# Bind("consolename") %>' runat="server" ID="consolenameTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            gametitle:
            <asp:Label Text='<%# Bind("gametitle") %>' runat="server" ID="gametitleLabel" /><br />
            gameyear:
            <asp:Label Text='<%# Bind("gameyear") %>' runat="server" ID="gameyearLabel" /><br />
            gamegenre:
            <asp:Label Text='<%# Bind("gamegenre") %>' runat="server" ID="gamegenreLabel" /><br />
            gamecompany:
            <asp:Label Text='<%# Bind("gamecompany") %>' runat="server" ID="gamecompanyLabel" /><br />
            gamenumplayers:
            <asp:Label Text='<%# Bind("gamenumplayers") %>' runat="server" ID="gamenumplayersLabel" /><br />
            gameprice:
            <asp:Label Text='<%# Bind("gameprice") %>' runat="server" ID="gamepriceLabel" /><br />
            consolename:
            <asp:Label Text='<%# Bind("consolename") %>' runat="server" ID="consolenameLabel" /><br />

        </ItemTemplate>
    </asp:FormView>

</asp:Content>

