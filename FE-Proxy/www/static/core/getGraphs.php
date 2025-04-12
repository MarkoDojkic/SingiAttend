<?php

    session_start();
    require "../../constants.php";

    $xml = @simplexml_load_file(DIR_ROOT . DIR_LANGUAGES . "/{$_SESSION["language"]}.xml")  or die(file_get_contents(DIR_ROOT . "/error404.html"));
    $attended = "";
    $notAttended = "";
    $attendancesData = "";
    $datesData = "[";

    $server_request = curl_init("https://" . SERVER_URL . SERVER_PORT . "/api/totalStudents/" . $_POST["subjectSelection"]);
                
    curl_setopt($server_request, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($server_request, CURLOPT_CUSTOMREQUEST, "GET");
    curl_setopt($server_request, CURLOPT_HTTPHEADER, array(
        "Authorization: Basic " . base64_encode(SERVER_USERNAME . ":" . SERVER_PASSWORD),
        "Content-Type: application/json",
        "X-Tenant-ID: " . $_POST["proxyIdentifier"]
    ));
    curl_setopt($server_request, CURLOPT_CAINFO, SSL_CERTIFICATE_PATH);

    $totalStudents = curl_exec($server_request);

    curl_close($server_request);

    $attendedTotalLectures = 0;
    $totalStudentsAllLectures = 0;

    $suffix = strcmp($_SESSION["loggedInAs"], "professor") === 0 ? "Lectures" : "Exercises";
    
    $server_request = curl_init("https://" . SERVER_URL . SERVER_PORT . "/api/getAll" . $suffix . "/" . $_POST["subjectSelection"]);

    curl_setopt($server_request, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($server_request, CURLOPT_CUSTOMREQUEST, "GET");
    curl_setopt($server_request, CURLOPT_HTTPHEADER, array(
        "Authorization: Basic " . base64_encode(SERVER_USERNAME . ":" . SERVER_PASSWORD),
        "Content-Type: application/json",
        "X-Tenant-ID: " . $_SESSION["proxyIdentifier"]
    ));
    curl_setopt($server_request, CURLOPT_CAINFO, SSL_CERTIFICATE_PATH);

    $lectures = json_decode(curl_exec($server_request), true);

    curl_close($server_request);

    if(!is_array($lectures) || sizeof($lectures) == 0) die("<i style='color:red;font-size:28px;'>" . $xml->errors->graphNotGenerated[0] . "</i>");
    
    foreach($lectures as $lecture){
        $attended .= "\"" . sizeof($lecture["attended_students"]) . "\",";
        $notAttended .= "\"" . ($totalStudents - sizeof($lecture["attended_students"])) . "\",";
        $datesData .= "\"" . explode("T", $lecture['started_at'])[0] .  "\",";
        $attendedTotalLectures += sizeof($lecture["attended_students"]);
        $totalStudentsAllLectures += $totalStudents;
    }

    $attended = substr($attended,0,strlen($attended)-1); //remove last ,
    $notAttended = substr($notAttended,0,strlen($notAttended)-1);

    $attendancesData = "[{
        label: '{$xml->professorPage->attended[0]}',
        backgroundColor: '#33FF3F',
        data: [$attended]
    },{
        label: '{$xml->professorPage->notAttended[0]}',
        backgroundColor: '#FF3333',
        data: [$notAttended]
    }]";

    $datesData .= "]";
    
    if($_POST["graphValue"] === "barGraph"){
        echo "
                <script src='https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js'></script>
                <canvas id='myChart' style='position: relative; height:80vh; width:82vw;'></canvas>
                <script>
                var ctx = document.getElementById('myChart').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: {$datesData},
                        datasets: {$attendancesData}
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        },
                        title: {
                            display: true,
                            text: '{$xml->{$_SESSION["loggedInAs"] . "Page"}->barChartTitle[0]}'
                        }
                    }
                });
                </script>
            ";
    }
    else if($_POST["graphValue"] === "pieGraph"){
        $attendedTotalExercieses = 0;
        $totalStudentsAllExercieses = 0;

        $server_request = curl_init("https://" . SERVER_URL . SERVER_PORT . "/api/getAllExercises/" . $_POST["subjectSelection"]);
                
        curl_setopt($server_request, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($server_request, CURLOPT_CUSTOMREQUEST, "GET");
        curl_setopt($server_request, CURLOPT_HTTPHEADER, array(
            "Authorization: Basic " . base64_encode(SERVER_USERNAME . ":" . SERVER_PASSWORD),
            "Content-Type: application/json",
            "X-Tenant-ID: " . $_SESSION["proxyIdentifier"]
        ));
        curl_setopt($server_request, CURLOPT_CAINFO, SSL_CERTIFICATE_PATH);

        $exercises = json_decode(curl_exec($server_request), true);

        curl_close($server_request);

        if(!is_array($exercises) || $exercises.length == 0) die("<i style='color:red;font-size:28px;'>" . $xml->errors->graphNotGenerated[0] . "</i>");

        foreach($exercises as $exercise){
            $attended .= "\"" . sizeof($exercise["attended_students"]) . "\",";
            $notAttended .= "\"" . ($totalStudents - sizeof($exercise["attended_students"])) . "\",";
            $datesData .= "\"" . explode("T", $exercise['started_at'])[0] .  "\",";
            $attendedTotalExercieses += sizeof($exercise["attended_students"]);
            $totalStudentsAllExercieses += $totalStudents;
        }

        $percentageAL = round($attendedTotalLectures/$totalStudentsAllLectures*100);
        $percentageNAL = 100-$percentageAL;
        $percentageAE = round($attendedTotalExercieses/$totalStudentsAllExercieses*100);
        $percentageNAE = 100-$percentageAE;

        $label1 = $xml->professorPage->attended[0] . " " . strtolower($xml->professorPage->lecturesBtn[0]);
        $label2 = $xml->professorPage->notAttended[0] . " " . strtolower($xml->professorPage->lecturesBtn[0]);
        $label3 = $xml->professorPage->attended[0] . " " . strtolower($xml->assistantPage->exercisesBtn[0]);
        $label4 = $xml->professorPage->notAttended[0] . " " . strtolower($xml->assistantPage->exercisesBtn[0]);

        echo "
                <script src='https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js'></script>
                <canvas id='myChart' style='position: relative; height:81vh; width:164vw;'></canvas>
                <canvas id='myChart2' style='position: relative; height:80vh; width:164vw;'></canvas>
                <script>
                var ctx = document.getElementById('myChart').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: ['$label1','$label2'],
                        datasets: [
                            {backgroundColor: ['#33FF3F','#FF3333'], data : [$percentageAL,$percentageNAL] }
                        ]
                    },
                    options: {
                        title: {
                            display: true,
                            text: '{$xml->professorPage->pieChartTitle[0]}'
                        }
                    }
                });
                var ctx = document.getElementById('myChart2').getContext('2d');
                var myChart2 = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: ['$label3','$label4'],
                        datasets: [
                            {backgroundColor: ['#99ffa0','#ff8080'], data : [$percentageAE,$percentageNAE] }
                        ]
                    },
                    options: {
                        title: {
                            display: true,
                            text: '{$xml->assistantPage->pieChartTitle[0]}'
                        }
                    }
                });
                </script>
            ";
    }

?>