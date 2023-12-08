<?php
require_once('../mysqli_config_project.php'); // Connect to the database

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $passportNumber = isset($_POST['field1']) ? $_POST['field1'] : '';
    $firstName = isset($_POST['field2']) ? $_POST['field2'] : '';
    $lastName = isset($_POST['field3']) ? $_POST['field3'] : '';
    $numberOfBags = isset($_POST['field4']) ? $_POST['field4'] : '';


    $findDuplicateQuery = "SELECT * FROM Passenger where PassportNumber = '$passportNumber'";

    $rowsQuery = mysqli_prepare($dbc, $findDuplicateQuery);
    mysqli_stmt_execute($rowsQuery);
    $rowsResult = mysqli_stmt_get_result($rowsQuery);
    $numOfRows = mysqli_num_rows($rowsResult);

    if ($numOfRows > 0) {
        echo '<script>
                alert("Error: Duplicate passport number entry found. Please provide another value.");
                window.location.href = "create_passenger.php";
              </script>';
        exit; 
    }

    $insertQuery = "CALL InsertPassenger(?, ?, ?, ?)";
    
    try {
        $stmt = mysqli_prepare($dbc, $insertQuery);
        mysqli_stmt_bind_param($stmt, "sssi", strtoupper($passportNumber), $firstName, $lastName, $numberOfBags);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
    } catch (PDOException $e) {
        if ($e->getCode() == 1062) {
            echo "Error: Duplicate entry. Please provide unique values.";
        } else {
            echo "An error occurred while processing your request. Please try again later.";
        }
    }

    $query = "SELECT * FROM Passenger ORDER BY (FName = ? and LName = ?) DESC";
    $stmt = mysqli_prepare($dbc, $query);
    mysqli_stmt_bind_param($stmt, "ss", $firstName, $lastName);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    
    if (!$result) {
        echo "<h2>We are unable to process this request right now.</h2>";
        echo "<h3>Please try again later.</h3>";
        exit;
    }

    $all_rows = mysqli_fetch_all($result, MYSQLI_ASSOC);

    mysqli_close($dbc);
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Passenger</title>
</head>

<body>

    <h1 style="display: flex;">
        <a href="index.html" style="text-decoration: none; color: #ffffff; font-size: 20px;">
            &#9664; Back To Home 
        </a>
        <span style="margin: 0 auto; position:relative; left: -80px;">Create Passenger</span>
    </h1>

    <form id="myForm" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
        <label for="field1">Passport Number: </label>
        <input class="uppercase" type="text" id="field1" name="field1" placeholder="Enter a total of 9 chars/ints. Ex: D00366190" required>
        <br>

        <label for="field2">First Name:</label>
        <input class="capitalize" type="text" id="field2" name="field2" placeholder="Enter string. Ex: Kevin" required>
        <br>

        <label for="field3">Last Name:</label>
        <input class="capitalize" type="text" id="field3" name="field3" placeholder="Enter string. Ex: Smith" required>
        <br>

        <label for="field4">Number Of Bags:</label>
        <input class="capitalize" type="text" id="field4" name="field4" placeholder="Enter an int. Ex: 4" required>
        <br>

        <input type="submit" value="Submit">
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.6/jquery.inputmask.min.js"></script>

    <script>

        Inputmask("", {
            regex: "[A-Z0-9]{9}",
            casing: "Uppercase"
        }).mask(document.getElementById('field1'));

        Inputmask({ regex: "^[A-Za-z\\s]{1,50}$" }).mask(document.getElementById('field2')); // First name 
        Inputmask({ regex: "^[A-Za-z\\s]{1,50}$" }).mask(document.getElementById('field3')); //Last name

        Inputmask("", {
            placeholder: "", 
            regex: "^[1-9]$"
        }).mask(document.getElementById('field4')); //num of bags
    </script>

    
    <p style="margin-left: 20px; font-size: 20px; text-align: left; font-weight: bold;">
        <?php
            if (isset($result)) {
                $numRows = mysqli_num_rows($result);
                $decrementedNumRows = $numRows - 1;
                echo "* Showing Rows 0 - " . $decrementedNumRows . " (" . $numRows . " Total). Look for your passenger in the top rows.";
            }
        ?>
    </p>

    <?php if (isset($result)) : ?>
        <table>
            <tr>
                <th>PassportNumber</th>
                <th>FName</th>
                <th>LName</th>
                <th>NumBags</th>
            </tr>
            <?php foreach ($all_rows as $checkout) : ?>
                <tr>
                    <td><?= $checkout['PassportNumber'] ?></td>
                    <td><?= $checkout['FName'] ?></td>
                    <td><?= $checkout['LName'] ?></td>
                    <td><?= $checkout['NumBags'] ?></td>
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

    #submitButton:disabled {
        background-color: #FF0000; /* Red background color */
        color: #FFFFFF; /* White text color */
        cursor: not-allowed; /* Show a not-allowed cursor */
    }

    .uppercase {
        text-transform: uppercase;
    }

    .uppercase::placeholder {
        text-transform: none; /* This ensures the placeholder is not transformed to uppercase */
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

    input.uppercase {
        text-transform: uppercase;
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