<?php
include('../html/header.php');

error_reporting(E_ERROR | E_PARSE);

session_start();
if(isset($_SESSION['ingelogd'])){
} else {
    header("refresh:1, url=./inlog.php");
    exit();
}
include('./database.php');
?>

<!--keypad-->

<div id="systeem_container">

<div id="systeem_function_container">
<div id="kassa_left_block_container">
    <div id="kassa_search">
    <form method="POST" id="kassa_bon">
        
    <input id="kassa_input" value="" name="kassa_input"></input>
    
    </div>
    <div id="kassa_calculator"> 
    <table id="kassa_table">
    <tbody>
    <tr id="kassa_tr">
    <td id="kassa_td" name="kassa_keypad" id="kassa_keypad" value="7" onclick="verwerkVoornaam(7, 0)">7</td">
    <td id="kassa_td" name="kassa_keypad" id="kassa_keypad" value="8" onclick="verwerkVoornaam(8, 0)">8</td">
    <td id="kassa_td" name="kassa_keypad" id="kassa_keypad" value="9" onclick="verwerkVoornaam(9, 0)">9</td">
    <td id="kassa_td" rowspan="2" name="kassa_keypad" id="kassa_keypad" value="verwijder" onclick="verwerkVoornaam('verwijder')"><</td">
    </tr id="kassa_tr">
    <tr id="kassa_tr">
    <td id="kassa_td" name="kassa_keypad" id="kassa_keypad" value="4" onclick="verwerkVoornaam(4, 0)">4</td">
    <td id="kassa_td" name="kassa_keypad" id="kassa_keypad" value="5" onclick="verwerkVoornaam(5, 0)">5</td">
    <td id="kassa_td" name="kassa_keypad" id="kassa_keypad" value="6" onclick="verwerkVoornaam(6, 0)">6</td">
    
    </tr id="kassa_tr">
    <tr id="kassa_tr">
    <td id="kassa_td" name="kassa_keypad" id="kassa_keypad" value="1" onclick="verwerkVoornaam(1, 0)">1</td">
    <td id="kassa_td" name="kassa_keypad" id="kassa_keypad" value="2" onclick="verwerkVoornaam(2, 0)">2</td">
    <td id="kassa_td" name="kassa_keypad" id="kassa_keypad" value="3" onclick="verwerkVoornaam(3, 0)">3</td">
    
    <?php
    
    ?>
    <td id="kassa_td" rowspan="2" name="kassa_keypad" id="kassa_keypad" value="enter" ><input type="submit" value="enter" id="kassa_keypad" onclick="verwerkVoornaam('enter','<?php echo($artikelnum_kassa);?>'); "></td">
    
    <!--<td id="kassa_td" rowspan="2"><input type="submit" value="enter" id="kassa_keypad" onclick="verwerkVoornaam('enter')">-->
    
    </tr id="kassa_tr">
    <tr id="kassa_tr">
    
    <td id="kassa_td" colspan="2" name="kassa_keypad" id="kassa_keypad" value="0" onclick="verwerkVoornaam(0, 0)">0</td">
    
    <td id="kassa_td" name="kassa_keypad" id="kassa_keypad" value="keer" onclick="verwerkVoornaam('*', 0);">*</td>
  
    </tr id="kassa_tr">
    </tbody>
    </table>
    
    </div>
    </form>
</div>


    

<?php
//delete uit je transactie als aantal 0 is
$qry_delete= "DELETE FROM bestelling_regel WHERE aantal = 0";
mysqli_query($connectie, $qry_delete);

$artikelnum=is_numeric($_POST['kassa_input']) ? ($_POST['kassa_input']) : "";

if($_SESSION['bestelling'] != ""){

}else{
    //query maak een nieuwe session aan in bestelling overzicht
    global $connectie;
    $query_bestelling="INSERT INTO `bestelling`(`gebruiker_id`) VALUES ('". $_SESSION['gebruiker']."')";
    $bestelling_resultaat=mysqli_query($connectie, $query_bestelling);
    //pak de laatste session nummer
    $query_bestelling="SELECT  *  FROM bestelling ORDER BY id DESC LIMIT 1";
    $bestelling_resultaat=mysqli_query($connectie, $query_bestelling);
    $row_bestelling=mysqli_fetch_assoc($bestelling_resultaat);
    
    $_SESSION['bestelling']  = $row_bestelling['id'];
}


