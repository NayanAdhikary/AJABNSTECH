<?php

// Create connection
$con = mysqli_connect('localhost','root','','ecommerce') OR die(mysqli_connect());

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}


?>