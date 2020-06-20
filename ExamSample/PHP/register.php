<?php
    session_start();
    $con = mysqli_connect("localhost","root","","try");
    if (!$con) 
    {
        die('Could not connect: ' . mysqli_error());
    }   
    if ( $_SERVER['REQUEST_METHOD'] == 'POST')
    {       
        $username = $_POST['username'];
        $password = $_POST['password']; 
     

        $queryIns = "INSERT INTO Users(username, password) VALUES ( '$username ', '$password') ";
        if(mysqli_query($con, $queryIns))
        {
            echo "Register succesfully";
            header("location: login.php");
        }
        else
        {
            echo "Error: " . $sql . ":-" . mysqli_error($conn);
        }
    }
?>
<html>
   
   <head>
      <title>Register Page</title>
      
      <style type = "text/css">
         body {
            font-family:Arial, Helvetica, sans-serif;
            font-size:14px;
         }
         label {
            font-weight:bold;
            width:100px;
            font-size:14px;
         }
         .box {
            border:#666666 solid 1px;
         }
      </style>
      
   </head>
   
   <body bgcolor = "#FFFFFF">
	
      <div align = "center">
         <div style = "width:300px; border: solid 1px #333333; " align = "left">
            <div style = "background-color:#333333; color:#FFFFFF; padding:3px;"><b>Register</b></div>
				
            <div style = "margin:30px">
               
               <form action = "" method = "post">
                  <label>UserName  :</label><input type = "text" name = "username" class = "box"/><br /><br />
                  <label>Password  :</label><input type = "password" name = "password" class = "box" /><br/><br />
                  <input type = "submit" value = " Submit "/><br />
               </form>
               
					
            </div>
				
         </div>
			
      </div>

   </body>
</html>