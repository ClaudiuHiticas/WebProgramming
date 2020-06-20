<?php
   include('session.php');
?>

<html>
   
   <head>
      <title>Welcome </title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <style>
         table {
         font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
         border-collapse: collapse;
         width: 50%;
         }

         table td, table th {
         border: 1px solid #ddd;
         padding: 8px;
         }

         table tr:nth-child(even){background-color: #f2f2f2;}

         table tr:hover {background-color: #ddd;}

         table th {
         padding-top: 12px;
         padding-bottom: 12px;
         text-align: left;
         background-color: #4CAF50;
         color: white;
         }
      </style>
   </head>
   
   <body>
      <h1>Welcome <?php echo $login_session; ?></h1> 
      <h2><a href = "logout.php">Sign Out</a></h2>
      <?php
      
      $result = mysqli_query($db, "select * from Assets where userid='$login_id'");

      echo "<table border='1'>
         <tr>
         <th>id</th>
         <th>userId</th>
         <th>name</th>
         <th>description</th>
         <th>value</th>
         </tr>";
      while($row = mysqli_fetch_assoc($result)){	
               if($row['value'] > 10)
                  echo '<tr style="background-color:RED;">';
               else 
                  echo "<tr>";
               echo "<td>" . $row['id'] . "</td>";
               echo "<td>" . $row['userid'] . "</td>";
               echo "<td>" . $row['name'] . "</td>";
               echo "<td>" . $row['description'] . "</td>";
               echo "<td>" . $row['value'] . "</td>";
               echo "</tr>";
            }
         echo "</table>";

      mysqli_close($db);
      ?>
      <br><br>
      <div class="alert alert-success alert-dismissible" id="success" style="display:none;">
	      <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
	   </div>
      <form id="fupForm" name="form1" method="post">

         <label>Name:</label><input type = "text" name = "name" id = "name" class = "box"/><br /><br />
         <label>Description:</label><input type = "text" name = "description" id = "description" class = "box" /><br/><br />
         <label>Value:</label><input type = "text" name = "value" id = "value" class = "box" /><br/><br />

         <input type = "submit" value = " Submit " id="butsave"/><br />
      </form>
      <script>
         $(document).ready(function(){
            $("#fupForm").submit(function() {
                var name= $("#name").val();
                var description = $("#description").val();
                var value= $("#value").val();
                var userid = <?php echo $login_id ?>;
                $.ajax({
                    type: "POST",
                    url: "save.php",
                  data: {
                     userid: userid,
                     name: name,
                     description: description,
                     value: value,
                  },
                  cache: false,
                    success: function(data) {
                       console.log(data);
                       alert("sucess");
                    }, 
                    error: function(data){
                       alert(data);
                    }

                });


            });
         });
      
      </script>

   </body>
   
</html>