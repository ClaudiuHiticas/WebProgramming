<%@ Page Language="C#" Inherits="Nou.Register" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Register</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<form id="form2" runat="server">
		<div>
            <div class="welcome">Register</div>
             <span>
              You have already an account?
              <a href="Default.aspx">Log In</a>
            </span>
                <br><br>
            <div>
                <span>Username:</span><br>
                <asp:TextBox id="text1" placeholder="Username" runat="server"></asp:TextBox>
            </div>
                <br>
            <div>
                <span>Password:</span><br>
                <asp:TextBox id="text2" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
            </div>
                <br>
            <asp:Button CssClass="button" runat="server" Text="Register" OnClick="registerBtn"></asp:Button>
                <br>
            <asp:Label id="Label2" runat="server" Text=""></asp:Label>
                        
        </div>
	</form>
</body>
</html>
