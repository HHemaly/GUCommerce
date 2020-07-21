<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewProducts.aspx.cs" Inherits="WebApplication5.ViewProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
        <asp:Button ID="btn_view" runat="server" Text="View Products" OnClientClick="validate()" OnClick="view" align="left"/>
        <asp:Button ID="btn_back" runat="server" Text="Back" OnClientClick="validate()" OnClick="Back" align="right" />
        </p>
        <asp:GridView ID="GridView1" runat="server" EmptyDataText="You have not posted any products yet."></asp:GridView>
    </form>
</body>
</html>
