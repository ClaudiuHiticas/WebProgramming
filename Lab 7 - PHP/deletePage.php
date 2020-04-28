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
                    $queryIns = "DELETE FROM multimedia WHERE title='" . $mediaTitle . "' " ;
                    if(mysqli_query($con, $queryIns))
                    {
                        echo "File deleted succesfully";
                    } 
                    else 
                    {
                        echo "Error: " . $sql . ":-" . mysqli_error($conn);
                    }
                }
                else
                {
                    echo 'No media with that title!';
                }         
      }
?>
<!doctype html>
<html>
<head>
    <title> Delete </title>
    <style>
        label{
            margin-left: 150px;
        }
        input
        {   
            width: 300px;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            margin-left: 150px;
            margin-top: 20px;
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
            margin-top: 150px;
            position: absolute;
            top: 50px;
        }

    </style>
</head>
<body>
<div class="main">
    <a href="mainPage.php" class="button">Back</a>
    <h2>Delete file by name</h2>
    <form method="POST" action="deletePage.php">
    <label>TO BE DELETED MEDIA : </label>
    <input type="text" placeholder="Enter Title" name="title">
    <button id="submit" name="del">Delete Media </button>
    </form>

</div>

</body>
</html>
