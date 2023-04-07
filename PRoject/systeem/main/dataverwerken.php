<?php
include('../html/header.php');
include('./database.php');

session_start();
// hier verwerk je de data van edit/add

$artikelnummer=$_SESSION['artikelnummer'];

echo("<div id=inlog_container>
<div class='product_edit_magazijn' id='product_dataverwerk_magazijn'>"); 
//kijkt waar hij van daan kwam en stuurd je naar de goede function
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $action = isset($_POST["action"]) ? $_POST["action"] : 'LEEG';
	 switch ($action) {
	    case "updateproduct":
	        updateproduct();
	        break;
	    case "insertproduct":
	        insertproduct();
	        break;
	    case "LEEG":
	    default:
	        echo "geen geldige actie...";
	}
 }
else {
    header('url=index.php');
}



//function voor weizige van gegevens van product
function updateproduct(){
    $omschrijving=isset($_POST['omschrijving']) ? addslashes($_POST['omschrijving']) : "";
    $leverancier=isset($_POST['leverancier']) ? addslashes($_POST['leverancier']) : "";
    $artikelgroep=isset($_POST['artikelgroep']) ? addslashes($_POST['artikelgroep']) : "";
    $eenheid=isset($_POST['eenheid']) ? addslashes($_POST['eenheid']) : "";
    $prijs=isset($_POST['prijs']) ? addslashes($_POST['prijs']) : "";
    $aantal=isset($_POST['aantal']) ? addslashes($_POST['aantal']) : "";

    global $artikelnummer;

    $qryUpdateKlant= "UPDATE product
    SET omschrijving='$omschrijving', leverancier='$leverancier', artikelgroep='$artikelgroep', eenheid='$eenheid', prijs='$prijs', aantal='$aantal'
    WHERE artikelnummer={$artikelnummer}";

    global $connectie;

    if (mysqli_query($connectie, $qryUpdateKlant)) {
        echo "<p>U heeft de {$omschrijving} gewijzigd </p><br>";
        header('refresh: 1; url=./magazijn.php');
        exit();
    };
};
//function voor het maken van een nieuw product
function insertproduct(){
    $omschrijving=isset($_POST['omschrijving']) ? addslashes($_POST['omschrijving']) : "";
    $leverancier=isset($_POST['leverancier']) ? addslashes($_POST['leverancier']) : "";
    $artikelgroep=isset($_POST['artikelgroep']) ? addslashes($_POST['artikelgroep']) : "";
    $eenheid=isset($_POST['eenheid']) ? addslashes($_POST['eenheid']) : "";
    $prijs=isset($_POST['prijs']) ? addslashes($_POST['prijs']) : "";
    $aantal=isset($_POST['aantal']) ? addslashes($_POST['aantal']) : "";
    
    $qryInsertKlant= "insert into product
                            (omschrijving, leverancier, artikelgroep, eenheid, prijs, aantal)
                            values('{$omschrijving}', '{$leverancier}', '{$artikelgroep}', '{$eenheid}', '{$prijs}', '{$aantal}')";

    global $connectie;
    if (mysqli_query($connectie, $qryInsertKlant)) {
        echo "<p>U heeft de {$omschrijving} gewijzigd </p><br>";
        header('refresh: 1; url=./magazijn.php');
        exit();
    }
    else {
        session_destroy();
        session_unset();
        header('refresh: 10; url=./magazijn.php');
        exit();
    }
};
echo("</div></div>");
include('../html/footer.php');

?>


