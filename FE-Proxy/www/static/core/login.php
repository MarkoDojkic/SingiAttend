<?php
    session_start();
    require "../../constants.php";

    $xml = @simplexml_load_file(DIR_ROOT . DIR_LANGUAGES . "/{$_SESSION["language"]}.xml")  or die(file_get_contents(DIR_ROOT . "/error404.html"));

    $errors = array();
    $id = trim($_POST["id"]);
    $password = trim($_POST["password"]);

    $password_pattern = "/^[a-z]+[0-9]+$/";
    
    if (!preg_match($password_pattern, $password)) $errors[] = "wrong_pass";
    
    if ($_POST["captcha"] !== $_SESSION['captcha_text']) $errors[] = "invalid_captcha";

    if(sizeof($errors) !== 0){
        foreach ($errors as $errorName){
            echo "<i style='color:red;font-size:14px;'> - " . $xml->errors->{$errorName}[0] . "</i><br><br>";
        }
    }
    else {
        if($password === null) $errors[] = "userNotFound";
        else {
            $server_request = curl_init("https://" . SERVER_URL . SERVER_PORT . "/api/checkPassword/staff/" . $id);

            curl_setopt($server_request, CURLOPT_RETURNTRANSFER, true);  // To return the response as a string
            curl_setopt($server_request, CURLOPT_CUSTOMREQUEST, "POST");  // Set request type to POST
            curl_setopt($server_request, CURLOPT_POSTFIELDS, $password);  // Send password in POST body
            curl_setopt($server_request, CURLOPT_HTTPHEADER, array(
                "Authorization: Basic " . base64_encode(SERVER_USERNAME . ":" . SERVER_PASSWORD),
                "Content-Type: application/json",
                "X-Tenant-ID: " . $_POST["proxyIdentifier"]
            ));  // Set headers
            curl_setopt($server_request, CURLOPT_CAINFO, SSL_CERTIFICATE_PATH);

            $response = curl_exec($server_request);

            if(curl_errno($server_request)) {
                echo 'cURL Error: ' . curl_error($server_request);
            } else {
                if (strcmp($response, "INVALID") == 0) {
                    $errors[] = "wrong_pass";
                } else {
                    $nameSurname = explode(':', $response)[0];
                    $loginAs = explode(':', $response)[1];
                }
            }

            curl_close($server_request);
        }

        if(sizeof($errors) !== 0){
            foreach ($errors as $errorName){
                echo "<i style='color:red;font-size:14px;'> - " . $xml->errors->{$errorName}[0] . "</i><br><br>";
            }
        }
        else {
            $protocol = !empty($_SERVER['HTTPS']) ? 'https':'http';
            $_SESSION['loggedInUser'] = $nameSurname;
            $_SESSION['loggedInAs'] = $loginAs;
            $_SESSION['loggedInId'] = $id;
            $_SESSION['proxyIdentifier'] = $_POST["proxyIdentifier"];
            $page_redirect = strcmp($loginAs, "assistant") === 0 ? "teaching_exercises" : "teaching_subject_management";
            echo "<script>window.top.location.href = '/index.php?language={$_SESSION['language']}&page={$page_redirect}';</script>";
        }
    }
?>