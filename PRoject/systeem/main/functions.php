<?php

include('./database.php');
     $csvfile = $_FILES["file"]["tmp_name"];
     $tempfile = tempnam(sys_get_temp_dir(), "csv");
     move_uploaded_file($csvfile, $tempfile);
 
     $rows = array();
     $handle = fopen($tempfile, "r");
     if ($handle) {
         while (($data = fgetcsv($handle, 1000, ",")) !== false) {
             $rows[] = $data;
         }
         fclose($handle);
     }
 
     foreach ($rows as $row) {
         $sql = "INSERT INTO product (omschrijving, leverancier, artikelgroep, eenheid, prijs, aantal)
         VALUES ('" . $row[0] . "', '" . $row[1] . "', '" . $row[2] . "', '" . $row[3] . "', '" . $row[4] . "', '" . $row[5] . "')";
         if ($connectie->query($sql) === false) {
             echo "Error: " . $sql . "<br>" . $connectie->error;
         }
     }
 
 

?>