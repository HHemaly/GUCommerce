<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostOffer.aspx.cs" Inherits="WebApplication5.PostOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbl_offeramount" runat="server" Text="Offer Amount"></asp:Label>
            <asp:TextBox ID="txt_offeramount" runat="server"></asp:TextBox>
        </div>
        <p>
            <asp:Label ID="lbl_expirydate" runat="server" Text="Expiry Date"></asp:Label>
            <asp:TextBox ID="txt_expirydate" runat="server" Text="MM/DD/YYYY"></asp:TextBox>
        </p>
        <asp:Button ID="btn_addoffer" runat="server" Text="Add Offer" OnClientClick="validate()" OnClick="post" align="left"/>
        <asp:Button ID="btn_back" runat="server" Text="Back" OnClientClick="validate()" OnClick="Back" align="right" />
    </form>
</body>
</html>
