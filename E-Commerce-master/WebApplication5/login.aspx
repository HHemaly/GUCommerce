<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication5.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
             <asp:Label ID="lbl_username" runat="server" Text="Username: "></asp:Label>
    <br />
        <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
     <br />
        <asp:Label ID="lbl_password" runat="server" Text="Password: "></asp:Label>
    
        <br />
        <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
     
        <asp:Button ID="Btn_login" runat="server" Text="LOGIN" OnClick="Btn_login_Click" OnClientClick="userLogin"  />




     
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="I don't have an account " />
        </p>




     
    </form>
</body>
</html>
