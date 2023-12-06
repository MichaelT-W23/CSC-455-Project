<?php 

//PUT THIS IN THE FILE OUTSIDE PUBLIC_HTML 

DEFINE ('DB_USER', '');  //replace yourusername with your own phpmyadmin username
DEFINE ('DB_PASSWORD', ''); //replace this with phpmyadmin password
DEFINE ('DB_HOST', 'localhost');
DEFINE ('DB_NAME', 'CSC455FA23Airline'); 

// Make the connection:
$dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) OR die ('Could not connect to MySQL: ' . mysqli_connect_error() );
//$dbc is a variable representing the current database connection which will be used by other pages to execute queries

?>