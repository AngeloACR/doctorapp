<?php

/*
 * Licencia de uso libre para el MSP - Derechos de autor: Msc. Carmen Tacuri

 */
include_once "utils/generalFunc.php";
include_once "utils/simpleRest.php";
include_once "utils/requestRestHandler.php";
include_once "utils/encript.php";
include_once "utils/tokenSec.php";

/**
 * Description of loginControl
 *
 * @author Carmen Tacuri
 */
class mailControl {
    //put your code here
    
       
    public function mailTestRegister() {  
        
        try{
            
            //Array para alamcenar loa datos de entrada
            $datosPeticion = array();
            //objeto que maneja los requerimientos/peticiones
            $request = new simpleRest();
            //obtiene los datos de la peticion
            $json = $request->getHttpRequestBody();
            //objeto que maneja las codificaciones/descodificaciones
            $handler = new requestRestHandler();
            //descodifica el foramtoJSON y lo pasa a array
            $datosPeticion = (array)$handler->decodeJson($json);

            if (isset($datosPeticion['cedula'])) {

                    $Cedula = $datosPeticion['cedula'];  
                    if (!empty($Cedula)) { 
                        //Captura todos los campos para persona
                        $Cedula = $datosPeticion['cedula'];
                        $Nombres = $datosPeticion['nombres'];
                        $Apellidos = $datosPeticion['apellidos'];
                        $FechaNac = $datosPeticion['fechaNac'];
                        $Sexo = $datosPeticion['sexo'];
                        $Codido_pais = $datosPeticion['Codigo_pais'];
                        $Codido_tipo_identif = $datosPeticion['Codigo_tipo_identificacion'];
                        $Codido_profesion = $datosPeticion['Codigo_profesion'];
                        $Correo = $datosPeticion['correo'];
                        $Skype = $datosPeticion['skype'];
                        $Celular = $datosPeticion['celular'];
                        $Clave = decrypt(API_ENCRIPT_KEY,$datosPeticion['clave']);
                        $RepetirClave = decrypt(API_ENCRIPT_KEY,$datosPeticion['repetirclave']);
                        $Tipo_perfil = $datosPeticion['tipo_perfil'];
                        $tokens = new tokenSec();
                        //Aqui empieza el proceso de resgitro/activacion de cuenta
                        $ActivacionData = $tokens->generarCodigoActivacion();
                        if (!isset($ActivacionData["error"])){
                            $Codigo_activacion = $ActivacionData["Codigo_activacion"];
                            $Fecha_caducidad_activacion = $ActivacionData["Fecha_caducidad_activacion"];

                            //Aqui se genera el proceso de activaciones para test
                                /*Enviamos Email*/
                                $agenteMail = new mailAgent();
                                $NombreCompleto = $Nombres.' '.$Apellidos;

                                $Id_activacion = "9999999999";
                                $Codigo_Usuario = "9999999999";
                                $Codigo_persona = "9999999999";


                                $para                   = $Correo;
                                $titulo                 = "Excelencia Medica - Activar Cuenta";
                                $html                   =$agenteMail->crearMailTemplateRegister($NombreCompleto,$Id_activacion,$Codigo_Usuario,$Codigo_persona,$Codido_pais,$Codigo_activacion,$Fecha_caducidad_activacion,$Tipo_perfil,$para,$Clave);
                                $StatusMail             =$agenteMail->enviarMail($para,$titulo,$html);
                                
                                $responseMailTest["error"] = "false";
                                $responseMailTest["status"] = "OK";
                                $responseMailTest["message"] = "SUCCESS";
                                $responseMailTest['fecha'] = ObtenerFecha();
                                $responseMailTest["respuesta"] = "{\"mail\":\"".$StatusMail."\"}";
                                
                                return $responseMailTest;
                                
                        }
                        else{
                            $responseMailTest["error"] = "true";
                            $responseMailTest["status"] = "error";
                            $responseMailTest["message"] = $ActivacionData["error"];
                            $responseMailTest['fecha'] = "";
                            $responseMailTest["respuesta"] = "{}";
                            return $responseMailTest;
                        }
                    }else{
                            $responseMailTest["error"] = "true";
                            $responseMailTest["status"] = "error";
                            $responseMailTest["message"] = "Falta datos - cédula";
                            $responseMailTest['fecha'] = "";
                            $responseMailTest["respuesta"] = "{}";
                            return $responseMailTest;
                    }
            }else{
                    $responseMailTest["error"] = "true";
                    $responseMailTest["status"] = "error";
                    $responseMailTest["message"] = "Falta datos - cédula";
                    $responseMailTest['fecha'] = "";
                    $responseMailTest['token'] = "";
                    $responseMailTest["respuesta"] = "{}";
                    return $responseMailTest;
                }
        }
        catch(Exception $e){
            $responseMailTest["error"] = "true";
            $responseMailTest["status"] = "error";
            $responseMailTest["message"] = $e->getMessage();
            $responseMailTest['fecha'] = "";
            $responseMailTest['token'] = "";
            $responseMailTest["respuesta"] = "{}";
            return $responseMailTest;
        }
            
    }
    
    
    public function mailTestAprobation() {  
        
        try{
            
            //Array para alamcenar loa datos de entrada
            $datosPeticion = array();
            //objeto que maneja los requerimientos/peticiones
            $request = new simpleRest();
            //obtiene los datos de la peticion
            $json = $request->getHttpRequestBody();
            //objeto que maneja las codificaciones/descodificaciones
            $handler = new requestRestHandler();
            //descodifica el foramtoJSON y lo pasa a array
            $datosPeticion = (array)$handler->decodeJson($json);

            if (isset($datosPeticion['Nombres'])) {
                
                $Nombres = $datosPeticion['Nombres'];
                
                if (!empty($Nombres)) { 
                
                    if (isset($datosPeticion['correo'])) {
                        //Captura todos los campos para persona
                        $Correo = $datosPeticion['correo'];
                        if (!empty($Correo)) {
                            //Aqui se genera el proceso de activaciones para test
                                /*Enviamos Email*/
                                $agenteMail = new mailAgent();
                                $NombreCompleto = $Nombres;

                                $para                   = $Correo;
                                $titulo                 = "Excelencia Medica - Aprobacion de uso de plataforma";
                                $html                   =$agenteMail->crearMailTemplateAprobacionMedico($NombreCompleto);
                                $StatusMail             =$agenteMail->enviarMail($para,$titulo,$html);
                                
                                $responseMailTest["error"] = "false";
                                $responseMailTest["status"] = "OK";
                                $responseMailTest["message"] = "SUCCESS";
                                $responseMailTest['fecha'] = ObtenerFecha();
                                $responseMailTest["respuesta"] = "{\"mail\":\"".$StatusMail."\"}";
                                
                                return $responseMailTest;
                        }
                        else{
                            $responseMailTest["error"] = "true";
                            $responseMailTest["status"] = "error";
                            $responseMailTest["message"] = "Falta datos - correo";
                            $responseMailTest['fecha'] = "";
                            $responseMailTest["respuesta"] = "{}";
                            return $responseMailTest;
                        }
                    }else{
                        $responseMailTest["error"] = "true";
                        $responseMailTest["status"] = "error";
                        $responseMailTest["message"] = "Falta datos - correo";
                        $responseMailTest['fecha'] = "";
                        $responseMailTest["respuesta"] = "{}";
                        return $responseMailTest;
                    }
                }else{
                    $responseMailTest["error"] = "true";
                    $responseMailTest["status"] = "error";
                    $responseMailTest["message"] = "Falta datos - Nombres y Apellidos";
                    $responseMailTest['fecha'] = "";
                    $responseMailTest["respuesta"] = "{}";
                    return $responseMailTest;
                }    
            }else{
                $responseMailTest["error"] = "true";
                $responseMailTest["status"] = "error";
                $responseMailTest["message"] = "Falta datos - Nombres y Apellidos";
                $responseMailTest['fecha'] = "";
                $responseMailTest["respuesta"] = "{}";
                return $responseMailTest;
            }
            
        }
        catch(Exception $e){
            $responseMailTest["error"] = "true";
            $responseMailTest["status"] = "error";
            $responseMailTest["message"] = $e->getMessage();
            $responseMailTest['fecha'] = "";
            $responseMailTest['token'] = "";
            $responseMailTest["respuesta"] = "{}";
            return $responseMailTest;
        }
            
    }
    
    
    public function mailTestRechazo() {  
        
        try{
            
            //Array para alamcenar loa datos de entrada
            $datosPeticion = array();
            //objeto que maneja los requerimientos/peticiones
            $request = new simpleRest();
            //obtiene los datos de la peticion
            $json = $request->getHttpRequestBody();
            //objeto que maneja las codificaciones/descodificaciones
            $handler = new requestRestHandler();
            //descodifica el foramtoJSON y lo pasa a array
            $datosPeticion = (array)$handler->decodeJson($json);

            if (isset($datosPeticion['Nombres'])) {
                
                $Nombres = $datosPeticion['Nombres'];
                
                if (!empty($Nombres)) { 
                
                    if (isset($datosPeticion['correo'])) {
                        //Captura todos los campos para persona
                        $Correo = $datosPeticion['correo'];
                        if (!empty($Correo)) {
                            //Aqui se genera el proceso de activaciones para test
                                /*Enviamos Email*/
                                $agenteMail = new mailAgent();
                                $NombreCompleto = $Nombres;

                                $para                   = $Correo;
                                $titulo                 = "Excelencia Medica - NO Aprobacion uso de plataforma";
                                $html                   =$agenteMail->crearMailTemplateRechazadoMedico($NombreCompleto);
                                $StatusMail             =$agenteMail->enviarMail($para,$titulo,$html);
                                
                                $responseMailTest["error"] = "false";
                                $responseMailTest["status"] = "OK";
                                $responseMailTest["message"] = "SUCCESS";
                                $responseMailTest['fecha'] = ObtenerFecha();
                                $responseMailTest["respuesta"] = "{\"mail\":\"".$StatusMail."\"}";
                                
                                return $responseMailTest;
                        }
                        else{
                            $responseMailTest["error"] = "true";
                            $responseMailTest["status"] = "error";
                            $responseMailTest["message"] = "Falta datos - correo";
                            $responseMailTest['fecha'] = "";
                            $responseMailTest["respuesta"] = "{}";
                            return $responseMailTest;
                        }
                    }else{
                        $responseMailTest["error"] = "true";
                        $responseMailTest["status"] = "error";
                        $responseMailTest["message"] = "Falta datos - correo";
                        $responseMailTest['fecha'] = "";
                        $responseMailTest["respuesta"] = "{}";
                        return $responseMailTest;
                    }
                }else{
                    $responseMailTest["error"] = "true";
                    $responseMailTest["status"] = "error";
                    $responseMailTest["message"] = "Falta datos - Nombres y Apellidos";
                    $responseMailTest['fecha'] = "";
                    $responseMailTest["respuesta"] = "{}";
                    return $responseMailTest;
                }    
            }else{
                $responseMailTest["error"] = "true";
                $responseMailTest["status"] = "error";
                $responseMailTest["message"] = "Falta datos - Nombres y Apellidos";
                $responseMailTest['fecha'] = "";
                $responseMailTest["respuesta"] = "{}";
                return $responseMailTest;
            }
            
        }
        catch(Exception $e){
            $responseMailTest["error"] = "true";
            $responseMailTest["status"] = "error";
            $responseMailTest["message"] = $e->getMessage();
            $responseMailTest['fecha'] = "";
            $responseMailTest['token'] = "";
            $responseMailTest["respuesta"] = "{}";
            return $responseMailTest;
        }
            
    }
    
