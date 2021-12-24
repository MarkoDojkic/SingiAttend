<?php
    session_start();
    require "../../constants.php";

    $xml = @simplexml_load_file(DIR_ROOT . DIR_LANGUAGES . "/{$_SESSION["language"]}.xml")  or die(file_get_contents(DIR_ROOT . "/error404.html"));
    
    foreach(array_keys($_POST) as $key){
       
        switch(explode('_',$key)[0]){
            case "switchRole": switchRole(explode('_',$key)[1],$xml); break;
            case 'edit': editStaffMember(explode('_',$key)[1],$xml); break;
            case 'delete': deleteStaffMember(explode('_',$key)[1],$xml); break;
            default: continue 2;
        }
    }

    function switchRole($id,$xml){
        $newRole = $_POST["oldRole_$id"] === "professor" ? "assistant" : "professor";

        $url = "http://127.0.0.1:62812/api/checkIfStaffHasSubjectAssigned/" . $id . "/" . ($_POST["oldRole_$id"] === "professor" ? "0" : "1");
                
        $context = stream_context_create(array(
            "http" => array(
                "header" => "Authorization: Basic " . base64_encode("singiattend-admin:singiattend-server2021") . "\r\nContent-Type: application/json",
                "protocol_version" => 1.1,
                'method' => 'GET'
        )));

        $data = json_decode(file_get_contents($url, false, $context), true);

        if(!$data){
            $staffMember = $newRole === "professor" ? $xml->registrationPage->assistant[0] : $xml->registrationPage->professor[0];
            showErrorAlert($xml->errors->switchRoleError1[0] . " " . strtolower($staffMember) . " " . $xml->errors->switchRoleError2[0]);
        }
        else {
            $url = "http://127.0.0.1:62812/api/update/staff/" . $id;
                
            $context = stream_context_create(array(
                "http" => array(
                    "header" => "Authorization: Basic " . base64_encode("singiattend-admin:singiattend-server2021") . "\r\nContent-Type: application/json",
                    "protocol_version" => 1.1,
                    'method' => 'PATCH',
                    'content' => json_encode(array("role"=>$newRole))
            )));

            $response = file_get_contents($url, false, $context);
            if(json_decode($response)->{"error"} != null) showErrorAlert($xml->errors->switchRoleError0[0]);
        }

        reloadPage();
    }

    function editStaffMember($id,$xml){

        $nameSurname_pattern = "/^([\x{0410}-\x{0418}\x{0402}\x{0408}\x{041A}-\x{041F}\x{0409}\x{040A}\x{0420}-\x{0428}\x{040B}\x{040F}A-Z\x{0110}\x{017D}\x{0106}\x{010C}\x{0160}]{1}[\x{0430}-\x{0438}\x{0452}\x{043A}-\x{043F}\x{045A}\x{0459}\x{0440}-\x{0448}\x{0458}\x{045B}\x{045F}a-z\x{0111}\x{017E}\x{0107}\x{010D}\x{0161}]+(\s|\-)?)+$/u";
        $password_pattern = "/^(?=.*[a-z])(?=.*\d)[a-z\d]{8,}$/";

        if($_POST["newNS_$id"] !== null && preg_match_all($nameSurname_pattern, $_POST["newNS_$id"])){
            $url = "http://127.0.0.1:62812/api/update/staff/" . $id;
                
            $context = stream_context_create(array(
                "http" => array(
                    "header" => "Authorization: Basic " . base64_encode("singiattend-admin:singiattend-server2021") . "\r\nContent-Type: application/json",
                    "protocol_version" => 1.1,
                    'method' => 'PATCH',
                    'content' => json_encode(array("name_surname"=>$_POST["newNS_$id"]))
            )));
            
            $response = file_get_contents($url, false, $context);
            if(json_decode($response)->{"error"} != null) showErrorAlert($xml->errors->wrong_nS[0]);
        }

        if($_POST["newUE_$id"] !== null){
            $url = "http://127.0.0.1:62812/api/update/staff/" . $id;
                
            $context = stream_context_create(array(
                "http" => array(
                    "header" => "Authorization: Basic " . base64_encode("singiattend-admin:singiattend-server2021") . "\r\nContent-Type: application/json",
                    "protocol_version" => 1.1,
                    'method' => 'PATCH',
                    'content' => json_encode(array("email"=>$_POST["newUE_$id"]))
            )));

            $response = file_get_contents($url, false, $context);
            if(json_decode($response)->{"error"} != null) showErrorAlert($xml->errors->wrong_email[0]);
        }

        if($_POST["newPASS_$id"] !== null && preg_match_all($password_pattern, $_POST["newPASS_$id"])){
            $url = "http://127.0.0.1:62812/api/update/staff/" . $id;
                
            $context = stream_context_create(array(
                "http" => array(
                    "header" => "Authorization: Basic " . base64_encode("singiattend-admin:singiattend-server2021") . "\r\nContent-Type: application/json",
                    "protocol_version" => 1.1,
                    'method' => 'PATCH',
                    'content' => json_encode(array("password_hash"=>$_POST["newPASS_$id"]))
            )));

            $response = file_get_contents($url, false, $context);
            if(json_decode($response)->{"error"} != null) showErrorAlert($xml->errors->wrong_pass[0]);
        }

        reloadPage();   
    }

    function deleteStaffMember($id,$xml){

        $url = "http://127.0.0.1:62812/api/deleteStaff/" . $id . "/" . ($_POST["oldRole_$id"] === "professor" ? "0" : "1");
                
        $context = stream_context_create(array(
            "http" => array(
                "header" => "Authorization: Basic " . base64_encode("singiattend-admin:singiattend-server2021") . "\r\nContent-Type: application/json",
                "protocol_version" => 1.1,
                'method' => 'DELETE'
        )));

        file_get_contents($url, false, $context);
        reloadPage();
    }

    function reloadPage(){
        echo "<script>setTimeout(function(){
            window.top.location.reload();
        }, 1);</script>";
    }

    function showErrorAlert($message){
        echo "<script>alert('$message');</script>";
        reloadPage();
    }
?>