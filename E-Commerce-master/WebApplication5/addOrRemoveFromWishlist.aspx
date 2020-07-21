<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addOrRemoveFromWishlist.aspx.cs" Inherits="WebApplication5.addOrRemoveFromWishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <asp:Button ID="Button1" runat="server" Text="add to wishlist" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="remove from wishlist"  OnClick="Button2_Click" />
            <br />
        </div>
        
    </form>
</body>
</html>
