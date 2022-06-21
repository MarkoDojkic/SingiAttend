<?php
    session_start();
    require "../../constants.php";

    $xml = @simplexml_load_file(DIR_ROOT . DIR_LANGUAGES . "/{$_SESSION["language"]}.xml")  or die(file_get_contents(DIR_ROOT . "/error404.html"));

    $errors = array();
    $subject_name = trim($_POST["subject_name"]);
    $assistant = $_POST['assistant_selection']; //ili je prazno ili je id asistenta
    $studies = array();
    $years = array();

    if (!@strpos($subject_name, "/", 1) || strpos($subject_name, "/") === 1) $errors[] = "wrong_sN"; 
    
    if (@$_POST['studies'] === null) $errors[] = "did_not_selected_any_study";

    if(sizeof($errors) !== 0){
        foreach ($errors as $errorName){
            echo "<i style='color:red;font-size:14px;'> - " . $xml->errors->{$errorName}[0] . "</i><br><br>";
        }
    }
    else {

        $enrolled_students = array();

        foreach($_POST['studies'] as $study_id){ //format studyID_takingYear (non taking selection is null)
            $url = "http://" . SERVER_URL . SERVER_PORT . "/api/getAllStudents/" . explode("_",$study_id)[0] . "/" . explode("_",$study_id)[1];
                        
            $context = stream_context_create(array(
                "http" => array(
                    "header" => "Authorization: Basic " . base64_encode(SERVER_USERNAME . ":" . SERVER_PASSWORD) . "\r\nContent-Type: application/json",
                    "protocol_version" => 1.1,
                    'method' => 'GET'
            )));

            $data = json_decode(file_get_contents($url, false, $context), true);
            
            foreach($data as $student){
                array_push($enrolled_students, $student['id']);
            }
        }

        $checkingTitle_temp = explode("/",$subject_name)[0];

        $url = "http://" . SERVER_URL . SERVER_PORT . "/api/addNewSubject";

        $subjectData = json_encode(array(
            "title" => explode("/",$subject_name)[0],
            "title_english" => explode("/",$subject_name)[1],
            "professorId" => $_SESSION['loggedInId'],
            "assistantId" => $assistant,
            "enroled_students" => $enrolled_students,
            "isInactive" => false,
        ));
                
        $context = stream_context_create(array(
            "http" => array(
                "header" => "Authorization: Basic " . base64_encode(SERVER_USERNAME . ":" . SERVER_PASSWORD) . "\r\nContent-Type: application/json",
                "protocol_version" => 1.1,
                'method' => 'POST',
                'content' => $subjectData
        )));

        $response = @file_get_contents($url, false, $context, true);
        
        if(!$response)
            echo "<i style='color:red;font-size:14px;'> - {$xml->professorPage->addSubjectFailed[0]}</i><br><br>";
        else {
            echo "<i style='color:green;font-size:14px;'> + {$xml->professorPage->addSubjectSuccessfull[0]}</i><br><br>";

            echo "<script>setTimeout(function(){
                window.top.location.reload();
            }, 5000);</script>";
        }
    }
?>