<?php
    session_start();
    require "../../constants.php";
    require_once "database_connection.php";

    $temp = $_SESSION["loggedInAs"] == "professor" ? "assistant"  : "professor";

    $xml = @simplexml_load_file(DIR_ROOT . DIR_LANGUAGES . "/{$_SESSION["language"]}.xml")  or die(file_get_contents(DIR_ROOT . "/error404.html"));

    $server_request = curl_init("https://" . SERVER_URL . SERVER_PORT . "/api/getSubject/" . $_POST['subject_id']);
                
    curl_setopt($server_request, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($server_request, CURLOPT_CUSTOMREQUEST, "GET");
    curl_setopt($server_request, CURLOPT_POSTFIELDS, $subjectData);
    curl_setopt($server_request, CURLOPT_HTTPHEADER, array(
        "Authorization: Basic " . base64_encode(SERVER_USERNAME . ":" . SERVER_PASSWORD),
        "Content-Type: application/json",
        "X-Tenant-ID: " . $_SESSION["proxyIdentifier"]
    ));
    curl_setopt($server_request, CURLOPT_CAINFO, SSL_CERTIFICATE_PATH);

    $data = json_decode(curl_exec($server_request), true);
    
    curl_close($server_request);

    $nS = empty($data[$temp]) ? "" : $data[$temp][0]["name_surname"];
    
    echo "
        {$xml->professorPage->subject_name[0]}: <br><br> {$data["title"]}/<br>{$data["title_english"]} <br><br>
        {$xml->registrationPage->{$temp}[0]}: <br><br> {$nS} <br><br>
    ";

?>