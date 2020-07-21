<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication5.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Label ID="Label5" runat="server" Text="Admin Page"></asp:Label>
        </p>
        <p>
           </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="To activate vendor"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Vendor Username"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="toActivateVendor" Text="activate" />
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Orders"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" Text="Click here" OnClick="Button2_Click" />
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Today's Deal"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button3" runat="server" Text="Click here" OnClick="Button3_Click" />
        </p>
        
    </form>
    <p>
       </p>
</body>
</html>
