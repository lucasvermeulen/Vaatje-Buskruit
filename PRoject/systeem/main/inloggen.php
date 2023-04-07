<?php
session_start();
include('../html/header.php');
$inlognaam = $_POST ['inloggen'];
$wachtwoord = $_POST ['password'];

$_SESSION['ingelogd']='ja';

include('./database.php');

//query voor ophalen van gebruiker info
$query_gebruikerinfo="SELECT gebruiker.inlognaam, gebruiker.wachtwoord, gebruiker.dienst, d.dienst_naam, gebruiker.id
        FROM gebruiker 
        INNER JOIN dienst AS d ON gebruiker.dienst=d.id
        WHERE gebruiker.inlognaam='$inlognaam'";
        

$result=mysqli_query($connectie, $query_gebruikerinfo);
$aantal=mysqli_num_rows($result);
$row=mysqli_fetch_assoc($result);

echo("<div id=inlog_container>
<div class='inlog' id='inloggen_function'>"); 
if($inlognaam == ""){
    echo ("U bent niet bekent in ons systeem");
    header("refresh:3, url=./inlog.php");
        exit();
}
$_SESSION['gebruiker']=$row['id'];
//check of in het systeem zit
if ($aantal == 0) {
    echo ("U bent niet bekent in ons systeem");
        header("refresh:3, url=./inlog.php");
} else {//check wat gebruiker voor functie heeft
    if ($row['dienst_naam'] == 'kassa' and $wachtwoord == $row['wachtwoord']) {
        echo ('Welkom ' . $inlognaam);
        header("refresh:2, url=./kassa.php");
        $_SESSION['bon_gegevens']='';
    } elseif ($row['dienst_naam'] == 'magazijn' and $wachtwoord == $row['wachtwoord']) {
        echo ('Welkom ' . $inlognaam);
        header("refresh:2, url=./magazijn.php");
    } else {
        echo ("U bent niet bekent in ons systeem");
        header("refresh:3, url=./inlog.php");
    } 
}
include('../html/footer.php');
echo("    </div>
</div>");
?>

