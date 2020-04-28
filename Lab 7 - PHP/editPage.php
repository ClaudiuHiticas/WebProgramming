<?php
    session_start();
    $con = mysqli_connect("localhost","root","","multimedia");
    if (!$con) 
    {
        die('Could not connect: ' . mysqli_error());
    }
    if ( $_SERVER['REQUEST_METHOD'] == 'POST')
    {   
        $mediaTitle = $_POST['title'];
        $queryStr = "SELECT * FROM multimedia WHERE title='" . $mediaTitle . "' " ;
        $sqlResult = mysqli_query($con, $queryStr);
        if (mysqli_num_rows($sqlResult) >= 1)
        {
            $queryStrr = "SELECT id FROM multimedia WHERE title='" . $mediaTitle . "' " ;
            $mediaId = mysqli_query($con, $queryStrr);
            $idd= $mediaId->fetch_array();
            $finalId = $idd[0];

            $mediaType = $_POST['type']; 
            $mediaGenre = $_POST['genre'];
            $mediaPath = $_POST['path'];

        
            $queryUpp = "UPDATE multimedia 
                        SET type='" . $mediaType . "' , genre= '" . $mediaGenre . "', Path='" . $mediaPath . "' 
                        WHERE   title='" . $mediaTitle . "' ";
            mysqli_query($con, $queryUpp);
            echo "File edited succesfully";
        }
    }
?>

<!doctype html>
<html>
<head>
    <title> Edit </title>
    <style>
        input, button
        {   
            width: 300px;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            margin-left: 150px;
            margin-top: 40px;
        }
        form
        {
            width: 600px;
            padding: 10px 55px 40px;
            border-radius: 2px;
            font-size: 15px;
            height:500px;
        }
        #submit
        {
            padding: 10px 15px;
            background-color:  #346f8c;
            border-radius:4px;
            color: white;
            font-weight: bold;
            margin-left: -200px;
            margin-top: 600px;
            position: absolute;
            top: 50px;
        }
    </style>
</head>
<body>
<div class="main">
<a href="mainPage.php" class="button">Back</a>

    <h2>Edit file by name</h2>
    <form method="POST" action="editPage.php">
    <input type="text" placeholder="Enter Title" name="title">
    <input type="text" placeholder="Enter Type" name="type">
    <input type="text" placeholder="Enter Genre" name="genre">
    <br>
    <input type="file" id="real-file" hidden="hidden" />
    <button type="button" id="custom-button">CHOOSE A FILE</button>
    <br>
    <input type="text" placeholder="Path" name="path" id="path" readonly>
    <button id="submit" type="submit" name="sub">SUMBIT</button >
    </form>
</div>
<script>
    const realFileBtn = document.getElementById("real-file");
    const customBtn = document.getElementById("custom-button");
    const customTxt = document.getElementById("custom-text");

    customBtn.addEventListener("click", function() {
        realFileBtn.click();
    });

    realFileBtn.addEventListener("change", function() {
        if (realFileBtn.value) {
            document.getElementById("path").value = realFileBtn.value;
        }
    });
</script>
</body>
</html>