<?php
    // ini_set('error_reporting', 1); // Turn on error reporting - remove once everything works.
    require_once('../mysqli_config_project.php'); // Connect to the database

    #ADD QUERY HERE. THIS IS NOT A VALID QUERY FOR THIS PROJECT. Just for test purposes 
    $query = 'SELECT GetNumAfternoonFlights() AS NumAfternoonFlights';

    $result = mysqli_query($dbc, $query);

    if ($result)
        $all_rows = mysqli_fetch_all($result, MYSQLI_ASSOC); 
    else {
        echo "<h2>We are unable to process this request right now.</h2>";
        echo "<h3>Please try again later.</h3>";
        exit;
    }

    mysqli_close($dbc);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Number of Afternoon Flights</title>
</head>

<body>

    <h1>Number of Afternoon Flights</h1>

    <p style="margin-left: 20px; font-size: 20px; text-align: left; font-weight: bold;">
        <?php
            $numRows = mysqli_num_rows($result);
            $decrementedNumRows = $numRows - 1;
            echo "* Showing Rows 0 - " . $decrementedNumRows . " (" . $numRows . " Total)";
        ?>
    </p>
    
    <table>
        <tr>
            <th>Number of Afternoon Flights</th>
        </tr>
        <?php foreach ($all_rows as $checkout) {
            echo "<tr>";
            echo "<td>" . $checkout['NumAfternoonFlights'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>

<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #001f3f; /* Dark blue background */
        margin: 0;
        padding: 0;
        text-align: center;
        color: #ffffff; /* White text */
    }

    h1 {
        background-color: #e60000; /* White background */
        color: #ffffff; /* Darker red */
        font-size: 36px;
        margin-bottom: 20px;
        padding: 10px; /* Add padding for better visual appearance */
    }

    table {
        width: 20%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #333; /* Dark gray background */
        color: #fff; /* White text */
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #969696; /* Color of table header background */
    }

    tr:nth-child(even) {
        background-color: #656565; /* Lighter colored rows */
    }

    tr:hover {
        background-color: #AFBFBF;
    }
</style>

</html>