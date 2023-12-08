<?php
require_once('../mysqli_config_project.php'); // Connect to the database

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $searchFirstName = isset($_POST['field1']) ? $_POST['field1'] : '';
    $searchLastName = isset($_POST['field2']) ? $_POST['field2'] : '';

    if (empty($searchFirstName) && empty($searchLastName)) {
        echo '<script>
                alert("Please enter a value in one of the fields!");
                window.location.href = "search_by_name.php";
            </script>';
    }

    $query = "SELECT * FROM Employee WHERE 1";

    if (!empty($searchFirstName)) {
        $query .= " AND LOWER(FName) = LOWER(?)";
    }

    if (!empty($searchLastName)) {
        $query .= " AND LOWER(LName) = LOWER(?)";
    }

    $stmt = mysqli_prepare($dbc, $query);

    if (!$stmt) {
        echo "<h2>We are unable to process this request right now.</h2>";
        echo "<h3>Please try again later.</h3>";
        exit;
    }

    if (!empty($searchFirstName) && !empty($searchLastName)) {
        mysqli_stmt_bind_param($stmt, "ss", $searchFirstName, $searchLastName);
    } elseif (!empty($searchFirstName)) {
        mysqli_stmt_bind_param($stmt, "s", $searchFirstName);
    } elseif (!empty($searchLastName)) {
        mysqli_stmt_bind_param($stmt, "s", $searchLastName);
    }

    $result = mysqli_stmt_execute($stmt);

    if ($result) {
        $result = mysqli_stmt_get_result($stmt);
        $all_rows = mysqli_fetch_all($result, MYSQLI_ASSOC);

        if (empty($all_rows)) {
            echo "No results found.";
        } 
    } else {
        echo "<h2>We are unable to process this request right now.</h2>";
        echo "<h3>Please try again later.</h3>";
        exit;
    }

    mysqli_stmt_close($stmt);
    mysqli_close($dbc);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Employee Info</title>
</head>

<body>

    <h1 style="display: flex;">
        <a href="index.html" style="text-decoration: none; color: #ffffff; font-size: 20px;">
            &#9664; Back To Home 
        </a>
        <span style="margin: 0 auto; position:relative; left: -80px;">Search Employee</span>
    </h1>

    <form id="myForm" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
        <label for="field1">Search by First Name: </label>
        <input class="capitalize" type="text" id="field1" name="field1" placeholder="Enter employees first name">

        <label for="field2">Search by Last Name: </label>
        <input class="capitalize" type="text" id="field2" name="field2" placeholder="Enter employees last name">

    
        <input type="submit" value="Submit">
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.6/jquery.inputmask.min.js"></script>

    <p>
        <u>Valid First Names:</u> Michael, Julia, Luke.
        <br>
        <u>Valid Last Names:</u> Mills, Clark, Watson.
        <br>
        <u>Valid Full Names:</u> Anna Reynolds, Nathan Martin
    </p>


    <?php if (isset($result)) : ?>
        <p style="margin-left: 20px; font-size: 20px; text-align: left; font-weight: bold;">
            <?php
                if (empty($all_rows)) {
                    echo '* No results found for "';
                } else {
                    echo '* Showing results for "';
                }
    
                if (!empty($searchFirstName) && !empty($searchLastName)) {
                    echo $searchFirstName . ' ' . $searchLastName;
                } else {
                    echo $searchFirstName . $searchLastName;
                }

                echo '"';
            ?>
        </p>

    
        <table>
            <tr>
                <th>EmployeeID</th>
                <th>FName</th>
                <th>LName</th>
                <th>PhoneNumber</th>
                <th>PilotLicense</th>
                <th>AirportCode</th>
            </tr>
            <?php foreach ($all_rows as $checkout) : ?>
                <tr>
                    <td><?= $checkout['EmployeeID'] ?></td>
                    <td><?= $checkout['FName'] ?></td>
                    <td><?= $checkout['LName'] ?></td>
                    <td><?= $checkout['PhoneNumber'] ?></td>
                    <td><?= $checkout['PilotLicense'] ?></td>
                    <td><?= $checkout['AirportCode'] ?></td>
                </tr>
            <?php endforeach; ?>
        </table>
        <p style="padding-bottom: 40px;"></p>
    <?php endif; ?>
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

    p {
        font-size: 20px;
        font-weight: bold;
        line-height: 1.75; 
    }

    .capitalize {
        text-transform: capitalize;
    }

    h1 {
        background-color: #e60000;
        color: #ffffff;
        font-size: 36px;
        margin-bottom: 20px;
        padding: 10px;
        display: flex;
    }

    table {
        width: 100%;
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

    body {
        font-family: Arial, sans-serif;
    }

    form {
        max-width: 400px;
        margin: 0 auto;
        text-align: center;
    }

    label {
        display: block;
        text-align: left;
        margin-bottom: 8px;
    }

    input {
        width: 100%;
        padding: 8px;
        margin-bottom: 16px;
        font-size: 16px;
    }

    input.capitalize {
        text-transform: capitalize;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        font-size: 18px;
        border: none;
        cursor: pointer;
        margin-left: 10.75px;
        display: block;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>

</html>