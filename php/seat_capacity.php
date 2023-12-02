<?php
    require_once('../mysqli_config.php'); // Connect to the database


    $query = '';

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
    <title>Link6</title>
</head>
    <body>

        <h1>link7</h1>

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

    </style>
</html>