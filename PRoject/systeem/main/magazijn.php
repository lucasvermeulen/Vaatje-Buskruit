<?php

include('../html/header.php');
error_reporting(E_ERROR | E_PARSE);
//check of gebruiker is ingelogd
session_start();
if(isset($_SESSION['ingelogd'])){
    
} else {
    header("refresh:1, url=./inlog.php");
    exit();
}

include('./database.php');

$qry_chech_under_nul= "SELECT artikelnummer, omschrijving FROM product WHERE aantal < 0";
$UnderNUl=mysqli_query($connectie, $qry_chech_under_nul);
$aantal_underNul=mysqli_fetch_assoc($UnderNUl);
if($aantal_underNul != ""){
echo('<script>alert("de '.$aantal_underNul["omschrijving"].' staat onder de nul in het systeem. Meld dit bij de contact persoon. ");</script>');
$qryUpdateKlant= "UPDATE product
    SET aantal=0
    WHERE artikelnummer={$aantal_underNul['artikelnummer']}";
    mysqli_query($connectie, $qryUpdateKlant);
}
?>

<div id="systeem_container"> 

<div id="systeem_function_container"> 
<!--dit is de kant van het zoeken-->
<div id="magazijn_search"> 
<!--form is voor de zoekopdrachten-->
    <form method="POST" id="magazijn_zoekopdrachten_form">
    Omschrijving:<input type="text" name="omschrijving" id="magazijn_zoek_input"><br>
    <?php
//dit zijn de leverancier en de artikelgroep
    include('../query/lena.php');
    ?>
    Artikelnummer:<input type="text" name="Artikelnummer" id="magazijn_zoek_input"><br>
    <button id="zoekbutton_magazijn" type="submit" name="submit" value="Zoeken "><span class="material-symbols-outlined">search</span></button>
    </form>
<!--importeren van het csv bestand-->
    <div id="inport">
        <form action="./functions.php" method="post" name="frmCSVImport" id="frmCSVImport"
            enctype="multipart/form-data" onsubmit="return validateFile()">
            <div Class="input-row">
                <label>Choose your file.<br> <a href="./producten.csv" download>Download template</a></label>
                <br><br>
                <input type="file" name="file" id="file" class="file" accept=".csv,.xls,.xlsx">
                <div class="import">
                    <button type="submit" id="submit" name="import" class="btn-submit">Import CSV</button>
                </div>
            </div>
    </div>
    </form>
    
</div>
<!--dit is de gezochten kant-->
    <div id="magazijn_tabelfound"> 
    <a href='../product_editing/product_add.php' class='btn-edit'><i class='material-icons md-24'>add</i></a>
    <?php
//hiermee kan je producten opzoeken
function product_lookup($p_optie,$p_search) {
    global $connectie;
    if($_SESSION['page'] < 0){
        $_SESSION['page'] = 0;
        $next = 0;
    }
    //heet p_lookup van wegen product_lookup
    $query_p_lookup="SELECT p.artikelnummer, p.omschrijving, l.leverancier_naam, a.artikelgroep_id, p.eenheid, p.prijs, p.aantal, p.besteleenheid
            FROM product AS p
            INNER JOIN leverancier AS l ON p.leverancier=l.id
            INNER JOIN artikelgroep AS a ON p.artikelgroep=a.id
            WHERE $p_optie=$p_search
            LIMIT {$_SESSION['page']}, 15";            
    $result=mysqli_query($connectie, $query_p_lookup);
    return $result;
    
}
//het ophallen van de zoek functie
$omschrijving = $_POST ['omschrijving'];
$leverancier = $_POST ['leverancier'];
$artikelgroep = $_POST ['artikelgroep'];
$artikelnummer = $_POST ['Artikelnummer'];
//next is voor nextpage 
$next=is_numeric($_GET['next']) ? ($_GET['next']) : "";

