<?php
    session_start();
    require "../../constants.php";
    require_once "database_connection.php";

    $temp = $_SESSION["loggedInAs"] == "professor" ? "assistant"  : "professor";

    $xml = @simplexml_load_file(DIR_ROOT . DIR_LANGUAGES . "/{$_SESSION["language"]}.xml")  or die(file_get_contents(DIR_ROOT . "/error404.html"));

    $url = "http://127.0.0.1:62812/api/getSubject/" . $_POST['subject_id'];
                
    $context = stream_context_create(array(
        "http" => array(
            "header" => "Authorization: Basic " . base64_encode("singiattend-admin:singiattend-server2021") . "\r\nContent-Type: application/json",
            "protocol_version" => 1.1,
            'method' => 'GET'
    )));

    $data = json_decode(file_get_contents($url, false, $context), true);

    $nS = empty($data[$temp]) ? "" : $data[$temp][0]["name_surname"];
    
    echo "
        {$xml->professorPage->subject_name[0]}: <br><br> {$data["title"]}/<br>{$data["title_english"]} <br><br>
        {$xml->registrationPage->{$temp}[0]}: <br><br> {$nS} <br><br>
    ";

?>