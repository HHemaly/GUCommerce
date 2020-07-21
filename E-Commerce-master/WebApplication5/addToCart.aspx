<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addToCart.aspx.cs" Inherits="WebApplication5.addToCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="seial number"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
