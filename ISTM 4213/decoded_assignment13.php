<?php

$curl = curl_init();

curl_setopt_array($curl, [
	CURLOPT_URL => "https://weatherapi-com.p.rapidapi.com/current.json?q=53.1%2C-0.13",
	CURLOPT_RETURNTRANSFER => true,
	CURLOPT_ENCODING => "",
	CURLOPT_MAXREDIRS => 10,
	CURLOPT_TIMEOUT => 30,
	CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
	CURLOPT_CUSTOMREQUEST => "GET",
	CURLOPT_HTTPHEADER => [
		"X-RapidAPI-Host: weatherapi-com.p.rapidapi.com",
		"X-RapidAPI-Key: a11ac19853msh66c8862c216fc85p1885dcjsn8a3c32c967b1"
	],
]);

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);
if ($err) {
	echo "cURL Error #:" . $err;
} else {
	$myArray = json_decode($response, true);
	echo '<tr>';
	echo '<td>'. $myArray[0]["Year"].'<br>'.'</td>';
	echo '<td>'. $myArray[1]["Title"].'<br>'.'</td>';
	echo '</tr>';
};

?>