<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Computers.aspx.cs" Inherits="Computers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


    <br /><br /><br /><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:omniemulatorsConnectionString %>' SelectCommand="SELECT [compname], [compcpu], [compgpu], [compcost] FROM [Computer]"></asp:SqlDataSource>

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span style="background-color: #FAFAD2; color: #284775;">compname:
                <asp:Label Text='<%# Eval("compname") %>' runat="server" ID="compnameLabel" /><br />
                compcpu:
                <asp:Label Text='<%# Eval("compcpu") %>' runat="server" ID="compcpuLabel" /><br />
                compgpu:
                <asp:Label Text='<%# Eval("compgpu") %>' runat="server" ID="compgpuLabel" /><br />
                compcost:
                <asp:Label Text='<%# Eval("compcost") %>' runat="server" ID="compcostLabel" /><br />
                <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #FFCC66; color: #000080;">compname:
                <asp:TextBox Text='<%# Bind("compname") %>' runat="server" ID="compnameTextBox" /><br />
                compcpu:
                <asp:TextBox Text='<%# Bind("compcpu") %>' runat="server" ID="compcpuTextBox" /><br />
                compgpu:
                <asp:TextBox Text='<%# Bind("compgpu") %>' runat="server" ID="compgpuTextBox" /><br />
                compcost:
                <asp:TextBox Text='<%# Bind("compcost") %>' runat="server" ID="compcostTextBox" /><br />
                <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">compname:
                <asp:TextBox Text='<%# Bind("compname") %>' runat="server" ID="compnameTextBox" /><br />
                compcpu:
                <asp:TextBox Text='<%# Bind("compcpu") %>' runat="server" ID="compcpuTextBox" /><br />
                compgpu:
                <asp:TextBox Text='<%# Bind("compgpu") %>' runat="server" ID="compgpuTextBox" /><br />
                compcost:
                <asp:TextBox Text='<%# Bind("compcost") %>' runat="server" ID="compcostTextBox" /><br />
                <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="background-color: #FFFBD6; color: #333333;">compname:
                <asp:Label Text='<%# Eval("compname") %>' runat="server" ID="compnameLabel" /><br />
                compcpu:
                <asp:Label Text='<%# Eval("compcpu") %>' runat="server" ID="compcpuLabel" /><br />
                compgpu:
                <asp:Label Text='<%# Eval("compgpu") %>' runat="server" ID="compgpuLabel" /><br />
                compcost:
                <asp:Label Text='<%# Eval("compcost") %>' runat="server" ID="compcostLabel" /><br />
                <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div runat="server" id="itemPlaceholderContainer" style="font-family: Verdana, Arial, Helvetica, sans-serif;"><span runat="server" id="itemPlaceholder" /></div>
            <div style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #FFCC66; font-weight: bold; color: #000080;">compname:
                <asp:Label Text='<%# Eval("compname") %>' runat="server" ID="compnameLabel" /><br />
                compcpu:
                <asp:Label Text='<%# Eval("compcpu") %>' runat="server" ID="compcpuLabel" /><br />
                compgpu:
                <asp:Label Text='<%# Eval("compgpu") %>' runat="server" ID="compgpuLabel" /><br />
                compcost:
                <asp:Label Text='<%# Eval("compcost") %>' runat="server" ID="compcostLabel" /><br />
                <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>

</asp:Content>

