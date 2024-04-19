<?php
/*
Filename: db_connect.php
Description: This is the connection file to MySQL database on GoDaddy Server
Updated: October 31, 2023
Created by: Carla Tapia
*/

$hostname="carlaistm.shop";
$username="carlatapia";
$password="Soccerbattery27.";
$dbname = "Students";

$con = mysqli_connect($hostname, $username, $password, $dbname);

if(mysqli_connect_error()) {
    echo "Failed to connect" . mysqli_connect_error();
}

if(mysqli_ping($con)) {
    echo "The connection to your database '" . $dbname . " 'is working!";
    echo "</br>User: " . $username;
}

else {
    echo "Error: " . mysqli_error($con);
}

mysqli_close($con);
?>