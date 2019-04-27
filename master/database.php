<?php
/**
 * using mysqli_connect for database connection
 */

$dbHost = '127.0.0.1';       // Database Host
$dbName = 'atlanta';         // Database Name
$dbUser = 'atlanta';         // Database Username
$dbPass = 'v3PZ2F6r9enJXzz'; // Database Password
$dbPort = '3306';            // Database port

$conn = mysqli_connect($dbHost, $dbUser, $dbPass, $dbName, $dbPort);

if (!$conn) {
  die("Connection failed : " . mysqli_connect_error());
}

//echo "success connect to database"
?>
