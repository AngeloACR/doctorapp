<?php

/*
 * Licencia de uso libre para el MSP - Derechos de autor: Msc. Carmen Tacuri

 */
include_once "utils/generalFunc.php";
include_once "utils/simpleRest.php";
include_once "utils/requestRestHandler.php";
include_once "utils/encript.php";
include_once "utils/tokenSec.php";
include_once "model/loginDB.php";

/**
 * Description of loginControl
 *
 * @author Carmen Tacuri
 */
class loginControl {
    //put your code here
    
    #Metodos publicos
    public function encriptarPassword() {  
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
        
        if (isset($datosPeticion['password'])) {  
            //el constructor del padre ya se encarga de sanear los datos de entrada  
            $clave = $datosPeticion['password']; 
            $clave_encriptada = encrypt(API_ENCRIPT_KEY,$datosPeticion['password']);  
            
            $datosRespuesta["clave_ecnriptada"]=$clave_encriptada;
            
            $token = "";
            $responseEncrypt["error"] = "false";
            $responseEncrypt["status"] = "OK";
            $responseEncrypt["message"] = "SUCCESS";
            $responseEncrypt['fecha'] = ObtenerFecha(); //Obtiene la fecha actual
            //Aqui se implementa el manejo del token
            $responseEncrypt["respuesta"] = json_encode($datosRespuesta);
                                  
            //enviar respuesta
            return $responseEncrypt;
                    
            //}
            
        }else{
            $responseEncrypt["error"] = "true";
            $responseEncrypt["status"] = "error";
            $responseEncrypt["message"] = "Falta datos clave";
            $responseEncrypt['fecha'] = "";
            $responseEncrypt["respuesta"] = "{}";
            //$responseLogin["respuesta"] = $json;
            return $responseEncrypt;
        }
    }
    
    public function autenticarUsuario() {  
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
        
        if (isset($datosPeticion['userName'], $datosPeticion['password'])) {  
            //el constructor del padre ya se encarga de sanear los datos de entrada  
            $username = $datosPeticion['userName']; 
            $clave = decrypt(API_ENCRIPT_KEY,$datosPeticion['password']);  
            
            if (!empty($username) and !empty($clave)) {  
                //if (filter_var($username, FILTER_VALIDATE_EMAIL)) {  
                    $loginDB = new LoginDB();    
                    //$this->mostrarRespuesta($this->convertirJson($respuesta), 200);  
                    $responseUsuario = $loginDB->getAutenticacionUsuario($username, $clave);
                    
                    //echo $responseUsuario;
                    $datosRespuesta = (array)$handler->decodeJson($responseUsuario);
                    
                    if (!isset($datosRespuesta["error"])){
                        //$respuesta['usuario'] = $username;
                        $token = new tokenSec();
                        $responseInicioSesion["error"] = "false";
                        $responseInicioSesion["status"] = "OK";
                        $responseInicioSesion["message"] = "SUCCESS";
                        $responseInicioSesion['fecha'] = ObtenerFecha(); //Obtiene la fecha actual
                        //Aqui se implementa el manejo del token
                        $responseInicioSesion['token'] = $token->generateToken($datosRespuesta['id_Usuario'], $datosRespuesta['Login_usuario']);
                        $responseInicioSesion["respuesta"] = $datosRespuesta;
                        
                    }
                    else {
                        //Hay posiblidades: 1 - usuario no existe  2 - clave invalida
                        $responseInicioSesion["error"] = "true";
                        $responseInicioSesion["status"] = "error";
                        $responseInicioSesion["message"] = $datosRespuesta['error'];
                        $responseInicioSesion['fecha'] = "";
                        $responseInicioSesion['token'] = "";
                        $responseInicioSesion["respuesta"] = "{}";
                    }
            
                    $loginDB = null;
                    //enviar respuesta
                    return $responseInicioSesion;
                    
                //}
            }else{
                $responseLogin["error"] = "true";
                $responseLogin["status"] = "error";
                $responseLogin["message"] = "Falta datos usuario";
                $responseLogin['fecha'] = "";
                $responseLogin['token'] = "";
                $responseLogin["respuesta"] = "{}";
                //$responseLogin["respuesta"] = $json;
                return $responseLogin;
            }  
        }else{
            $responseLogin["error"] = "true";
            $responseLogin["status"] = "error";
            $responseLogin["message"] = "Falta datos usuario";
            $responseLogin['fecha'] = "";
            $responseLogin['token'] = "";
            $responseLogin["respuesta"] = "{}";
            //$responseLogin["respuesta"] = $json;
            return $responseLogin;
        }
    }
    
}
?>