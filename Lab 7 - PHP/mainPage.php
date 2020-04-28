<?php
session_start();
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
    if (isset ($_POST['btn1']))
    {
        header("location: seeAll.php");
    }
    if (isset ($_POST['btn2']))
    {
        header("location: editPage.php");
    }
    if (isset ($_POST['btn3']))
    {
        header("location: addPage.php");
    }
    if (isset ($_POST['btn4']))
    {
        header("location: deletePage.php");
    }
}
?>

<!doctype html>
<html>
<head>
    <title> Multimedia </title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    <style>
        #header
        {
            position:absolute;
            width:100%;
            top:0;
        }
        img{
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-top: 2%;
            width: 40%;
        }
        .main
        {
            top:0;
            width:100%;
            height: 800px;
        }
        .btn
        {
            padding: 10px;
            background-color: #346f8c;
            border-radius:4px;
            color: white;
            font-weight: bold;
            font-size: 25px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10px;
            width: 800px;            

        }
    </style>
</head>
<body>
<div class="main">
    <img src="multimedia.jpg", alt="">
    <form method= "POST" action="mainPage.php">
    <button class ="btn" id="seeAll" name="btn1">Show all files</button >
    <button class ="btn" id="add" name="btn3">Add multimedia file</button >
    <button class ="btn" id="edit" name="btn2">Edit multimedia file</button >
    <button class ="btn" id="delete" name="btn4">Delete multimedia file</button >
    <form>
</div>


</body>
</html>