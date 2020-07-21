<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addOrRemoveFromCart.aspx.cs" Inherits="WebApplication5.addOrRemoveFromCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="Button1" runat="server" Text="add to cart"  OnClientClick="add" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="remove from cart" OnClientClick="remove" OnClick="Button2_Click" />

    </form>
</body>
</html>
