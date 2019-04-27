<?php
/**
 * using mysqli_connect for database connection
 */

$dbHost = '127.0.0.1';
$dbName = 'atlanta';
$dbUser = 'atlanta';
$dbPass = 'v3PZ2F6r9enJXzz';
$dbPort = '3306';

$conn = mysqli_connect($dbHost, $dbUser, $dbPass, $dbName, $dbPort);

if (!$conn) {
  die("Connection failed : " . mysqli_connect_error());
}

//echo "success connect to database"
?>