if($artikelnum != ''){
//query om de product gegevens te paken
    $query_p_lookup="SELECT p.artikelnummer, p.omschrijving, p.eenheid, p.prijs, p.aantal FROM product AS p WHERE artikelnummer LIKE $artikelnum";
    $result=mysqli_query($connectie, $query_p_lookup);
    $row_product=mysqli_fetch_array($result);

//query check of artikel in het systeem
    $query_bestelling_check="SELECT p.artikelnummer, p.omschrijving, p.eenheid, p.prijs, p.aantal
    FROM product AS p
    WHERE artikelnummer = $artikelnum";
    $bestelling_check=mysqli_query($connectie, $query_bestelling_check);
    $aantal=mysqli_num_rows($bestelling_check);
    if ($aantal>0){
//check of product al in de session zit
        $query_bestelling_regel="SELECT  *  FROM bestelling_regel WHERE bestelling_id = {$_SESSION['bestelling']} AND artikelnummer = $artikelnum";
        $bestelling_regel_resultaat=mysqli_query($connectie, $query_bestelling_regel);
        $aantal_bestelling_regel=mysqli_fetch_assoc($bestelling_regel_resultaat);
        $aantal=mysqli_num_rows($bestelling_regel_resultaat);
        if ($aantal>0){
            echo "<script>alert('Artikel staat al op de bon');</script>";
        }else{
//als hij nog niet in session zit zet hem er in
            $query_bestelling_regel="INSERT INTO `bestelling_regel`(`bestelling_id`, `artikelnummer`, `aantal`, `prijs`) VALUES ('{$_SESSION['bestelling']}','$artikelnum','1','".$row_product['prijs']."')";
            $bestelling_regel_resultaat=mysqli_query($connectie, $query_bestelling_regel);
        }
    }else{
        echo "<script>alert('Artikel niet in het systeem');</script>";
    }
    
}
//query om all gegevens uit de huidig session te halen
$query_bestelling_regel="SELECT  *  FROM bestelling_regel WHERE bestelling_id = {$_SESSION['bestelling']}";
$bestelling_regel_resultaat=mysqli_query($connectie, $query_bestelling_regel);

echo('<div id="kassa_right_block"> ');
//maken van de tabel
echo("<table>");
echo("<tr>
<th>artikelnummer</th>
    <th>omschrijving</th>
    <th>eenheid</th>
    <th>prijs</th>
    <th>aantal</th>
    </tr>");

$total = 0;
while($row_bestelling_regel=mysqli_fetch_assoc($bestelling_regel_resultaat)){    
    $query_product="SELECT  *  FROM product WHERE artikelnummer = {$row_bestelling_regel['artikelnummer']}";
    $product_resultaat=mysqli_query($connectie, $query_product);
    $row_product=mysqli_fetch_assoc($product_resultaat);
    echo("<tr>");
        echo("<td>".$row_bestelling_regel['artikelnummer']. "</td>" );         
        echo("<td>".$row_product['omschrijving']. "</td>" ); 
        echo("<td>".$row_product['eenheid']. "</td>" ); 
        echo("<td>".$row_bestelling_regel['prijs']. "</td>" ); 
        echo("<td>".$row_bestelling_regel['aantal']. "</td>" );
        //hier kan je mee plus en min doen 
        echo("<td><a href='./toevoegen.php?bestelling_regel_id={$row_bestelling_regel['id']}&oparate=0'class='btn-edit'><span class='material-symbols-outlined'>remove</span></a>");
    echo("<td><a href='./toevoegen.php?bestelling_regel_id={$row_bestelling_regel['id']}&oparate=1' class='btn-e'><span class='material-symbols-outlined'>
    add
    </span></a>");
    echo("</tr>");
// het totaal aantal afrondens
    $total = $total + ($row_bestelling_regel['prijs']* $row_bestelling_regel['aantal']);
    $total =  round($total * 2, 1) / 2;
}

echo("<table/>");
echo("</div>");
echo('<div id="kassa_bottem">');
echo("</div>");
echo('<div id="kassa_totaal">');

echo('totaal: '.$total);
echo("</div>");

    ?>
    <form method="POST" action="./bon.php" >
    <input type="submit" id="einde_transactie">
    </form>
</div>
<?php
include('../html/footer.php');

?>