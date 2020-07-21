<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cartView.aspx.cs" Inherits="WebApplication5.cartView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>My Cart</h1>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:Button ID="makeOrder" runat="server" Text="Checkout" OnClick="makeOrder_Click" />
            <br />
            <asp:Button ID="Button8" runat="server" Text="Logout" OnClick="Button8_Click" />
        </div>
    </form>
</body>
</html>
