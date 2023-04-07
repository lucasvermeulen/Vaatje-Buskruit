<?php

$query_l="SELECT l.id, l.leverancier_naam
            FROM leverancier AS l";

$query_a="SELECT a.id, a.artikelgroep_id
            FROM artikelgroep AS a";

$result_leverancier=mysqli_query($connectie, $query_l);
$result_artikelgroep=mysqli_query($connectie, $query_a);



echo('<label for="leverancier">Leverancier </label><select id="magazijn_zoek_input" name="leverancier"  >');
        echo('<option value="" ></option>');
        while($row_leverancier=mysqli_fetch_array($result_leverancier)){
            if ($row_leverancier['1'] == $row_product['leverancier_naam']){
                echo('<option selected value="'. $row_leverancier['0'] . '" >'.$row_leverancier['1'] . '</option>');
            } else {
            echo('<option value="'. $row_leverancier['0'] . '" >'.$row_leverancier['1'] . '</option>');
            }
        };

        echo('</select><br>');


        echo('<label for="artikelgroep">Artikelgroep</label><select id="magazijn_zoek_input" name="artikelgroep"">');
        echo('<option value=""></option>');
        while($row_artikelgroep=mysqli_fetch_array($result_artikelgroep)){
            if ($row_artikelgroep['1'] == $row_product['artikelgroep_id']){
                echo('<option selected value="'. $row_artikelgroep['0'] . '" >'.$row_artikelgroep['1'] . '</option>');
            } else {
            echo('<option value="'. $row_artikelgroep['0'] . '" >'.$row_artikelgroep['1'] . '</option>');
            }

        };

        echo('</select><br>');

?>