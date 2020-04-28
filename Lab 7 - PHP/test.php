<?php

    session_start();
    $con = mysqli_connect("localhost","root","","multimedia");
    if (!$con) {
        die('Could not connect: ' . mysqli_error());
    }

?>

<!doctype html>
<html>
<head>
    <title>multimedia</title>
    <style>
        #header
        {
            position:absolute;
            width:100%;
            top:0;
        }
        .main
        {
            position:absolute;
            top:0;
            width:100%;
            height: 2000px;
            background-color: #ffeee6;
        }
    </style>
</head>
<body>
    <div class="main">
    <?php

        $result = mysqli_query($con, "SELECT * FROM multimedia");
        echo "<table>";
        while($row = mysqli_fetch_array($result)){
            echo "<tr>";
            echo "<td>" . $row['title'] . "</td>";
            echo "<td>" . $row['type'] . "</td>";
            echo "<td>" . $row['genre'] . "</td>";
            echo "<td>" . $row['path'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
        mysqli_close($con);

    ?> 
    </div>
</body>
</html>