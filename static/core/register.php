<?php

    session_start();
    require "../../constants.php";
    require_once "database_connection.php";

    $xml = @simplexml_load_file(DIR_ROOT . DIR_LANGUAGES . "/{$_SESSION["language"]}.xml")  or die(file_get_contents(DIR_ROOT . "/error404.html"));
    $errors = array();
    $nameSurname = trim($_POST["nameSurname"]);
    $password = trim($_POST["password"]);
    $email = trim($_POST["singidunumMail"]);

    //$nameSurname_pattern = "/^[\x{00A0}-\x{D7FF}\x{F900}-\x{FDCF}\x{FDF0}-\x{FFEF}A-z]{1,15}\s([\x{00A0}-\x{D7FF}\x{F900}-\x{FDCF}\x{FDF0}-\x{FFEF}A-z\-]{1,15}\s?){1,3}$/"; //PCRE sintax is valid, but php do not recognize
    $nameSurname_pattern = "/^[A-ZБВГДЂЕЖЗИЈКЛЉМНЊОПРСТЋУФСЦЧЏШŠĐČĆ]{1}[a-zабвгдђежзијклљмнњопрстћуфсцчџшšđčć]{1,14}\s([A-ZАБВГДЂЕЖЗИЈКЛЉМНЊОПРСТЋУФСЦЧЏШŠĐČĆ]{1}[a-zабвгдђежзијклљмнњопрстћуфсцчџшšđčć]{1,14}\s?){1,3}$/";
    //name (1-15 letters)_surname (1-15 letters) - unicode
    $password_pattern = "/^(?=.*[a-z])(?=.*\d)[a-z\d]{8,}$/";
    //lowercase and digit (length of min 8)

    if($_FILES["csv_newUsersList"]["error"] === 0){

        if ($_POST["captcha"] !== $_SESSION['captcha_text']) die("<i style='color:red;font-size:14px;'> - " . $xml->errors->invalid_captcha[0] . "</i><br><br>");

        $data_csv = array_map('str_getcsv', file($_FILES['csv_newUsersList']['tmp_name']));
        $invalid_csv_path = DIR_ROOT . DIR_MISCELLANEOUS . "/invalidCsvRows.rtf";

        if(file_exists($invalid_csv_path)) 
            unlink($invalid_csv_path); //izbrisati predhodni fajl ukoliko on postoji

        for($i = 0; $i < sizeof($data_csv); $i++){
            if(!preg_match_all($password_pattern, $data_csv[$i][1])
                  || !preg_match_all("/singidunum.ac.rs$/", $data_csv[$i][2])
                    || ($data_csv[$i][3] !== "professor" && $data_csv[$i][3] !== "assistant")
            ) file_put_contents($invalid_csv_path, $data_csv[$i][2] . " - " . $xml->errors->csvInvalidUser[0] . "<br>\n", FILE_APPEND | LOCK_EX);
            else {
                $url = "http://127.0.0.1:62812/api/insert/staff";
                
                $user_data = array("id" => random_int(20000, 40000), "name_surname" => $data_csv[$i][0], "email" => $conn,$data_csv[$i][2], "password_hash" => $data_csv[$i][1], "role" => $data_csv[$i][3]);

                $context = stream_context_create(array(
                    "http" => array(
                        "header" => "Authorization: Basic " . base64_encode("singiattend-admin:singiattend-server2021") . " Content-type: application/json",
                        "protocol_version" => 1.1,
                        'method' => 'POST',
                        'content' => json_encode($user_data)
                )));

                $response = json_decode(file_get_contents($url, false, $context));

                if($response["error"] != null){
                    file_put_contents($invalid_csv_path, $data_csv[$i][2] . " - " . $xml->errors->registrationError[0] . "<br>\n", FILE_APPEND | LOCK_EX);
                    continue;
                }

                $newUserHeader = $response["id"] . ':' . strtoupper($data_csv[$i][3]);

                $newUser = "
                    ------{$newUserHeader}------
                        {$data_csv[$i][0]}
                        {$data_csv[$i][2]}
                        {$data_csv[$i][1]}
                    ------{$newUserHeader}------
                ";

                file_put_contents(DIR_ROOT . DIR_MISCELLANEOUS . "/accounts.rtf", $newUser, FILE_APPEND | LOCK_EX);
            }
        }

        if(!file_exists($invalid_csv_path))
           echo "<i style='color:green;font-size:14px;'> + " . $xml->registrationPage->csvAllSuccessfull[0] . "</i><br><br>
           <script>setTimeout(function(){
                window.top.location.reload();
            }, 5000);</script>";
        else {
            echo "<i style='color:purple;font-size:14px;'> * " . $xml->errors->csvInvalidUsers[0] . "<br><br>";
            echo file_get_contents($invalid_csv_path);
            echo "</i>";
        }

        return;
    }
    else if(isset($_POST["csv_newUsersList"])) //print invalid csv error only if some file is selected
        echo "<i style='color:red;font-size:14px;'> - " . $xml->errors->csvInvalidError[0] . "</i><br><br>";

    if (!preg_match_all($nameSurname_pattern, $nameSurname)) $errors[] = "wrong_nS";

    if (!preg_match_all("/singidunum.ac.rs$/", $email)) $errors[] = "wrong_email";
    
    if (!preg_match_all($password_pattern, $password)) $errors[] = "wrong_pass";
    
    if ($password !== trim($_POST["passwordConfirm"]) || !isset($_POST["passwordConfirm"]) || $_POST["passwordConfirm"] === "") $errors[] = "missmatched_pass";
    
    if (!isset($_POST["registerAs"])) $errors[] = "notSelected_registerAs";
    
    if ($_POST["captcha"] !== $_SESSION['captcha_text']) $errors[] = "invalid_captcha";

    
    if(sizeof($errors) !== 0){
        foreach ($errors as $errorName){
            echo "<i style='color:red;font-size:14px;'> - " . $xml->errors->{$errorName}[0] . "</i><br><br>";
        }
    }
    else {
        $url = "http://127.0.0.1:62812/api/insert/staff";
                
        $user_data = array("id" => random_int(20000, 40000), "name_surname" => $nameSurname, "email" => $email, "password_hash" => $hashed_pass, "role" => $_POST['registerAs']);

        $context = stream_context_create(array(
            "http" => array(
                "header" => "Authorization: Basic " . base64_encode("singiattend-admin:singiattend-server2021") . " Content-type: application/json",
                "protocol_version" => 1.1,
                'method' => 'POST',
                'content' => json_encode($user_data)
        )));

        $response = json_decode(file_get_contents($url, false, $context));

        if($response["error"] != null) die($xml->errors->registrationError[0] . "<br>");
        else echo "<i style='color:green;font-size:14px;'> + {$xml->registrationPage->successfullRegistration[0]} $id. {$xml->registrationPage->pageReload[0]}</i><br><br>";

        $newUserHeader = $response["id"] . ':' . strtoupper($_POST['registerAs']);

        $newUser = "
            ------{$newUserHeader}------
                  {$nameSurname}
                   {$email}
                   {$password}
            ------{$newUserHeader}------
        ";

        file_put_contents(DIR_ROOT . DIR_MISCELLANEOUS . "/accounts.rtf", $newUser, FILE_APPEND | LOCK_EX);

        echo "<script>setTimeout(function(){
            window.top.location.reload();
         }, 5000);</script>";
    }
?>