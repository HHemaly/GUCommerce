<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerMain.aspx.cs" Inherits="WebApplication5.CustomerMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder ID="Points" runat="server"></asp:PlaceHolder>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="viewProducts"  />
            <asp:Button ID="Button2" runat="server" Text="add/remove Products from my wishlist" OnClientClick="addremove" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="add credit card" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" Text=" Add/remove products to my cart" OnClick="Button4_Click" />
            <br />
            <asp:Button ID="Button7" runat="server" Text="View my Orders" OnClick="Button7_Click" />
            <asp:Button ID="Button9" runat="server" Text="create wishlist" OnClick="Button9_Click" />
            <br />
            <asp:Button ID="Button6" runat="server" Text="View my cart" OnClick="Button6_Click" />
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" Text="add telephone number(s)" OnClick="Button5_Click" />
            <br />
            <asp:Button ID="Button8" runat="server" Text="Logout" OnClick="Button8_Click" />
        </div>
    </form>
</body>
</html>
