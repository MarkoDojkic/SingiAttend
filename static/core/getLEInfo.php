<?php

    session_start();
    require "../../constants.php";
    require_once "database_connection.php";

    $xml = @simplexml_load_file(DIR_ROOT . DIR_LANGUAGES . "/{$_SESSION["language"]}.xml")  or die(file_get_contents(DIR_ROOT . "/error404.html"));

    $table = $_SESSION['loggedInAs'] === 'professor' ? 'lecture' : 'exercise';
    $primaryKey = $table . '_id';

    if($table === 'lecture'){
        $url = "http://" . SERVER_URL . SERVER_PORT . "/api/getLecture/" . $_POST["$primaryKey"];
                
        $context = stream_context_create(array(
            "http" => array(
                "header" => "Authorization: Basic " . base64_encode(SERVER_USERNAME . ":" . SERVER_PASSWORD) . "\r\nContent-Type: application/json",
                "protocol_version" => 1.1,
                'method' => 'GET'
        )));

        $data = json_decode(file_get_contents($url, false, $context), true);
    } else {
        $url = "http://" . SERVER_URL . SERVER_PORT . "/api/getExercise/" . $_POST["$primaryKey"];
                
        $context = stream_context_create(array(
            "http" => array(
                "header" => "Authorization: Basic " . base64_encode(SERVER_USERNAME . ":" . SERVER_PASSWORD) . "\r\nContent-Type: application/json",
                "protocol_version" => 1.1,
                'method' => 'GET'
        )));

        $data = json_decode(file_get_contents($url, false, $context), true);
    }

    $dateLocale = $_SESSION["language"] === "english" ? "Y-m-d " : "d.m.Y ";
    $date = date($dateLocale, strtotime($data['started_at']));
    $attendance = $xml->{$_SESSION['loggedInAs'] . "Page"}->notOverYet[0];

    if(date_diff((new DateTime("",new DateTimeZone("UTC")))->add(new DateInterval('PT1H')), new DateTime($data["ended_at"],new DateTimeZone("UTC")))->invert === 1) {//time in past => lecture/exercise finished (DATA IN MONGO DB IS +0000, SO 1H IS ADDED TO CURRENT TO PARSE CORRECTLY)

        $url = "http://" . SERVER_URL . SERVER_PORT . "/api/totalStudents/" . $data['subject_id'];
            
        $context = stream_context_create(array(
            "http" => array(
                "header" => "Authorization: Basic " . base64_encode(SERVER_USERNAME . ":" . SERVER_PASSWORD) . "\r\nContent-Type: application/json",
                "protocol_version" => 1.1,
                'method' => 'GET'
        )));

        $totalStudents = json_decode(file_get_contents($url, false, $context));

        $percetage = round( sizeof($data['attended_students']) /$totalStudents *100);
        
        $attendance = $percetage . "% (" . sizeof($data['attended_students']) . "/" . $totalStudents . ")";
    }

    $startTime = explode('T', $data["started_at"])[0] . ". " . explode("+",explode('T', $data["started_at"])[1])[0];
    $endTime = explode('T', $data["ended_at"])[0] . ". " . explode("+",explode('T', $data["ended_at"])[1])[0];

    echo "<table class='table table-bordered table-inverse table-responsive' style='font-size: 13px;'>
            <tbody>
                <tr>
                    <td style='text-align: right;'>{$xml->assistantPage->startTime[0]}</td>
                    <td style='text-align: left;'>{$startTime}</td>
                </tr>
                <tr>
                    <td style='text-align: right;'>{$xml->assistantPage->endTime[0]}</td>
                    <td style='text-align: left;'>{$endTime}</td>
                </tr>
                <tr>
                    <td style='text-align: right;'>{$xml->assistantPage->attendance[0]}</td>
                    <td style='text-align: left;'>{$attendance}</td>
                </tr>
            </tbody>
        </table>";
?>