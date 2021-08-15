<?php
    session_start();
    require "../../constants.php";
    $_SESSION["isAdminLoggedOut"] = true; //for admin login
    $_SESSION["loggedInAs"] = null;
    $_SESSION["loggedInId"] = null;
    header("Location: /index.php", true, 307);
?>