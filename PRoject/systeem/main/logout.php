<?php
include('../html/header.php');
include('../main/database.php');
session_start();
// hier log je uit de gebruiker
session_destroy();
session_unset();

echo("<div id=inlog_container>
<div id='inloggen_function'>"); 
echo("u bent uitgelogt");
echo("</div></div>");
$query_p_lookup="SELECT * FROM product";

global $connectie;

$result=mysqli_query($connectie, $query_p_lookup);
$row=mysqli_fetch_assoc($result);


header('location: ./inlog.php');

include('../html/footer.php');
?>