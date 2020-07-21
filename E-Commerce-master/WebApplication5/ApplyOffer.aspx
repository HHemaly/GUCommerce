<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyOffer.aspx.cs" Inherits="WebApplication5.ApplyOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Label ID="lbl_serial" runat="server" Text="Product Serial Number"></asp:Label>
            <asp:TextBox ID="txt_serial" runat="server"></asp:TextBox>
            </p>
        <p>
            <asp:Label ID="lbl_offerid" runat="server" Text="Offer ID"></asp:Label>
            <asp:TextBox ID="txt_offerid" runat="server"></asp:TextBox>
        </p>
        <p>
        <asp:Button ID="btn_applyoffer" runat="server" Text="Apply Offer" OnClientClick="validate()" OnClick="apply" align="left"/>
        <asp:Button ID="btn_back" runat="server" Text="Back" OnClientClick="validate()" OnClick="Back" align="right" />
        </p>
    </form>
</body>
</html>
