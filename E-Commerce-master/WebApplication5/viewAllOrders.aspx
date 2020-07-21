<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewAllOrders.aspx.cs" Inherits="WebApplication5.viewAllOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>My Orders</h1>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:Label ID="Label1" runat="server" Text="Cancel Order number:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Submit" onclick="cancelOrder"/>
            <br />
            <asp:Button ID="Button8" runat="server" Text="Logout" OnClick="Button8_Click" />
        </div>
    </form>
</body>
</html>
