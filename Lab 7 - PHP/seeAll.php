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
    <title>Multimedia files</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <style>
       
    </style>
</head>
<body>
    <div class="main">
        <a href="mainPage.php" class="button">Back</a>
        <h2>All files</h2>
        <br>
        <input type="text" placeholder="Enter genre" id="genreInput">
        <button id="search" onclick="filter()">Search</button>
        
        <br>
        <div id="filterDiv"></div>
        <br>

        <?php
            $result = mysqli_query($con, "SELECT * FROM multimedia");
        
            echo "<h2>All the files:</h2>";
            while($row = mysqli_fetch_array($result)){
                echo '<p style="font-size:30px; font-style: italic; ">' . $row['title'] . '</p>';
                echo "<br>";
                echo '<p style="font-size:15px;  margin-left: 30px; margin-top: -30px;">' . $row['type'] . '</p>';
                echo "<br>";
                echo '<p style="font-size:15px;  margin-left: 30px; margin-top: -30px;">' . $row['genre'] . '</p>';
                echo "<br>";
                echo '<p style="font-size:15px;  margin-left: 30px; margin-top: -30px;">' . $row['path'] . '</p>';
                echo "<div>";
            }
            mysqli_close($con);
        ?> 
    </div>
    <script>
        function filter(){
            var genre = document.getElementById("genreInput").value;

            if(window.XMLHttpRequest)
            {
                xmlhttp = new XMLHttpRequest();
            }
            else
            {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.open("GET","search.php?genre="+genre, true);
            xmlhttp.send();
            xmlhttp.onreadystatechange = function()
            {
                if(this.readyState==4 && this.status == 200)
                {
                    document.getElementById("filterDiv").innerHTML = this.responseText;
                }
            }
        }
    </script>
    <div>
</body>
</html>