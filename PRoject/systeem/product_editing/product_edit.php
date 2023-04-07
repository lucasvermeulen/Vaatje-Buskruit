<?php
include('../html/header.php');
include('../main/database.php');
session_start();
//hier edit je een product en zet ook de gegevens in de vakjes

$_SESSION['artikelnummer']=isset($_GET['artikelnummer']) ? $_GET['artikelnummer'] : 0;
//query die de gegevens ophaalt
$query_p_lookup="SELECT p.artikelnummer, p.omschrijving, l.leverancier_naam, a.artikelgroep_id, p.eenheid, p.prijs, p.aantal, p.besteleenheid, l.id
            FROM product AS p
            INNER JOIN leverancier AS l ON p.leverancier=l.id
            INNER JOIN artikelgroep AS a ON p.artikelgroep=a.id
            WHERE artikelnummer = '$_SESSION[artikelnummer]'";
$result_product=mysqli_query($connectie, $query_p_lookup);

$row_product=mysqli_fetch_assoc($result_product);
$btw = $row_product['prijs'] * 0.91;
$btw = round($btw, 2);
echo("<div id='product_edit_magazijn_cont'>
<div class='product_edit_magazijn'>
");
echo('
<div>
    <form action ="../main/dataverwerken.php" method="POST" class="frmDetail">
        <input type="hidden" name="action" value="updateproduct">
        <label for="omschrijving">Omschrijving product</label>
        <input type="text" name="omschrijving" value="'.$row_product['omschrijving']  .'"  placeholder="Nieuwproduct"><br>

        ');
        include('../query/lena.php');
        echo('
        

        <label for="eenheid">eenheid</label>
        <input type="text" name="eenheid" value="'.$row_product['eenheid']  .'"  placeholder="Nieuwproduct"><br>

        <label for="prijs">prijs</label>
        
        <input type="text" name="prijs" value="'.$row_product['prijs']  .'"  placeholder="Nieuwproduct"><br>
        <div id ="product_edit_prijs"> %9 ='. $btw.'</div>
        

        <label for="fklantnaam">aantal</label>
        <input type="text" name="aantal" value="'.$row_product['aantal']  .'"  placeholder="Nieuwproduct"><br>


        <div class="submitbtn">
            
        <input type="submit" id="product_edit_submit" name="submit" value="bewaren" class="btnDetailSubmit">

        </div>
    </form>
</div>');
echo("
</div>
</div>");
include('../html/footer.php');
?>