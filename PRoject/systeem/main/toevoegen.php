<?php
    
include('../html/header.php');
include('../main/database.php');
session_start();
//hier doe je plus en min op de kassa

$bestelling_regel_id=isset($_GET['bestelling_regel_id']) ? $_GET['bestelling_regel_id'] : 0;
//haal op of we plus of min aanklikken
$operate=$_GET['oparate'];

$query_b_lookup="SELECT * FROM bestelling_regel WHERE id = $bestelling_regel_id";
$result=mysqli_query($connectie, $query_b_lookup);
$row=mysqli_fetch_assoc($result);

$refreshed_amount = 0;
//zet een nummer in de kassa er bij
if($operate == 1){
    $refreshed_amount = $row['aantal'] + 1;

} elseif ($operate == 0 && $row['aantal'] != 0 ){
    $refreshed_amount = $row['aantal'] - 1;

}
//refresh de bestelling
    $qryUpdate_bestelling_regel= "UPDATE bestelling_regel SET aantal=$refreshed_amount WHERE id = '$bestelling_regel_id'";

if (mysqli_query($connectie, $qryUpdate_bestelling_regel)) {
    header("location:./kassa.php");
}
include('../html/footer.php');

?>