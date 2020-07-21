<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="WebApplication5.Post" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>

            <asp:Label ID="lbl_productname" runat="server" Text="Product Name"></asp:Label>
            <asp:TextBox ID="txt_productname" runat="server"></asp:TextBox>
            </p>
        <p>
            <asp:Label ID="lbl_category" runat="server" Text="Category"></asp:Label>
            <asp:TextBox ID="txt_category" runat="server"></asp:TextBox>
            </p>
        <p>
            <asp:Label ID="lbl_productdescription" runat="server" Text="Product Description"></asp:Label>
            <asp:TextBox ID="txt_productdescription" runat="server"></asp:TextBox>
            </p>
        <p>
            <asp:Label ID="lbl_price" runat="server" Text="Price"></asp:Label>
            <asp:TextBox ID="txt_price" runat="server"></asp:TextBox>
            </p>
        <p>
            <asp:Label ID="lbl_color" runat="server" Text="Color"></asp:Label>
            <asp:TextBox ID="txt_color" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="btn_post" runat="server" Text="Post Product" OnClientClick="validate()" OnClick="post" align="left"/>
        <asp:Button ID="btn_back" runat="server" Text="Back" OnClientClick="validate()" OnClick="Back" align="right" />
    </form>
</body>
</html>
