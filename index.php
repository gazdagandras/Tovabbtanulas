<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Továbbtanulás</title>
    </head>
    <body>
        <h1>Továbbtanulás</h1>
        <?php
        $db = mysqli_connect('localhost', 'root', '', 'tovabbtanulas');
        if (mysqli_connect_errno()) {
            echo mysqli_connect_error();
        }
        // karakterkód beállítása:
        mysqli_set_charset($db, "utf8");
        
        // Általános iskolák listázása:
        echo '<h2>Általános iskolák</h2>';
        $query = "SELECT * FROM altalanosiskolak";
        $result = mysqli_query($db, $query);
        if (mysqli_errno($db)) {
            echo mysqli_error($db);
        }
        // eredmény feldolgozása:
        echo '<table border="1">'; // !! border helyett css !!!
        echo '<tr><th>Az<th>Általános iskola<th>Cím';
        while ($row = mysqli_fetch_array($result)) {
            echo '<tr><td>'.$row[0];
            echo '<td>'.$row[1];
            echo '<td>'.$row[2];
        }
        echo '</table>';
        
        // Középiskolák:
        echo '<h2>Középiskolák</h2>'; // *
        $query = "SELECT * FROM kozepiskolak"; // *
        $result = mysqli_query($db, $query);
        if (mysqli_errno($db)) {
            echo mysqli_error($db);
        }
        // eredmény feldolgozása:
        echo '<table border="1">'; // !! border helyett css !!!
        echo '<tr><th>Az<th>Középiskola<th>Cím'; // *
        while ($row = mysqli_fetch_assoc($result)) { // *
            echo '<tr><td>'.$row['AZ']; // *
            echo '<td>'.$row['kozepiskola']; // *
            echo '<td>'.$row['cim']; // *
        }
        echo '</table>';
        
        // Tanulók listázása:
         echo '<h2>Tanulók</h2>'; // *
        $query = "SELECT tanulok.*,altalanosiskolak.altalanos "
                . "FROM tanulok JOIN altalanosiskolak "
                . "ON tanulok.altAZ=altalanosiskolak.AZ"; // *
        $result = mysqli_query($db, $query);
        if (mysqli_errno($db)) {
            echo mysqli_error($db);
        }
        // eredmény feldolgozása:
        echo '<table border="1">'; // !! border helyett css !!!
        echo '<tr><th>Az<th>Név<th>Általános iskola'; // *
        while ($row = mysqli_fetch_object($result)) { // *
            echo '<tr><td>'.$row->AZ; // *
            echo '<td>'.$row->nev; // *
            echo '<td>'.$row->altalanos; // *
        }
        echo '</table>';
        
        mysqli_close($db);
        ?>
    </body>
</html>
