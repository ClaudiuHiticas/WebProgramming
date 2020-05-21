<%@ Page Language="C#" Inherits="Nou.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<form id="form1" runat="server">
		<div>
            <div class="welcome">Welcome</div>
            <div>
                <span>Username:</span><br>
                <asp:TextBox id="t1" placeholder="Username" runat="server"></asp:TextBox>
            </div>
            <div>
                <span>Password:</span><br>
                <asp:TextBox id="t2" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
            </div>
                
            <asp:Button CssClass="button" runat="server" Text="Login" OnClick="Button_Click"></asp:Button>
                
            <asp:Label id="Label1" runat="server" Text=""></asp:Label>
                        
                    
                        
        </div>
	</form>
</body>
</html>
