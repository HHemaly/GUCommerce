<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderDetailscredit.aspx.cs" Inherits="WebApplication5.orderDetailscredit" %>

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
            <br />
            <asp:Label ID="choosecn" runat="server" Text="Credit Card number:"></asp:Label>
            <asp:TextBox ID="creditnum" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="submitcreditnum" runat="server" Text="Submit" onclick ="choosecredit"/>
            <br />
        </div>
    </form>
</body>
</html>