    public function mailTestActuacion() {  
        
        try{
            
            //Array para alamcenar loa datos de entrada
            $datosPeticion = array();
            //objeto que maneja los requerimientos/peticiones
            $request = new simpleRest();
            //obtiene los datos de la peticion
            $json = $request->getHttpRequestBody();
            //objeto que maneja las codificaciones/descodificaciones
            $handler = new requestRestHandler();
            //descodifica el foramtoJSON y lo pasa a array
            $datosPeticion = (array)$handler->decodeJson($json);

            if (isset($datosPeticion['Nombres'])) {
                
                $Nombres = $datosPeticion['Nombres'];
                
                if (!empty($Nombres)) { 
                
                    if (isset($datosPeticion['correo'])) {
                        //Captura todos los campos para persona
                        $Correo = $datosPeticion['correo'];
                        if (!empty($Correo)) {
                            //Aqui se genera el proceso de activaciones para test
                                /*Enviamos Email*/
                                $agenteMail = new mailAgent();
                                $NombreCompleto = $Nombres;
                                $Actuacion = $datosPeticion['Actuacion'];
                                $FechaCronologia = $datosPeticion['FechaCronologia'];
                                $Profesion = $datosPeticion['Profesion'];
                                $Medico = $datosPeticion['Medico'];

                                $para                   = $Correo;
                                $titulo                 = "Recomendaciones para la Actuacion, dadas por Excelencia Medica ";
                                $html                   =$agenteMail->crearMailTemplateActuacionCronologica($NombreCompleto, $Actuacion, $FechaCronologia, $Profesion, $Medico);
                                $StatusMail             =$agenteMail->enviarMail($para,$titulo,$html);
                                
                                $responseMailTest["error"] = "false";
                                $responseMailTest["status"] = "OK";
                                $responseMailTest["message"] = "SUCCESS";
                                $responseMailTest['fecha'] = ObtenerFecha();
                                $responseMailTest["respuesta"] = "{\"mail\":\"".$StatusMail."\"}";
                                
                                return $responseMailTest;
                        }
                        else{
                            $responseMailTest["error"] = "true";
                            $responseMailTest["status"] = "error";
                            $responseMailTest["message"] = "Falta datos - correo";
                            $responseMailTest['fecha'] = "";
                            $responseMailTest["respuesta"] = "{}";
                            return $responseMailTest;
                        }
                    }else{
                        $responseMailTest["error"] = "true";
                        $responseMailTest["status"] = "error";
                        $responseMailTest["message"] = "Falta datos - correo";
                        $responseMailTest['fecha'] = "";
                        $responseMailTest["respuesta"] = "{}";
                        return $responseMailTest;
                    }
                }else{
                    $responseMailTest["error"] = "true";
                    $responseMailTest["status"] = "error";
                    $responseMailTest["message"] = "Falta datos - Nombres y Apellidos";
                    $responseMailTest['fecha'] = "";
                    $responseMailTest["respuesta"] = "{}";
                    return $responseMailTest;
                }    
            }else{
                $responseMailTest["error"] = "true";
                $responseMailTest["status"] = "error";
                $responseMailTest["message"] = "Falta datos - Nombres y Apellidos";
                $responseMailTest['fecha'] = "";
                $responseMailTest["respuesta"] = "{}";
                return $responseMailTest;
            }
            
        }
        catch(Exception $e){
            $responseMailTest["error"] = "true";
            $responseMailTest["status"] = "error";
            $responseMailTest["message"] = $e->getMessage();
            $responseMailTest['fecha'] = "";
            $responseMailTest['token'] = "";
            $responseMailTest["respuesta"] = "{}";
            return $responseMailTest;
        }
            
    }
    
    
    
}
?>