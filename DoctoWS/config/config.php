<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// Creación de constantes.

    // Generales

    //define('BASE_URL', 'localhost');
    //define('APPLICATION_PATH', realpath(dirname(__FILE__)) . '/../');


    //referencia generado con MD5(uniqid(&lt;some_string&gt;, true))
    define('API_KEY','3d524a53c110e4c22463b10ed32cef9d');
    
    define('API_KEY_PASSWORD', 'akMnfXR45MkoaWbZoPiu3');
    define('API_IV_PASSWORD', 'ZXhjZWxlbmNpYW1lZGljYQ==');
    
    define('API_TIMELIFE', 6000); //10 minutos = 600 segundos
    
    define('API_ENCRIPT_KEY', 'akMnfXR45MkoaWbZoPiu3'); //PARA ENCRIPTAR DATOS
    
    //define los parametros para activacion
    define('API_ACTIVATION_KEY','ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890');
    
    define('API_ACTIVATION_TIMELIFE', 604800); //1 mes = 604800 segundos
    
    // Conexión a la base de datos con mysqlclient

    //define('DB_NAME', 'Exmed');
    //define('DB_USER', 'carmentacuri');
    //define('DB_PASSWORD', 'CarmenJTV1974'); // ¡No olvide cambiar la contraseña en el servidor de trabajo!
    //define('DB_SERVER', '192.168.1.200');
    //define('DB_PORT','3306');
    
    define('API_DATA_ENCRYPTION_INPUT', False); //manejo de la data encrytada de solicitudes
    define('API_DATA_ENCRYPTION_OUTPUT', False); //manejo de la data encrytada de respuestas
    
    // Conexión a la base de datos con pdo //excelencia medica exmed
    //define('host','rickvel-laptop');
    define('host','localhost');
    define('username','root');
    define('password','');
    define('db','docto');
    define('port','3309');
    
    //Templates para correos
    define('ABSPATH', dirname(dirname(__FILE__)) . '\\' );
    define('PathTemplate','.\\templates\\');
    define('templateRegister','templateRegistro.html');
    define('plantillaAprobacion','templateAprobacion.html');
    define('plantillaRechazo','templateRechazo.html');
    define('plantillaActuacionCronologica','templateActuacionCronologica.html');
    
    
    
    
    //define los parametros para activacion
    define('URL_ACTIVATION','http://localhost:8080/exmedWeb/ActivationServlet');
    
    //Conexion a servidor de correo
    define('SMTPServer','smtp.hostinger.com');
    define('SMTPAuth',true);
    define('SMTPUsername','notificaciones@excelenciamedica.live');
    define('SMPTPassword','iteK2385_wordpress');
    define('SMTPSecure','ssl');
    define('SMTPPort',587);
    define('SMTPFrom','notificaciones@excelenciamedica.live');
    //define('SMTPFrom','avisos@excelenciamed.com');
    define('SMTPFromName','Excelencia Medica');
    define('SMTPisHTML',true);
    define('SMTPCharSet','UTF-8');
    
    
    
    
?>
