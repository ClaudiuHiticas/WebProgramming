<%@ Page Language="C#" Inherits="Nou.home" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>home</title>
    <link rel="stylesheet" type="text/css" href="styleHome.css">
       
</head>
<body>
	<form id="form1" runat="server">
            <asp:Button CssClass="logout" runat="server" Text="Logout" OnClick="LogoutClick"></asp:Button><br>
            <asp:Button CssClass="button" runat="server" Text="Show all files" OnClick="LoadTabData"></asp:Button>
         
            <asp:PlaceHolder id="placeholder1" runat="server"></asp:PlaceHolder>
         
	</form>
    <form id="addFile" runat="server">
        <h2>Add file</h2>

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
                            <asp:Button CssClass="button" runat="server" Text="Add File" OnClick="addFileFunc"></asp:Button>
                        </td>
                    </tr>
                </table>        
        </div>
    </form>
        
     <form id="deleteFile" runat="server">
        <h2>Delete file</h2>

        <div>
        <table>
                <tr>
                    <td>Enter the id of the delete file</td>
                    <td><asp:TextBox id="fileID" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button CssClass="button" runat="server" Text="Delete File" OnClick="deleteFileFunc"></asp:Button>
                    </td>
                </tr>
            </table>        
        </div>
    </form>
    <form id="editFile" runat="server">
        <h2>Edit file</h2>

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
                            <asp:Button CssClass="button" runat="server" Text="Edit File" OnClick="editFileFunc"></asp:Button>
                        </td>
                    </tr>
                </table>        
        </div>
    </form>
    <form id="filterForm" runat="server">
        <h2>Filter</h2>

        <div>
        <table>
                <tr>
                   <td>Enter Genre</td>
                   <td><asp:TextBox id="genreFilter" runat="server"></asp:TextBox></td>

                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button CssClass="button" runat="server" Text="Filter" OnClick="filterFunc"></asp:Button>
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
