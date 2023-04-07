<?php
include('../html/header.php');
include('../main/database.php');
session_start();

//dit is html / het door sturen van je nieuw ingevulde product.
echo("<div id=product_edit_magazijn_cont>
<div class='product_edit_magazijn'>
");
$_SESSION['artikelnummer']=isset($_GET['artikelnummer']) ? $_GET['artikelnummer'] : 0;
?>
<div>
    <form action ="../main/dataverwerken.php" method="POST" class="frmDetail">
        <input type="hidden" name="action" value="insertproduct">
        <label for="omschrijving">Omschrijving product</label>
        <input type="text" name="omschrijving" value="" id="omschrijving" placeholder="Nieuwproduct"><br>

        <?php
        include('../query/lena.php');
        ?>
        

        <label for="eenheid">eenheid</label>
        <input type="text" name="eenheid" value="" id="eenheid" placeholder="Nieuwproduct"><br>

        <label for="prijs">prijs</label>
        <input type="text" name="prijs" value="" id="prijs" placeholder="Nieuwproduct"><br>


        <label for="fklantnaam">aantal</label>
        <input type="text" name="aantal" value="" id="aantal" placeholder="Nieuwproduct"><br>



        <div class="submitbtn">
            
        <input type="submit" id="product_edit_submit"name="submit" value="bewaren" class="btnDetailSubmit">

        </div>
    </form>
</div>
<?php
echo("</div></div>");       
include('../html/footer.php');
?>