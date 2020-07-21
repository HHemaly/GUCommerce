<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCreditCard.aspx.cs" Inherits="WebApplication5.addCreditCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label3" runat="server" Text="number"></asp:Label>
        </div>
        <asp:TextBox ID="TextBox1"  runat="server"  ></asp:TextBox>
      
        <br/>
      
            <asp:Label ID="Label2" runat="server" Text="expiry_date"></asp:Label>
        
        <p>
       
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
      
        </p>
        <p>
        <asp:Label ID="Label1" runat="server" Text="cvv"></asp:Label>
       
            </p>
        <p>
      
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </p>
        <p>
      
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
            </p>
        
    </form>
</body>
</html>
