<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication5.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label1" runat="server" Text="Choose how to register"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Register as Customer"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Register as Vendor"></asp:Label>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Register" OnClick="Button2_Click" />
            <br />
            <br />

        </div>
    </form>
</body>
</html>
