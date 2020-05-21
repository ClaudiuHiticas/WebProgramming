<%@ Page Language="C#" Inherits="Nou.home" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>home</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
        <link rel="stylesheet" type="text/css" href="styleHome.css">
       
</head>
<body>
	<form id="form1" runat="server">
            <asp:Button runat="server" Text="Logout" OnClick="LogoutClick"></asp:Button>
            <asp:Button runat="server" Text="Show all files" OnClick="LoadTabData"></asp:Button>
         
            <asp:PlaceHolder id="placeholder1" runat="server"></asp:PlaceHolder>
         
	</form>
    <form id="addFile" runat="server">
        <div>
            <table>
                     <tr>
                        <td>Enter title</td>
                        <td><asp:TextBox id="title" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Enter type</td>
                        <td><asp:TextBox id="type" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Enter genre</td>
                        <td><asp:TextBox id="genre" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Enter path</td>
                        <td><asp:TextBox id="path" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button runat="server" Text="Add File" OnClick="addFileFunc"></asp:Button>
                        </td>
                    </tr>
                </table>        
        </div>
    </form>
        
     <form id="deleteFile" runat="server">
        <div>
        <table>
                <tr>
                    <td>Enter the id of the delete file</td>
                    <td><asp:TextBox id="fileID" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button runat="server" Text="Delete File" OnClick="deleteFileFunc"></asp:Button>
                    </td>
                </tr>
            </table>        
        </div>
    </form>
    <form id="editFile" runat="server">
        <div>
            <table>
                     <tr>
                        <td>Enter the id of the edit file</td>
                        <td><asp:TextBox id="eid" runat="server"></asp:TextBox></td>
                     </tr>
                     <tr>
                        <td>Enter title</td>
                        <td><asp:TextBox id="etitle" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Enter type</td>
                        <td><asp:TextBox id="etype" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Enter genre</td>
                        <td><asp:TextBox id="egenre" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Enter path</td>
                        <td><asp:TextBox id="epath" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button runat="server" Text="Edit File" OnClick="editFileFunc"></asp:Button>
                        </td>
                    </tr>
                </table>        
        </div>
    </form>
    <form id="filterForm" runat="server">
        <div>
        <table>
                <tr>
                   <td>Enter Genre</td>
                   <td><asp:TextBox id="genreFilter" runat="server"></asp:TextBox></td>

                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button runat="server" Text="Filter" OnClick="filterFunc"></asp:Button>
                    </td>
                </tr>
            </table>
            <asp:PlaceHolder id="placeholder2" runat="server"></asp:PlaceHolder>
        </div>
        </form>
        
        
        <script>  
            
        </script>
</body>
</html>

