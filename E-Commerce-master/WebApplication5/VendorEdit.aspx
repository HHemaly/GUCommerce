<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorEdit.aspx.cs" Inherits="WebApplication5.VendorEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <p>
            <asp:Label ID="lbl_serialnumber" runat="server" Text="Serial Number"></asp:Label>
            <asp:TextBox ID="txt_serialnumber" runat="server"></asp:TextBox>
            </p>
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
        <p>
            &nbsp;</p>
        <p>
        <asp:Button ID="btn_edit" runat="server" Text="Edit Product" OnClientClick="validate()" OnClick="edit" align="left"/>
        <asp:Button ID="btn_back" runat="server" Text="Back" OnClientClick="validate()" OnClick="Back" align="right" />
        </p>
    </form>
</body>
</html>
