<?php

//namespace Utility;

include_once "utils/mailer.php";

/**
 * Description of mailAgent
 *
 * @author Carmen Tacuri
 */
class mailAgent {
    
    private $mail;

    public function __construct()
    {
        
        $this->mail = new mailer();
        $this->mail->setFrom(SMTPFrom,'');
        
    }

    public function enviarMail($destinatarios,$asunto,$mensaje){
        
        
        
            //Agregamos a todos los destinatarios
            //foreach ($destinatarios as $correo => $nombre) {
            $this->mail->setTo($destinatarios,'');
            //}

            //Añadimos el asunto del mail
            $this->mail->setSubject($asunto); 

            //Mensaje del email
            $this->mail->setMessage($mensaje);

            //comprobamos si el mail se envio correctamente y devolvemos la respuesta al servidor
            if(!$this->mail->send()) {
                    return false;
            } else {
                    return true;
            } 
    }
    
    //($NombreCompleto,$Id_activacion,$Codigo_Usuario,$Codigo_persona,$Codigo_activacion,$Fecha_caducidad_activacion)
    function crearMailTemplateEjemplo($NombreCompleto,$Id_activacion,$Codigo_Usuario,$Codigo_persona,$Codido_pais,$Codigo_activacion,$Fecha_caducidad_activacion,$Tipo_perfil_usuario,$email,$clave){
        /*Enviamos Email*/
        $params = 'Id_activacion='. urlencode($Id_activacion).'&Codigo_Usuario='.urlencode($Codigo_Usuario).'&Codigo_persona='.urlencode($Codigo_persona).'&Codigo_pais='.urlencode($Codido_pais).'&Codigo_activacion='.urlencode($Codigo_activacion).'&Fecha_caducidad_activacion='.urlencode($Fecha_caducidad_activacion).'&Tipo_perfil_usuario='.urlencode($Tipo_perfil_usuario);
        $query_string_param = '?x='.base64UrlEncode($params);
        $urlActivacion          = URL_ACTIVATION.$query_string_param;
        $html                   = "<html>";
        $html                   = $html."<head>";
        $html                   = $html."<title>:TOKEN:</title>";
        $html                   = $html."<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">";
        $html                   = $html."<meta name=\"GENERATOR\" content=\"Quanta Plus KDE\">";
        $html                   = $html."<style type=\"text/css\">";
        $html                   = $html.".Imprime {";
        $html                   = $html." font-family:Courier New; font-size:14.4px; } @page{ margin: 0;}";
        $html                   = $html." hr {border: 1px dashed grey; height: 0; width: 100%;}";
        $html                   = $html."</style>";
        $html                   = $html."</head>";
        $html                   = $html."<body> ";
        $html                   = $html."<hr/>Bienvenid@: <strong>".$NombreCompleto."</strong> <br/>";
        $html                   = $html."Le enviamos el C&oacute;digo, para que active su Cuenta<br/>";
        $html                   = $html."C&oacute;digo de Activaci&oacute;n: <strong>".$Codigo_activacion."</strong><br/>";
        $html                   = $html."Fecha de Caducidad: <strong>".$Fecha_caducidad_activacion."</strong><br/>";
        $html                   = $html."Link de Activaci&oacute;n: ";
        $html                   = $html."<a href=\"".$urlActivacion."\">".$urlActivacion."</a>";
        $html 			= $html."<br/><br/>----------Excelencia M&eacute;dica----------<br/><br/>";
        $html 			= $html."<br/><br/>Una vez activada, la informaci&oacute;n de su cuenta ser&aacute; siguiente:<br/><br/>";
        $html 			= $html."<br/><br/><b>Usuario:</b>&nbsp;".htmlentities($email)."<br/><br/>";
        $html 			= $html."<br/><br/><b>Clave:</b>&nbsp;".htmlentities($clave)."<br/><br/>";
        $html                   = $html."</body>";
        $html                   = $html."</html>";
        return $html;
    }

