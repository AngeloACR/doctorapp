<?php

/* 
 * Licencia de uso libre para el MSP - Derechos de autor: Msc. Carmen Tacuri

 */


    function ObtenerFecha(){
        $sql = "SELECT DATE_FORMAT(CURDATE(), '%Y-%m-%d') AS FechaActual;";
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);
            $row = $stmt->fetch();
                        
            //echo $stmt->queryString;
            //echo $row['existe'];
            
            if(!($row['FechaActual']==null)){ //Evalúas $data directamente
                $dbCon = null;
                return $row['FechaActual'];
            } else {
                $dbCon = null;
                return "";
            }
        } catch(PDOException $e) {
            return "";
        }
    }

    function base64UrlEncode($text)
    {
        return str_replace(
            ['+', '/', '='],
            ['-', '_', ''],
            base64_encode($text)
        );
    }
    
    function is_base64_encoded($data)
    {
        if (preg_match('%^[a-zA-Z0-9/+]*={0,2}$%', $data)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    
    function base64UrlDecode($text)
    {
        return str_replace(
            ['-', '_', ''],
            ['+', '/', '='],
            base64_decode($text)
        );
    }
    
?>
