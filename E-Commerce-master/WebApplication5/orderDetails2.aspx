<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderDetails2.aspx.cs" Inherits="WebApplication5.orderDetails2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1> Order Details: </h1>
            <br/>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <asp:Label ID="deliverytype" runat="server" Text="Choose a Delivery Type:"></asp:Label>
            <asp:GridView ID="GridView2" runat="server"></asp:GridView>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Write a Delivery Type from the table above."></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="submitdelivery" runat="server" Text="Comfirm Order" onclick ="comfirmDel"/>
        </div>
    </form>
</body>
</html>
