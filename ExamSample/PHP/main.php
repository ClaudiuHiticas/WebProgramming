<?php
session_start();
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
    if (isset ($_POST['btn1']))
    {
        header("location: register.php");
    }
    if (isset ($_POST['btn2']))
    {
        header("location: login.php");
    }
    // if (isset ($_POST['btn3']))
    // {
    //     header("location: addPage.php");
    // }
    // if (isset ($_POST['btn4']))
    // {
    //     header("location: deletePage.php");
    // }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Assets</title>
</head>
<body>
    <div class="main">
        <form method= "POST" action="main.php">
        <button class ="btn" id="register" name="btn1">Sign up</button >
        <button class ="btn" id="login" name="btn2">Log In</button >
        <!-- <button class ="btn" id="edit" name="btn3">Edit multimedia file</button >
        <button class ="btn" id="delete" name="btn4">Delete multimedia file</button > -->
        <form>
    </div>
</body>
</html>