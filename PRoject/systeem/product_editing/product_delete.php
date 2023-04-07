<?php
include('../html/header.php');
include('../main/database.php');
session_start();
//hier kan je een product deleten
$_SESSION['artikelnummer']=isset($_GET['artikelnummer']) ? $_GET['artikelnummer'] : 0;
$art=isset($_GET['artikelnummer']) ? $_GET['artikelnummer'] : 0;
$query_p_lookup="SELECT p.artikelnummer, p.omschrijving, l.leverancier_naam, a.artikelgroep_id, p.eenheid, p.prijs, p.aantal, p.besteleenheid
            FROM product AS p
            INNER JOIN leverancier AS l ON p.leverancier=l.id
            INNER JOIN artikelgroep AS a ON p.artikelgroep=a.id";

    $result=mysqli_query($connectie, $query_p_lookup);
    $row=mysqli_fetch_assoc($result);

 $qry_delete= "DELETE FROM product
                    WHERE artikelnummer = '$art'";

if (mysqli_query($connectie, $qry_delete)) {
    header('refresh: 1; url=../main/magazijn.php');
    exit();
}
echo($row['artikelnummer']);
include('../html/footer.php');

?>