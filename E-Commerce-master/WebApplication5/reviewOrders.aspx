<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reviewOrders.aspx.cs" Inherits="WebApplication5.reviewOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button2" runat="server" Text="Review All Orders " OnClick="Button2_Click" />
            <br />
            <asp:GridView ID="GridView1" EmptyDataText="There are no orders yet" runat="server">
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
</body>
</html>
