<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerRegister.aspx.cs" Inherits="WebApplication5.customerRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="username"></asp:Label>
            <br />
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="first_name"></asp:Label>
            <br />
            <asp:TextBox ID="firstname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="last_name"></asp:Label>
            <br />
            <asp:TextBox ID="lastname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="password"></asp:Label>
            <br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="email"></asp:Label>
            <br />
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
