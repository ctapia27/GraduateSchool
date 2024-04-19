<?php
//Created by Carla Tapia
//Date: 12/05/2023
 ?>

<!DOCTYPE html>
<html lang=en>
<head>
    <title>Crypto data</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.blue_grey-orange.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
      <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
          <span class="mdl-layout-title">Web Service Processing (JSON Server-Side)</span>
        </div>
      </header>

      <main class="mdl-layout__content">
        <div class="page-content">
            <div class="mdl-grid">

              <table class="mdl-data-table mdl-js-data-table  mdl-shadow--2dp">
                <thead>
                  <tr>
                    <td colspan="3" style="text-align:center">Products</td>
                  </tr>
                  <tr>
                    <th style="text-align:center">Title </th>
                    <th style="text-align:center">Description </th>
                    <th style="text-align:center">Price </th>
                  </tr>
                </thead>
              <tbody>


              <?php
              // Initializing curl
              $curl = curl_init();

              // Sending GET request to reqres.in
              // server to get JSON data
              curl_setopt($curl, CURLOPT_URL,
              	"https://dummyjson.com/products");

              // Telling curl to store JSON
              // data in a variable instead
              // of dumping on screen
              curl_setopt($curl,CURLOPT_RETURNTRANSFER, true);

              // Executing curl
              $data = curl_exec($curl);
              //to get output for question #6 I comment out line 51
              //echo $data;

              // Checking if any error occurs
              // during request or not
              if($e = curl_error($curl)) {
              	echo $e;
              } else {

              	// Decoding JSON data
              	$myArray =
              		json_decode($data, true);

              	// Outputing JSON data in decoded form

                // echo $data below to complete question #5 then gray it out
                //echo $data;
                print_r($myArray);
                echo	'<tr>';
                echo	'<td style="text-align:center">'.$myArray['products'][0]['title'].'</br>'.'</td>';
                echo	'<td style="text-align:center">'.$myArray['products'][0]['description'].'</br>'.'</td>';
                echo	'<td style="text-align:center">'.$myArray['products'][0]['price'].'</br>'.'</td>';
                echo '</tr>';
              }

              // Closing curl
              curl_close($curl);
             ?>

           </tbody>


         </table>
            </div>
        </div>
      </main>
    </div>
</body>
</html>
