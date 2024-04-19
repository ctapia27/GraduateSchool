<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title> Login page </title>
</head>
<body>

<?php

if($_SERVER['REQUEST_METHOD']== 'POST'){
    $servername = "carlaistm.shop";
    $username = "carlatapia";
    $password = "s,Dbg+&x~WJa";
    $dbname = "USER";

    $conn = mysqli_connect($servername, $username, $password, $dbname);

    $input_username = mysqli_real_escape_string($conn, $_POST['username']);
    $input_password = mysqli_real_escape_string($conn, $_POST['password']);

    $query = "SELECT * FROM user_info WHERE username = '$input_username' AND password = '$input_password'";
    $result = $conn->query($query);

    if ($result->num_rows == 1) {
        session_start();
        $_SESSION['username'] = $input_username;
        $_SESSION['session_id'] = session_id(); 
        echo $_SESSION['username'];
        echo " user has logged in.";
        echo "<br>";
        echo "Session has started.";
        echo "<br>";
        echo "The sessionID is: ";
        echo $_SESSION['session_id'];
    }
    else{
        echo "User or password is incorrect";
        echo "<br>";
        echo "<a href='login.php'>Click here</a> to return to the login page.";
    }

}
 
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
</html>