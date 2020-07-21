<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorHome.aspx.cs" Inherits="WebApplication5.VendorHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btn_view" runat="server" Text="View My Products" OnClientClick="validate()" OnClick="GoToViewProducts" align="left"/>
            <asp:Button ID="btn_post" runat="server" Text="Post A Product" OnClientClick="validate()" OnClick="GoToPost" align="right"/>
            <asp:Button ID="btn_edit" runat="server" Text="Edit My Products"  OnClientClick="validate()" OnClick="GoToVendorEdit" align="center"/>
        </div>
        <p>
            <asp:Button ID="btn_postoffer" runat="server" Text="Post An Offer" OnClientClick="validate()" OnClick="GoToPostOffer" align="left"/>
            <asp:Button ID="btn_applyoffer" runat="server" Text="Apply Offer" OnClientClick="validate()" OnClick="GoToApplyOffer" align="center"/>
            <asp:Button ID="btn_expiredoffer" runat="server" Text="Remove Expired Offers" OnClientClick="validate()" OnClick="GoToExpiredOffers" align="right"/>
            </p>
    </form>
</body>
</html>