    //($NombreCompleto,$Id_activacion,$Codigo_Usuario,$Codigo_persona,$Codigo_activacion,$Fecha_caducidad_activacion)
    function crearMailTemplateRegister($NombreCompleto,$Id_activacion,$Codigo_Usuario,$Codigo_persona,$Codido_pais,$Codigo_activacion,$Fecha_caducidad_activacion,$Tipo_perfil_usuario,$email,$clave){
        /*Enviamos Email*/
        $params = 'Id_activacion='. urlencode($Id_activacion).'&Codigo_Usuario='.urlencode($Codigo_Usuario).'&Codigo_persona='.urlencode($Codigo_persona).'&Codigo_pais='.urlencode($Codido_pais).'&Codigo_activacion='.urlencode($Codigo_activacion).'&Fecha_caducidad_activacion='.urlencode($Fecha_caducidad_activacion).'&Tipo_perfil_usuario='.urlencode($Tipo_perfil_usuario);
        $query_string_param = '?x='.base64UrlEncode($params);
        $urlActivacion          = URL_ACTIVATION.$query_string_param;
        
        $variables = array();

        $variables['CompleteName'] = htmlentities($NombreCompleto);
        $variables['ClaveActivacion'] = $Codigo_activacion;
        $variables['FechaCaducidad'] = $Fecha_caducidad_activacion;
        $variables['LinkActivacion'] = $urlActivacion;
        $variables['UserName'] = htmlentities($email);
        $variables['Password'] = htmlentities($clave);
        

        $template = file_get_contents(templateRegister,true); //archivo template

        foreach($variables as $key => $value)
        {
            $template = str_replace('{{ '.$key.' }}', $value, $template);
        }

       
        return $template;
    }
    
    //($NombreCompleto,$Id_activacion,$Codigo_Usuario,$Codigo_persona,$Codigo_activacion,$Fecha_caducidad_activacion)
    function crearMailTemplateTest($NombreCompleto,$Id_activacion,$Codigo_Usuario,$Codigo_persona,$Codido_pais,$Codigo_activacion,$Fecha_caducidad_activacion,$Tipo_perfil_usuario,$email,$clave){
        /*Enviamos Email*/
        $params = 'Id_activacion='. urlencode($Id_activacion).'&Codigo_Usuario='.urlencode($Codigo_Usuario).'&Codigo_persona='.urlencode($Codigo_persona).'&Codigo_pais='.urlencode($Codido_pais).'&Codigo_activacion='.urlencode($Codigo_activacion).'&Fecha_caducidad_activacion='.urlencode($Fecha_caducidad_activacion).'&Tipo_perfil_usuario='.urlencode($Tipo_perfil_usuario);
        $query_string_param = '?x='.base64UrlEncode($params);
        $urlActivacion          = URL_ACTIVATION.$query_string_param;
        
        $variables = array();

        $variables['CompleteName'] = $NombreCompleto;
        $variables['ClaveActivacion'] = $Codigo_activacion;
        $variables['FechaCaducidad'] = $Fecha_caducidad_activacion;
        $variables['LinkActivacion'] = $urlActivacion;
        $variables['UserName'] = htmlentities($email);
        $variables['Password'] = htmlentities($clave);
        

        $template = file_get_contents(PathTemplate.templateRegister); //archivo template

        foreach($variables as $key => $value)
        {
            $template = str_replace('{{ '.$key.' }}', $value, $template);
        }

       
        return $template;
    }
        
    function crearMailTemplateAprobacionMedico($NombreCompleto){
        /*Enviamos correo electronico*/
        $variables = array();

        $variables['NombreCompleto'] = htmlentities($NombreCompleto);      
       
        $template = file_get_contents(plantillaAprobacion,true); //archivo plantilla

        foreach($variables as $key => $value)
        {
            $template = str_replace('{{ '.$key.' }}', $value, $template);
        }

       
        return $template;
    }
    
    
    
    function crearMailTemplateRechazadoMedico($NombreCompleto){
        /*Enviamos correo electronico*/
        $variables = array();

        $variables['NombreCompleto'] = htmlentities($NombreCompleto);      
       
        $template = file_get_contents(plantillaRechazo,true); //archivo plantilla

        foreach($variables as $key => $value)
        {
            $template = str_replace('{{ '.$key.' }}', $value, $template);
        }

       
        return $template;
    }
        
    function crearMailTemplateActuacionCronologica($NombreCompleto, $Actuacion, $FechaCronologia,$Profesion,$Medico){
        /*Enviamos correo electronico*/
        $variables = array();

        $variables['NombreCompleto'] = htmlentities($NombreCompleto);      
        $variables['Actuacion'] = htmlentities($Actuacion);
        $variables['FechaCronologia'] = htmlentities($FechaCronologia);
        $variables['Profesion'] = htmlentities($Profesion);
        $variables['Medico'] = htmlentities($Medico);
        
        
        $template = file_get_contents(plantillaActuacionCronologica,true); //archivo plantilla

        foreach($variables as $key => $value)
        {
            $template = str_replace('{{ '.$key.' }}', $value, $template);
        }

       
        return $template;
    }
}

?>
