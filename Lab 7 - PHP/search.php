<?php
    session_start();
    $con = mysqli_connect("localhost","root","","multimedia");
    if (!$con) 
    {
        die('Could not connect: ' . mysqli_error());
    }
    
    $genre = mysqli_real_escape_string($con,$_GET['genre']);
    $sql = "SELECT * FROM multimedia WHERE genre=?;";

    $stmt = mysqli_stmt_init($con);

    if(!mysqli_stmt_prepare($stmt,$sql))
    {
        echo "Sql statement failed" . $sql . ":-" . mysqli_error($con);
    }
    else
    {
        mysqli_stmt_bind_param($stmt,"s",$genre);

        mysqli_stmt_execute($stmt);

        $result = mysqli_stmt_get_result($stmt);

        echo "<h2>Searching document:</h2>";
        while($row = mysqli_fetch_assoc($result)){	
                echo '<p style="font-size:30px; font-style: italic; ">' . $row['title'] . '</p>';
                echo "<br>";
                echo '<p style="font-size:15px;  margin-left: 30px; margin-top: -30px;">' . $row['type'] . '</p>';
                echo "<br>";
                echo '<p style="font-size:15px;  margin-left: 30px; margin-top: -30px;">' . $row['genre'] . '</p>';
                echo "<br>";
                echo '<p style="font-size:15px;  margin-left: 30px; margin-top: -30px;">' . $row['path'] . '</p>';   
            }
    }
?>