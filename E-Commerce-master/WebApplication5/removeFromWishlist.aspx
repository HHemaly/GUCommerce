<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="removeFromWishlist.aspx.cs" Inherits="WebApplication5.removeFromWishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="wishlist name"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="serial number"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
             <br />
             <asp:Button ID="Button1" runat="server" Text="remove" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
