<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="WebApplication5.orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Button ID="Button1" runat="server" Text=" To Review all orders" OnClick="viewOrders" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Update Order Status to InProcess "></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Order no"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="updateOrderStatus" Text="Update" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Button ID="Button3" runat="server" Text="Back" OnClick="Button3_Click" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
