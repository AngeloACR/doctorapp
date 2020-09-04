<?php

    // Lógica de autoarranque

    require_once "api/DoctoAPI.php";    
    $DoctoAPI = new DoctoAPI();
    $DoctoAPI->api();

?>