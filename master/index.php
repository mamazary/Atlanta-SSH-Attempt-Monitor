<?php
// Create database connection using database config file
include_once("database.php");

// Query for ssh attempt
$ssh_query = sprintf(
'SELECT node,
       Sum(status = "0") AS `failed`,
       Sum(status = "1") AS `success`,
       Sum(1)            AS `total`
FROM   ssh_log
GROUP  BY node',1
);

//print_r($ssh_query);

// Fetch data from database
$result = mysqli_query($conn, $ssh_query);
?>

<html>
<head>
    <title>Atlanta SSH Monitoring</title>
</head>

<body>

    <table width='80%' border=1>

    <tr>
        <th>Node</th> <th>Failed Attempt</th> <th>Success Attempt</th> <th>Total Attempt</th>
    </tr>
    <?php
        while($ssh_data = mysqli_fetch_array($result)) {
            echo "<tr>";
            echo "<td>".$ssh_data['node']."</td>";
            echo "<td>".$ssh_data['failed']."</td>";
            echo "<td>".$ssh_data['success']."</td>";
            echo "<td>".$ssh_data['total']."</td>";
        }
    ?>
    </table>

    <?php
    // Check If data submitted using POST method, then save all data to variable.
    if(isset($_POST['signal'])) {
        $node = $_POST['node'];
        $ip = $_POST['ip'];
        $status = $_POST['status'];
        $date = $_POST['date'];

        // Insert data into table
        $result = mysqli_query($conn, "INSERT INTO ssh_log (node,ip,status,date) VALUES('$node','$ip','$status','$date')");
    }
    ?>
</body>
</html>
