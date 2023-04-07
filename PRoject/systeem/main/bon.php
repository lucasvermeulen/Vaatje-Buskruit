<?php
    
include('../html/header.php');
include('../main/database.php');
session_start();
// dit is de  bon van de transactie
// pak de bestelling
$query_bestelling_regel="SELECT  *  FROM bestelling_regel WHERE bestelling_id = {$_SESSION['bestelling']}";
$bestelling_regel_resultaat=mysqli_query($connectie, $query_bestelling_regel);

echo('<div id="bon_uitprint"> ');
//maak tabel
echo("<table>");
echo("<tr>
<th>artikelnummer</th>
    <th>omschrijving</th>
    <th>eenheid</th>
    <th>aantal</th>
    <th>prijs</th>
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
        echo("<td>".$row_bestelling_regel['aantal']. "</td>" ); 
        echo("<td>".$row_bestelling_regel['prijs']. " </td>" ); 
        
        
    echo("</tr>");
    
    $total = $total + ($row_bestelling_regel['prijs']* $row_bestelling_regel['aantal']);
//haal het aantal gekozen product uit de voorraad
    $qryUpdate_product_regel= "UPDATE product
                SET aantal = aantal - {$row_bestelling_regel['aantal']}
                WHERE artikelnummer = {$row_bestelling_regel['artikelnummer']}";
    $product_resultaat=mysqli_query($connectie, $qryUpdate_product_regel);
}
$total =  round($total * 2, 1) / 2;
$btw = $total * 0.91;
$btw =  $total- $btw;
$btw = round($btw, 2);
echo("<tr><td></td> <td></td><td></td><td></td><td>totaal: ".$total. "</td></tr>" ); 
echo("<tr><td></td> <td></td><td></td><td></td><td>btw: ".$btw. "</td></tr>" ); 

echo("<table/>");

echo("</div>");
echo("<table id='bestelling'>");
echo("<tr>
<th >session_nummer</th>
    <th>gebruiker</th>
    <th>datum</th>
    </tr>");
    $query_bestelling="SELECT  *  FROM bestelling WHERE id = {$_SESSION['bestelling']}";
    $bestelling_resultaat=mysqli_query($connectie, $query_bestelling);
    $row_bestelling=mysqli_fetch_assoc($bestelling_resultaat);
    echo("<tr>");
        echo("<td>".$row_bestelling['id']. "</td>" );         
        echo("<td>".$row_bestelling['gebruiker_id']. "</td>" ); 
        echo("<td>".$row_bestelling['datum']. "</td>" ); 

        
        
    echo("</tr>");
    echo("<table/>");


//ga terug naar de transactie en begin opnieuw
    echo('<a id="bon_transactie" href="./kassa.php">volgende klant</a>');
    

$_SESSION['bestelling'] = "";


include('../html/footer.php');

?>