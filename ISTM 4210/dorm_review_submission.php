<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title> Dorm Review Submission </title>
</head>
<body>

<?php
/*
Filename: add_yourname.php
Description: This file takes the data provided by a form and adds it to a table within a MySQL database
Author: Carla Tapia
Date: November 7, 2023
*/

//MySQL connection parameters. Remains the same for all connections to the database
$servername = "carlaistm.shop";
$username = "Carla";
$password = "&5hBg6d^~{A{";
$dbname = "dorm_reviews";

// Create connection
$conn = mysqli_connect($servername, $username, $password);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

//Select database
mysqli_select_db ($conn , $dbname);

// SQL statement to insert form posted data into table:course and store statement in a variable $sql
// the variable parameters on the right are inside the $_POST are received from the form.
// Code below is an example.

$sql = "INSERT INTO student_review set 
USERNAME = '$_POST[username]',
FIRST_NAME = '$_POST[fname]',
LAST_NAME = '$_POST[lname]',
EMAIL = '$_POST[email]',
DORM = '$_POST[specificdorm]',
RATING = '$_POST[rating]',
REVIEW = '$_POST[dormreview]'";

// Insert SQL data in MySQL database table
mysqli_query($conn, $sql);

// Display confirmation
echo "Your new review has been created. <br>";
header("Location:http://carlaistm.shop/4210/submission.html");

// Close connection
mysqli_close($conn);
?>
</span>

</body>
</html>