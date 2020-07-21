<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Today_sDeal.aspx.cs" Inherits="WebApplication5.Today_sDeal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="create Todays Deal"></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" Text="deal_amount"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label7" runat="server" Text="expiry_date"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="create" OnClick="createTodaysDeal" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="check TodaysDeal On Product"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="serial_no"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" Text="check" OnClick="checkTodaysDealOnProduct" />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="add TodaysDeal On Product"></asp:Label>
            <br />
            <asp:Label ID="Label10" runat="server" Text="deal_id"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label11" runat="server" Text="serial_no"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button3" runat="server" Text="add" OnClick="addTodaysDealOnProduct" />
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="remove Expired Deal"></asp:Label>
            <br />
            <asp:Label ID="Label12" runat="server" Text="deal_iD"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="remove" OnClick="removeExpiredDeal" />
            <br />
        </div>
    </form>
</body>
</html>
