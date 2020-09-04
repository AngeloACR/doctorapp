<?php

/*
 * Licencia de uso libre para el MSP - Derechos de autor: Msc. Carmen Tacuri

 */
include_once "utils/simpleRest.php";
include_once "utils/requestRestHandler.php";
include_once "model/usuariosDB.php";
/**
 * Description of centroSaludControl
 *
 * @author Carmen Tacuri
 */
class usuariosControl {
    //put your code here
    
    //Funcion para listar neonatos
    public function obtenerListaUsuarios() {  
               
        //Array para alamcenar loa datos de entrada
        $datosPeticion = array();
        //objeto que maneja los requerimientos/peticiones
        $request = new simpleRest();
        //obtiene los datos de la peticion

        $usuarios = new usuariosDB();    
        $responseLista = $usuarios->obtenerListaUsuarios();

        $handler = new requestRestHandler();
        
        //echo $responseLista;
        $datosRespuesta = (array)$handler->decodeJson($responseLista);

        if (!isset($datosRespuesta["error"])){
            //$respuesta['usuario'] = $username;
            $datosRespuesta['token'] = "";

            $responseListado["error"] = "false";
            $responseListado["status"] = "OK";
            $responseListado["message"] = "SUCCESS";
            $responseListado["respuesta"] = $responseLista;
        }
        else {
            //Hay posiblidades: 1 - usuario no existe  2 - clave invalida
            $datosRespuesta['token'] = "";
            $responseListado["error"] = "true";
            $responseListado["status"] = "error";
            $responseListado["message"] = $datosRespuesta['error'];
            $responseListado["respuesta"] = "{}";
        }

        $usuarios = null;
        //enviar respuesta
        return $responseListado;
        
    }
    
    public function grabarUsuario() {  
        
        try {
        
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



            if (isset($datosPeticion['Cedula'])) {  

                $Cedula = $datosPeticion['Cedula'];  

                if (!empty($Cedula) ) {  
                        $Sexo = $datosPeticion['Sexo'];
                        $Username = $datosPeticion['Username'];
                        $Nombres = $datosPeticion['Nombres'];
                        $Apellidos = $datosPeticion['Apellidos'];
                        $Email = $datosPeticion['Email'];
                        $Cargo = $datosPeticion['Cargo'];
                        $Clave = $datosPeticion['Clave'];
                        $Admin = $datosPeticion['Admin'];
                        $Estado = $datosPeticion['Estado'];
                        //$Estado = 1; //1- activo pot defecto


                        $userDB = new usuariosDB();                        
                        $responseGrabaUsuario = $userDB->grabarUsuario($Cedula,$Sexo,$Username,$Nombres,$Apellidos,$Email,$Cargo,$Clave,$Admin,$Estado);                    
                        $datosRespuesta = (array)$handler->decodeJson($responseGrabaUsuario);



                        if (!isset($datosRespuesta["error"])){

                            $datosRespuesta['token'] = "";

                            $responseListado["error"] = "false";
                            $responseListado["status"] = "OK";
                            $responseListado["message"] = "SUCCESS";
                            $responseListado["respuesta"] = $responseGrabaUsuario;
                        }
                        else {

                            $datosRespuesta['token'] = "";
                            $responseListado["error"] = "true";
                            $responseListado["status"] = "error";
                            $responseListado["message"] = $datosRespuesta['error'];
                            $responseListado["respuesta"] = "{}";
                        }
                    return $responseListado;    
                }
            }
        } catch(Exception $e) {
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    }
    
    public function borrarUsuario() {  
        
        try {
        
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



            if (isset($datosPeticion['Cedula'])) {  

                $Cedula = $datosPeticion['Cedula'];  

                if (!empty($Cedula) ) {  
                        $Id = $datosPeticion['Id'];
                        $Usuario = $datosPeticion['Usuario'];
                        //$Estado = $datosPeticion['Estado'];
                        //$Estado = 0; //0- inactivo pot defecto


                        $usuarioDB = new usuariosDB();                        
                        $responseBorrarUser = $usuarioDB->borrarUsuario($Cedula,$Id,$Usuario);                    
                        $datosRespuesta = (array)$handler->decodeJson($responseBorrarUser);

                        if (!isset($datosRespuesta["error"])){

                            $datosRespuesta['token'] = "";

                            $responseListado["error"] = "false";
                            $responseListado["status"] = "OK";
                            $responseListado["message"] = "SUCCESS";
                            $responseListado["respuesta"] = $responseBorrarUser;
                        }
                        else {

                            $datosRespuesta['token'] = "";
                            $responseListado["error"] = "true";
                            $responseListado["status"] = "error";
                            $responseListado["message"] = $datosRespuesta['error'];
                            $responseListado["respuesta"] = "{}";
                        }
                    return $responseListado;    
                }
            }
        } catch(Exception $e) {
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    }
    
}
