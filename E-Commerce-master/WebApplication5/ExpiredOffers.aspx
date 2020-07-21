<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpiredOffers.aspx.cs" Inherits="WebApplication5.ExpiredOffers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbl_offerid" runat="server" Text="Offer ID"></asp:Label>
            <asp:TextBox ID="txt_offerid" runat="server"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="btn_remove" runat="server" Text="Remove" OnClientClick="validate()" OnClick="remove" align="left"/>
            <asp:Button ID="btn_back" runat="server" Text="Back"  OnClientClick="validate()" OnClick="Back" align="right"/>
        </p>
    </form>
</body>
</html>
