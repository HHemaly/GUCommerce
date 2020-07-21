<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderDetails.aspx.cs" Inherits="WebApplication5.orderDetails" %>



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
            <asp:Label ID="credit" runat="server" Text="Credit amount:"></asp:Label>
            <asp:TextBox ID="creditamount" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="cash" runat="server" Text="Cash amount:"></asp:Label>
            <asp:TextBox ID="cashamount" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="submitmoney" runat="server" Text="Submit" onclick ="specifyamount"/>
        </div>
    </form>
</body>
</html>
