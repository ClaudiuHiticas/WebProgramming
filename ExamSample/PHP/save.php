<?php
    include 'config.php';
    $userid = $_POST['userid'];
	$name=$_POST['name'];
	$description=$_POST['description'];
    $value=$_POST['value'];
    echo $name;
	$sql = "INSERT INTO `Assets` (`id`, `userid`, `name`, `description`, `value`) VALUES (NULL, '$userid', '$name', '$description', '$value')";
    
	if (mysqli_query($db, $sql)) {
		echo json_encode(array("statusCode"=>200));
	} 
	else {
		echo json_encode(array("statusCode"=>400));
	}
    mysqli_close($db);
    
?>
 