#check if thay are emtpy
if ($omschrijving == Null and $leverancier == NULL and $artikelgroep == Null and $artikelnummer == NULL ) {
    //check op welke pagina we zijn voor de tabel
    if(isset($_SESSION['page'])){
        if($next==1){
            $_SESSION['page'] += 15;
        }elseif($next==2){
        $_SESSION['page'] -= 15;
        }
    } else {
        $_SESSION['page'] = 0;
        
    } 
    //zorg er voor dat je de knopen voor volgende pagina kan zien
    $_SESSION['canshow_nextpage'] = 1;
    //laat alles in product tabel zien
    $gezogd = 'artikelnummer';
    $zoeken = "artikelnummer >= 1";
    //p_print = product print
    $p_print = product_lookup($gezogd,$zoeken);
    maketabel();
    }
    
//kijken welke zoekfunctie leeg is
if ($omschrijving !=NULL) {
    $gezogd = 'omschrijving';
    $zoeken = "'$omschrijving'";
    $_SESSION['page'] = 0;
    $_SESSION['canshow_nextpage'] = 0;
    $p_print = product_lookup($gezogd,$zoeken);
    maketabel();
}
if ($leverancier !=NULL) {
    $gezogd = 'leverancier';
    $zoeken = $leverancier;
    $_SESSION['page'] = 0;
    $_SESSION['canshow_nextpage'] = 0;
    $p_print = product_lookup($gezogd,$zoeken);
    maketabel();
}
if ($artikelgroep !=NULL) {
    $gezogd = 'artikelgroep';
    $zoeken = $artikelgroep;
    $_SESSION['page'] = 0;
    $_SESSION['canshow_nextpage'] = 0;
    $p_print = product_lookup($gezogd,$zoeken);
    maketabel();
}
if ($artikelnummer !=NULL) {

    $gezogd = 'artikelnummer';
    $zoeken = "'$artikelnummer'";
    $_SESSION['page'] = 0;
    $_SESSION['canshow_nextpage'] = 0;
    $p_print = product_lookup($gezogd,$zoeken);
    maketabel();
}

//hier maak ik de tabel
function maketabel(){
    echo("<table>");
    echo("<tr><th>Artikelnummer</th>
        <th>Omschrijving</th>
        <th>Leverancier</th>
        <th>Artikelgroep</th>
        <th>Eenheid</th>
        <th>Prijs</th>
        <th>Aantal</th>
        <th>    </th>
        </tr>");
    //loop door de collums en zet de gegevens in een td
    global $p_print;
    while($row_product=mysqli_fetch_array($p_print)){
        echo("<tr>");
        for ($x = 0; $x <= 6; $x++) {
            echo("<td>".$row_product[$x]. "</td>" ); 
            $last_product = $row_product[0];
        }
        //edit knopje / delete knop
        echo("<td><a href='../product_editing/product_edit.php?artikelnummer={$row_product['artikelnummer']}' class='btn-edit'><i class='material-icons md-24'>edit</i></a>
        <a href='../product_editing/product_delete.php?artikelnummer={$row_product['artikelnummer']}' class='btn-delete'><i class='material-icons md-24'>delete</i></a> </td>");
        echo("</tr>");
    }
    //quory om het laaste product te zien
    $query_last_product="SELECT artikelnummer FROM product ORDER BY artikelnummer DESC LIMIT 1";
    global $connectie;
    $last_product_resultaat=mysqli_query($connectie, $query_last_product);
    $row_last_product=mysqli_fetch_assoc($last_product_resultaat);

    //hier laat ik de knoppen zien voor de next page en als het de eerste is mag je niet nog 1 terug
    if($_SESSION['canshow_nextpage'] == 1){
        if($_SESSION['page']==0){
            echo("<a id='nextpage' href='./magazijn.php?next=1'><span class=' material-symbols-outlined'>
            arrow_forward
        </span></a>");

        } elseif($row_last_product['artikelnummer'] == $last_product){
            echo("<a id='nextpage' href='./magazijn.php?next=2'><span class='material-symbols-outlined'>
            arrow_back
            </span></a>");

        } else {    
            echo("<a id='nextpage' href='./magazijn.php?next=2'><span class='material-symbols-outlined'>
            arrow_back
            </span></a>");
            echo("<a id='lastpage' href='./magazijn.php?next=1'><span class=' material-symbols-outlined'>
            arrow_forward
        </span></a>");

        } 
    }
    echo("<tr/><table/>");

}

echo('</div>');
echo('</div></div>');

include('../html/footer.php');

?>