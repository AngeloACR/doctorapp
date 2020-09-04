<?php

/*
 * Licencia de uso libre para el MSP - Derechos de autor: Msc. Carmen Tacuri

 */
include_once "utils/generalFunc.php";
include_once "utils/simpleRest.php";
include_once "utils/requestRestHandler.php";
include_once "model/consultasDB.php";

/**
 * Description of loginControl
 *
 * @author Carmen Tacuri
 */
class consultasControl {
    //put your code here
    
    #Metodos privados
    public function obtenerListaPaises() {  

        //objeto que maneja los requerimientos/peticiones
        $request = new simpleRest();
        //obtiene los datos de la peticion
        //$json = $request->getHttpRequestBody();
        //objeto que maneja las codificaciones/descodificaciones
        $handler = new requestRestHandler();
        
        //if (filter_var($username, FILTER_VALIDATE_EMAIL)) {  
            $consulDB = new consultasDB();    
            //$this->mostrarRespuesta($this->convertirJson($respuesta), 200);  
            $responsePaises = $consulDB->obtenerListaPaises();

            //echo $responseUsuario;
            //$datosRespuesta = (array)$handler->decodeJson($responsePaises);
            $datosRespuesta = $responsePaises;
            //$datosRespuesta = $handler->decodeJson($responsePaises);

            if (!isset($datosRespuesta["error"])){
                //$respuesta['usuario'] = $username;
                $responseObtenerPaises["error"] = "false";
                $responseObtenerPaises["status"] = "OK";
                $responseObtenerPaises["message"] = "SUCCESS";
                $responseObtenerPaises['fecha'] = ObtenerFecha(); //Obtiene la fecha actual
                //Aqui se implementa el manejo del token
                $responseObtenerPaises["respuesta"] = $datosRespuesta;

            }
            else {
                //Hay posiblidades: 1 - usuario no existe  2 - clave invalida
                $responseObtenerPaises["error"] = "true";
                $responseObtenerPaises["status"] = "error";
                $responseObtenerPaises["message"] = $datosRespuesta['error'];
                $responseObtenerPaises['fecha'] = "";
                $responseObtenerPaises["respuesta"] = "{}";
            }

            $consulDB = null;
            //enviar respuesta
            return $responseObtenerPaises;

        //}
            
    }
    
    
    public function obtenerListaProvincias() {  

            $consulDB = new consultasDB();    
            
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
        
        if (isset($datosPeticion['Codigo_pais'])) {
            
            $Codigo_pais = $datosPeticion['Codigo_pais'];  
            if (!empty($Codigo_pais)) { 

                $responseProvincias = $consulDB->obtenerListaProvicias($Codigo_pais);
                $datosRespuesta = $responseProvincias;
                
                if (!isset($datosRespuesta["error"])){
                     $responseObtenerProvincias["error"] = "false";
                     $responseObtenerProvincias["status"] = "OK";
                     $responseObtenerProvincias["message"] = "SUCCESS";
                     $responseObtenerProvincias['fecha'] = ObtenerFecha();                 
                     $responseObtenerProvincias["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseObtenerProvincias["error"] = "true";
                     $responseObtenerProvincias["status"] = "error";
                     $responseObtenerProvincias["message"] = $datosRespuesta['error'];
                     $responseObtenerProvincias['fecha'] = "";
                     $responseObtenerProvincias["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseObtenerProvincias;
            }else{
                $responseObtenerProvincias["error"] = "true";
                $responseObtenerProvincias["status"] = "error";
                $responseObtenerProvincias["message"] = "Falta datos pais";
                $responseObtenerProvincias['fecha'] = "";
                $responseObtenerProvincias["respuesta"] = "{}";
                return $responseObtenerProvincias;
            }  
        }else{
            $responseObtenerProvincias["error"] = "true";
            $responseObtenerProvincias["status"] = "error";
            $responseObtenerProvincias["message"] = "Falta datos pais";
            $responseObtenerProvincias['fecha'] = "";
            $responseObtenerProvincias['token'] = "";
            $responseObtenerProvincias["respuesta"] = "{}";
            return $responseObtenerProvincias;
        }
                
                
        
            
    }
    
    public function obtenerListaCantones() {  

            $consulDB = new consultasDB();    
            
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
        
        if (isset($datosPeticion['Codigo_pais'])) {
            
            $Codigo_pais = $datosPeticion['Codigo_pais'];  
            $Codigo_provincia = $datosPeticion['Codigo_provincia'];
            if (!empty($Codigo_pais) && !empty($Codigo_provincia)){ 

                $responseCantones = $consulDB->obtenerListaCantones($Codigo_pais, $Codigo_provincia);
                $datosRespuesta = $responseCantones;
                if (!isset($datosRespuesta["error"])){
                     $responseObtenerCantones["error"] = "false";
                     $responseObtenerCantones["status"] = "OK";
                     $responseObtenerCantones["message"] = "SUCCESS";
                     $responseObtenerCantones['fecha'] = ObtenerFecha();                 
                     $responseObtenerCantones["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseObtenerCantones["error"] = "true";
                     $responseObtenerCantones["status"] = "error";
                     $responseObtenerCantones["message"] = $datosRespuesta['error'];
                     $responseObtenerCantones['fecha'] = "";
                     $responseObtenerCantones["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseObtenerCantones;
            }else{
                $responseObtenerCantones["error"] = "true";
                $responseObtenerCantones["status"] = "error";
                $responseObtenerCantones["message"] = "Falta datos pais";
                $responseObtenerCantones['fecha'] = "";
                $responseObtenerCantones["respuesta"] = "{}";
                return $responseObtenerCantones;
            }  
        }else{
            $responseObtenerCantones["error"] = "true";
            $responseObtenerCantones["status"] = "error";
            $responseObtenerCantones["message"] = "Falta datos pais";
            $responseObtenerCantones['fecha'] = "";
            $responseObtenerCantones['token'] = "";
            $responseObtenerCantones["respuesta"] = "{}";
            return $responseObtenerCantones;
        }
    }
    
    
    public function obtenerListaParroquias() {  

            $consulDB = new consultasDB();    
            
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
        
        if (isset($datosPeticion['Codigo_pais'])) {
            
            $Codigo_pais = $datosPeticion['Codigo_pais'];  
            $Codigo_provincia = $datosPeticion['Codigo_provincia'];
            $Codigo_canton= $datosPeticion['Codigo_canton'];
            
            if (!empty($Codigo_pais) && !empty($Codigo_provincia)&& !empty($Codigo_canton)){ 

                $responseParroquias = $consulDB->obtenerListaParroquias($Codigo_pais, $Codigo_provincia, $Codigo_canton);
                $datosRespuesta = $responseParroquias;
                if (!isset($datosRespuesta["error"])){
                     $responseListaParroquias["error"] = "false";
                     $responseListaParroquias["status"] = "OK";
                     $responseListaParroquias["message"] = "SUCCESS";
                     $responseListaParroquias['fecha'] = ObtenerFecha();                 
                     $responseListaParroquias["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseListaParroquias["error"] = "true";
                     $responseListaParroquias["status"] = "error";
                     $responseListaParroquias["message"] = $datosRespuesta['error'];
                     $responseListaParroquias['fecha'] = "";
                     $responseListaParroquias["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseListaParroquias;
            }else{
                $responseListaParroquias["error"] = "true";
                $responseListaParroquias["status"] = "error";
                $responseListaParroquias["message"] = "Falta datos pais";
                $responseListaParroquias['fecha'] = "";
                $responseListaParroquias["respuesta"] = "{}";
                return $responseListaParroquias;
            }  
        }else{
            $responseListaParroquias["error"] = "true";
            $responseListaParroquias["status"] = "error";
            $responseListaParroquias["message"] = "Falta datos pais";
            $responseListaParroquias['fecha'] = "";
            $responseListaParroquias['token'] = "";
            $responseListaParroquias["respuesta"] = "{}";
            return $responseListaParroquias;
        }
    }
    
    
    public function obtenerListaUnidades() {  

            $consulDB = new consultasDB();    
            
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
        
        if (isset($datosPeticion['Codigo_pais'])) {
            
            $Codigo_pais = $datosPeticion['Codigo_pais'];  
            $Codigo_provincia = $datosPeticion['Codigo_provincia'];
            $Codigo_canton = $datosPeticion['Codigo_canton'];
            $Codigo_parroquia = $datosPeticion['Codigo_parroquia'];
            
            if (!empty($Codigo_pais) && !empty($Codigo_provincia) && !empty($Codigo_canton)){ 

                $responseUnidades = $consulDB->obtenerListaUnidades($Codigo_pais, $Codigo_provincia, $Codigo_canton, $Codigo_parroquia);
                $datosRespuesta = $responseUnidades;
                if (!isset($datosRespuesta["error"])){
                     $responseListaUnidades["error"] = "false";
                     $responseListaUnidades["status"] = "OK";
                     $responseListaUnidades["message"] = "SUCCESS";
                     $responseListaUnidades['fecha'] = ObtenerFecha();                 
                     $responseListaUnidades["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseListaUnidades["error"] = "true";
                     $responseListaUnidades["status"] = "error";
                     $responseListaUnidades["message"] = $datosRespuesta['error'];
                     $responseListaUnidades['fecha'] = "";
                     $responseListaUnidades["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseListaUnidades;
            }else{
                $responseListaUnidades["error"] = "true";
                $responseListaUnidades["status"] = "error";
                $responseListaUnidades["message"] = "Falta datos pais, provincia y/o canton";
                $responseListaUnidades['fecha'] = "";
                $responseListaUnidades["respuesta"] = "{}";
                return $responseListaUnidades;
            }  
        }else{
            $responseListaUnidades["error"] = "true";
            $responseListaUnidades["status"] = "error";
            $responseListaUnidades["message"] = "Falta datos pais";
            $responseListaUnidades['fecha'] = "";
            $responseListaUnidades['token'] = "";
            $responseListaUnidades["respuesta"] = "{}";
            return $responseListaUnidades;
        }
    }
    
    #Metodos privados
    public function obtenerListaProfesiones() {  

        //objeto que maneja los requerimientos/peticiones
        $request = new simpleRest();
        //obtiene los datos de la peticion
        //$json = $request->getHttpRequestBody();
        //objeto que maneja las codificaciones/descodificaciones
        $handler = new requestRestHandler();
        
        //if (filter_var($username, FILTER_VALIDATE_EMAIL)) {  
            $consulDB = new consultasDB();    
            //$this->mostrarRespuesta($this->convertirJson($respuesta), 200);  
            $responseProfesiones = $consulDB->obtenerListaProfesiones();

            //echo $responseUsuario;
            //$datosRespuesta = (array)$handler->decodeJson($responsePaises);
            $datosRespuesta = $responseProfesiones;
            //$datosRespuesta = $handler->decodeJson($responsePaises);

            if (!isset($datosRespuesta["error"])){
                //$respuesta['usuario'] = $username;
                $responseObtenerProfesiones["error"] = "false";
                $responseObtenerProfesiones["status"] = "OK";
                $responseObtenerProfesiones["message"] = "SUCCESS";
                $responseObtenerProfesiones['fecha'] = ObtenerFecha(); //Obtiene la fecha actual
                //Aqui se implementa el manejo del token
                $responseObtenerProfesiones["respuesta"] = $datosRespuesta;

            }
            else {
                //Hay posiblidades: 1 - usuario no existe  2 - clave invalida
                $responseObtenerProfesiones["error"] = "true";
                $responseObtenerProfesiones["status"] = "error";
                $responseObtenerProfesiones["message"] = $datosRespuesta['error'];
                $responseObtenerProfesiones['fecha'] = "";
                $responseObtenerProfesiones["respuesta"] = "{}";
            }

            $consulDB = null;
            //enviar respuesta
            return $responseObtenerProfesiones;

        //}
            
    }
    
    public function obtenerCedulaHC() {  

            $consulDB = new consultasDB();    
            
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
                        
            if (!empty($Cedula) ){ 

                $responseCedulaHC = $consulDB->obtenerCedulaHC($Cedula);
                $datosRespuesta = $responseCedulaHC;
                if (!isset($datosRespuesta["error"])){
                     $responseListaCedulasHC["error"] = "false";
                     $responseListaCedulasHC["status"] = "OK";
                     $responseListaCedulasHC["message"] = "SUCCESS";
                     $responseListaCedulasHC['fecha'] = ObtenerFecha();                 
                     $responseListaCedulasHC["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseListaCedulasHC["error"] = "true";
                     $responseListaCedulasHC["status"] = "error";
                     $responseListaCedulasHC["message"] = $datosRespuesta['error'];
                     $responseListaCedulasHC['fecha'] = "";
                     $responseListaCedulasHC["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseListaCedulasHC;
            }else{
                $responseListaCedulasHC["error"] = "true";
                $responseListaCedulasHC["status"] = "error";
                $responseListaCedulasHC["message"] = "Falta cedula";
                $responseListaCedulasHC['fecha'] = "";
                $responseListaCedulasHC["respuesta"] = "{}";
                return $responseListaCedulasHC;
            }  
        }else{
            $responseListaCedulasHC["error"] = "true";
            $responseListaCedulasHC["status"] = "error";
            $responseListaCedulasHC["message"] = "Falta datos cedula";
            $responseListaCedulasHC['fecha'] = "";
            $responseListaCedulasHC['token'] = "";
            $responseListaCedulasHC["respuesta"] = "{}";
            return $responseListaCedulasHC;
        }
    }
    
    
    public function insertarCedulaHC() {  

            $consulDB = new consultasDB();    
            
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
            $Persona = $datosPeticion['Persona'];  
            $CentroSalud = $datosPeticion['CentroSalud'];  
                        
            if (!empty($Cedula) ){ 

                $responseInsertarHC = $consulDB->insertarHC($Cedula, $Persona, $CentroSalud);
                $datosRespuesta = $responseInsertarHC;
                if (!isset($datosRespuesta["error"])){
                     $responseInsertadoHC["error"] = "false";
                     $responseInsertadoHC["status"] = "OK";
                     $responseInsertadoHC["message"] = "SUCCESS";
                     $responseInsertadoHC['fecha'] = ObtenerFecha();                 
                     $responseInsertadoHC["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseInsertadoHC["error"] = "true";
                     $responseInsertadoHC["status"] = "error";
                     $responseInsertadoHC["message"] = $datosRespuesta['error'];
                     $responseInsertadoHC['fecha'] = "";
                     $responseInsertadoHC["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseInsertadoHC;
            }else{
                $responseInsertadoHC["error"] = "true";
                $responseInsertadoHC["status"] = "error";
                $responseInsertadoHC["message"] = "Falta cedula para insertar la HC";
                $responseInsertadoHC['fecha'] = "";
                $responseInsertadoHC["respuesta"] = "{}";
                return $responseInsertadoHC;
            }  
        }else{
            $responseInsertadoHC["error"] = "true";
            $responseInsertadoHC["status"] = "error";
            $responseInsertadoHC["message"] = "Falta datos cedula para insertar la HC";
            $responseInsertadoHC['fecha'] = "";
            $responseInsertadoHC['token'] = "";
            $responseInsertadoHC["respuesta"] = "{}";
            return $responseInsertadoHC;
        }
    }
    
    public function editarCedulaHC() {  

            $consulDB = new consultasDB();    
            
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
            $Persona = $datosPeticion['Persona'];  
            $CentroSalud = $datosPeticion['CentroSalud'];  
                        
            if (!empty($Cedula) ){ 

                $responseEditarHC = $consulDB->editarHC($Cedula, $Persona, $CentroSalud);
                $datosRespuesta = $responseEditarHC;
                if (!isset($datosRespuesta["error"])){
                     $responseEditadoHC["error"] = "false";
                     $responseEditadoHC["status"] = "OK";
                     $responseEditadoHC["message"] = "SUCCESS";
                     $responseEditadoHC['fecha'] = ObtenerFecha();                 
                     $responseEditadoHC["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseEditadoHC["error"] = "true";
                     $responseEditadoHC["status"] = "error";
                     $responseEditadoHC["message"] = $datosRespuesta['error'];
                     $responseEditadoHC['fecha'] = "";
                     $responseEditadoHC["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseEditadoHC;
            }else{
                $responseEditadoHC["error"] = "true";
                $responseEditadoHC["status"] = "error";
                $responseEditadoHC["message"] = "Falta cedula para editar la HC";
                $responseEditadoHC['fecha'] = "";
                $responseEditadoHC["respuesta"] = "{}";
                return $responseEditadoHC;
            }  
        }else{
            $responseEditadoHC["error"] = "true";
            $responseEditadoHC["status"] = "error";
            $responseEditadoHC["message"] = "Falta datos cedula para editar la HC";
            $responseEditadoHC['fecha'] = "";
            $responseEditadoHC['token'] = "";
            $responseEditadoHC["respuesta"] = "{}";
            return $responseEditadoHC;
        }
    }
    
    public function insertarDatosAntro() {  

            $consulDB = new consultasDB();    
            
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
            $Persona = $datosPeticion['Persona'];  
            $FechaToma = $datosPeticion['FechaToma'];  
            $Peso = $datosPeticion['Peso'];  
            $Talla = $datosPeticion['Talla'];  
            $CircunfeAbdominal= $datosPeticion['CircunfeAbdominal'];  
            $Temperatura = $datosPeticion['Temperatura'];  
            $IMC = $datosPeticion['IMC'];  
            $P_sistolica= $datosPeticion['P_sistolica'];  
            $P_Diastolica = $datosPeticion['P_Diastolica'];  
            $PocentGrasa = $datosPeticion['PocentGrasa'];  
            $ContorCintura= $datosPeticion['ContorCintura']; 
            $PorcenMusculo = $datosPeticion['PorcenMusculo'];  
            $PorcGrasViseral = $datosPeticion['PorcGrasViseral'];  
            $FrecCardiaca= $datosPeticion['FrecCardiaca']; 
            $FrecRespiratoria = $datosPeticion['FrecRespiratoria'];  
            $Glicemia= $datosPeticion['Glicemia'];  
            $Otro= $datosPeticion['Otro'];     
            $Usuario= $datosPeticion['Usuario'];     
            
            if (!empty($Cedula) ){ 

                $responseInsertarHC = $consulDB->insertarDatAntro($Cedula, $Persona, $FechaToma,$Peso,$Talla,$CircunfeAbdominal, $Temperatura,$IMC, $P_sistolica, $P_Diastolica, $PocentGrasa, $ContorCintura, $PorcenMusculo, $PorcGrasViseral, $FrecCardiaca,  $FrecRespiratoria,  $Glicemia, $Otro, $Usuario);
                $datosRespuesta = $responseInsertarHC;
                if (!isset($datosRespuesta["error"])){
                     $responseInsertadoDAnt["error"] = "false";
                     $responseInsertadoDAnt["status"] = "OK";
                     $responseInsertadoDAnt["message"] = "SUCCESS";
                     $responseInsertadoDAnt['fecha'] = ObtenerFecha();                 
                     $responseInsertadoDAnt["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseInsertadoDAnt["error"] = "true";
                     $responseInsertadoDAnt["status"] = "error";
                     $responseInsertadoDAnt["message"] = $datosRespuesta['error'];
                     $responseInsertadoDAnt['fecha'] = "";
                     $responseInsertadoDAnt["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseInsertadoDAnt;
            }else{
                $responseInsertadoDAnt["error"] = "true";
                $responseInsertadoDAnt["status"] = "error";
                $responseInsertadoDAnt["message"] = "Falta datos para insertar Datos Antropometricos";
                $responseInsertadoDAnt['fecha'] = "";
                $responseInsertadoDAnt["respuesta"] = "{}";
                return $responseInsertadoDAnt;
            }  
        }else{
            $responseInsertadoDAnt["error"] = "true";
            $responseInsertadoDAnt["status"] = "error";
            $responseInsertadoDAnt["message"] = "Falta datos para insertar Datos Antropometricos";
            $responseInsertadoDAnt['fecha'] = "";
            $responseInsertadoDAnt['token'] = "";
            $responseInsertadoDAnt["respuesta"] = "{}";
            return $responseInsertadoDAnt;
        }
    }
    
    public function editarDatosAntro() {  

            $consulDB = new consultasDB();    
            
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
            $Persona = $datosPeticion['Persona'];  
            $FechaToma = $datosPeticion['FechaToma'];  
            $Peso = $datosPeticion['Peso'];  
            $Talla = $datosPeticion['Talla'];  
            $CircunfeAbdominal= $datosPeticion['CircunfeAbdominal'];  
            $Temperatura = $datosPeticion['Temperatura'];  
            $IMC = $datosPeticion['IMC'];  
            $P_sistolica= $datosPeticion['P_sistolica'];  
            $P_Diastolica = $datosPeticion['P_Diastolica'];  
            $PocentGrasa = $datosPeticion['PocentGrasa'];  
            $ContorCintura= $datosPeticion['ContorCintura']; 
            $PorcenMusculo = $datosPeticion['PorcenMusculo'];  
            $PorcGrasViseral = $datosPeticion['PorcGrasViseral'];  
            $FrecCardiaca= $datosPeticion['FrecCardiaca']; 
            $FrecRespiratoria = $datosPeticion['FrecRespiratoria'];  
            $Glicemia= $datosPeticion['Glicemia'];  
            $Otro= $datosPeticion['Otro'];     
            $Usuario= $datosPeticion['Usuario'];     
            
            if (!empty($Cedula) ){ 

                $responseEditarDAnt = $consulDB->editarDatAntro($Cedula, $Persona, $FechaToma,$Peso,$Talla,$CircunfeAbdominal, $Temperatura,$IMC, $P_sistolica, $P_Diastolica, $PocentGrasa, $ContorCintura, $PorcenMusculo, $PorcGrasViseral, $FrecCardiaca,  $FrecRespiratoria,  $Glicemia, $Otro, $Usuario);
                $datosRespuesta = $responseEditarDAnt;
                if (!isset($datosRespuesta["error"])){
                     $responseEditadoDAnt["error"] = "false";
                     $responseEditadoDAnt["status"] = "OK";
                     $responseEditadoDAnt["message"] = "SUCCESS";
                     $responseEditadoDAnt['fecha'] = ObtenerFecha();                 
                     $responseEditadoDAnt["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseEditadoDAnt["error"] = "true";
                     $responseEditadoDAnt["status"] = "error";
                     $responseEditadoDAnt["message"] = $datosRespuesta['error'];
                     $responseEditadoDAnt['fecha'] = "";
                     $responseEditadoDAnt["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseEditadoDAnt;
            }else{
                $responseEditadoDAnt["error"] = "true";
                $responseEditadoDAnt["status"] = "error";
                $responseEditadoDAnt["message"] = "Falta datos para exitars Datos Antropometricos";
                $responseEditadoDAnt['fecha'] = "";
                $responseEditadoDAnt["respuesta"] = "{}";
                return $responseEditadoDAnt;
            }  
        }else{
            $responseEditadoDAnt["error"] = "true";
            $responseEditadoDAnt["status"] = "error";
            $responseEditadoDAnt["message"] = "Falta datos para editar Datos Antropometricos";
            $responseEditadoDAnt['fecha'] = "";
            $responseEditadoDAnt['token'] = "";
            $responseEditadoDAnt["respuesta"] = "{}";
            return $responseEditadoDAnt;
        }
    }
    
    public function insertarDatosCronologicas() {  

            $consulDB = new consultasDB();    
            
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
            $Persona = $datosPeticion['Persona'];  
            $FechaToma = $datosPeticion['FechaToma'];  
            $Motivo = $datosPeticion['Motivo'];  
            $Anamnesis = $datosPeticion['Anamnesis'];  
            $Exploracion= $datosPeticion['Exploracion'];  
            $Diagnostico = $datosPeticion['Diagnostico'];  
            $Actuacion = $datosPeticion['Actuacion']; 
            $codigo_usuario= $datosPeticion['codigo_usuario'];  
            $Codigo_CIE = $datosPeticion['Codigo_CIE'];  
            $CodigoPlan = $datosPeticion['CodigoPlan'];     
            
            if (!empty($Cedula) ){ 

                $responseInsertarCronologias = $consulDB->insertarCronologias($Cedula, $Persona, $FechaToma,$Motivo,$Anamnesis,$Exploracion, $Diagnostico, $Actuacion, $codigo_usuario, $Codigo_CIE,$CodigoPlan);                                                                                    
                $datosRespuesta = $responseInsertarCronologias;
                if (!isset($datosRespuesta["error"])){
                     $responseInsertadoCronologias["error"] = "false";
                     $responseInsertadoCronologias["status"] = "OK";
                     $responseInsertadoCronologias["message"] = "SUCCESS";
                     $responseInsertadoCronologias['fecha'] = ObtenerFecha();                 
                     $responseInsertadoCronologias["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseInsertadoCronologias["error"] = "true";
                     $responseInsertadoCronologias["status"] = "error";
                     $responseInsertadoCronologias["message"] = $datosRespuesta['error'];
                     $responseInsertadoCronologias['fecha'] = "";
                     $responseInsertadoCronologias["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseInsertadoCronologias;
            }else{
                $responseInsertadoCronologias["error"] = "true";
                $responseInsertadoCronologias["status"] = "error";
                $responseInsertadoCronologias["message"] = "Falta datos para insertar Datos Cronologicas";
                $responseInsertadoCronologias['fecha'] = "";
                $responseInsertadoCronologias["respuesta"] = "{}";
                return $responseInsertadoCronologias;
            }  
        }else{
            $responseInsertadoCronologias["error"] = "true";
            $responseInsertadoCronologias["status"] = "error";
            $responseInsertadoCronologias["message"] = "Falta datos para insertar Datos Cronologicas";
            $responseInsertadoCronologias['fecha'] = "";
            $responseInsertadoCronologias['token'] = "";
            $responseInsertadoCronologias["respuesta"] = "{}";
            return $responseInsertadoCronologias;
        }
    }
   
    public function borrarCronologicas() {  

            $consulDB = new consultasDB();    
            
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
        
        if (isset($datosPeticion['CedulaNumero'])) {
           
            $Cedula = $datosPeticion['CedulaNumero'];  
            $Persona = $datosPeticion['PersonaCodigo'];  
            $Id_unico_cronologica = $datosPeticion['Id_cronologicas'];
            
            
            if (!empty($Cedula) ){ 

                $responseBorrarCronologias = $consulDB->borrarCronologicas($Cedula, $Persona, $Id_unico_cronologica );                                                                                    
                $datosRespuesta = $responseBorrarCronologias;
                if (!isset($datosRespuesta["error"])){
                     $responseBorradoCronologias["error"] = "false";
                     $responseBorradoCronologias["status"] = "OK";
                     $responseBorradoCronologias["message"] = "SUCCESS";
                     $responseBorradoCronologias['fecha'] = ObtenerFecha();                 
                     $responseBorradoCronologias["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseBorradoCronologias["error"] = "true";
                     $responseBorradoCronologias["status"] = "error";
                     $responseBorradoCronologias["message"] = $datosRespuesta['error'];
                     $responseBorradoCronologias['fecha'] = "";
                     $responseBorradoCronologias["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseBorradoCronologias;
            }else{
                $responseBorradoCronologias["error"] = "true";
                $responseBorradoCronologias["status"] = "error";
                $responseBorradoCronologias["message"] = "Falta datos para borrar Datos Cronologicas";
                $responseBorradoCronologias['fecha'] = "";
                $responseBorradoCronologias["respuesta"] = "{}";
                return $responseBorradoCronologias;
            }  
        }else{
            $responseBorradoCronologias["error"] = "true";
            $responseBorradoCronologias["status"] = "error";
            $responseBorradoCronologias["message"] = "Falta datos para borrar Datos Cronologicas";
            $responseBorradoCronologias['fecha'] = "";
            $responseBorradoCronologias['token'] = "";
            $responseBorradoCronologias["respuesta"] = "{}";
            return $responseBorradoCronologias;
        }
    }
    
    
    public function AprobarMedico() {  

            $consulDB = new consultasDB();    
            
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
        
        if (isset($datosPeticion['Codigo_usuario'])) {
           
            $Codigo_usuario = $datosPeticion['Codigo_usuario'];  
            $Codigo_perfil_usuario = $datosPeticion['Codigo_perfil_usuario'];  
            $codigo_empresa = $datosPeticion['codigo_empresa'];  
            $estado = $datosPeticion['estado'];  
            $Nombres = $datosPeticion['Nombres'];
            $Correo=$datosPeticion['Correo'];
            
            if (!empty($Codigo_usuario) ){ 

                $responseAprobarMedico = $consulDB->AprobarMedico($Codigo_usuario, $Codigo_perfil_usuario, $codigo_empresa, $estado );                                                                                    
                $datosRespuesta = $responseAprobarMedico;
                if (!isset($datosRespuesta["error"])){
                     $responseAprobadoMedico["error"] = "false";
                     $responseAprobadoMedico["status"] = "OK";
                     $responseAprobadoMedico["message"] = "SUCCESS";
                     $responseAprobadoMedico['fecha'] = ObtenerFecha();                 
                     $responseAprobadoMedico["respuesta"] = $datosRespuesta;
                     
                     if ($estado= "1"){
                        //Aqui se genera el envio del correo con la confirmacion de la aprobacion 
                           /*Enviamos Email*/
                           $agenteMail = new mailAgent();
                           $NombreCompleto = $Nombres;
                           $para                   = $Correo;
                           $titulo                 = "Excelencia Medica - Aprobacion uso de plataforma";
                           $html                   =$agenteMail->crearMailTemplateAprobacionMedico($NombreCompleto);
                           $StatusMail             =$agenteMail->enviarMail($para,$titulo,$html);
                        //Verifica estado de envio de correo   
                     }
                     if ($estado= "2"){
                        //Aqui se genera el envio del correo con la confirmacion de la rechazado 
                           /*Enviamos Email*/
                           $agenteMail = new mailAgent();
                           $NombreCompleto = $Nombres;
                           $para                   = $Correo;
                           $titulo                 = "Excelencia Medica - NO Aprobacion uso de plataforma";
                           $html                   =$agenteMail->crearMailTemplateRechazadoMedico($NombreCompleto);
                           $StatusMail             =$agenteMail->enviarMail($para,$titulo,$html);
                        //Verifica estado de envio de correo   
                     }
                 }
                 else {
                     $responseAprobadoMedico["error"] = "true";
                     $responseAprobadoMedico["status"] = "error";
                     $responseAprobadoMedico["message"] = $datosRespuesta['error'];
                     $responseAprobadoMedico['fecha'] = "";
                     $responseAprobadoMedico["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseAprobadoMedico;
            }else{
                $responseAprobadoMedico["error"] = "true";
                $responseAprobadoMedico["status"] = "error";
                $responseAprobadoMedico["message"] = "Falta datos para aprobar medico";
                $responseAprobadoMedico['fecha'] = "";
                $responseAprobadoMedico["respuesta"] = "{}";
                return $responseAprobadoMedico;
            }  
        }else{
            $responseAprobadoMedico["error"] = "true";
            $responseAprobadoMedico["status"] = "error";
            $responseAprobadoMedico["message"] = "Falta datos para para aprobar medico";
            $responseAprobadoMedico['fecha'] = "";
            $responseAprobadoMedico['token'] = "";
            $responseAprobadoMedico["respuesta"] = "{}";
            return $responseAprobadoMedico;
        }
    }
    
    public function sellarCronologia() {  

            $consulDB = new consultasDB();    
            
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
        
        if (isset($datosPeticion['CedulaNumero'])) {
           
            $CedulaNumero = $datosPeticion['CedulaNumero'];  
            $PersonaCodigo = $datosPeticion['PersonaCodigo'];  
            $Id_cronologicas = $datosPeticion['Id_cronologicas'];
            $Correo =$datosPeticion['Correo']; 
            $NombreCompleto =$datosPeticion['NombreCompleto']; 
            $Actuacion =$datosPeticion['Actuacion']; 
            $FechaCronologia = $datosPeticion['FechaCronologia'];
            $Profesion = $datosPeticion['Profesion'];
            $Medico = $datosPeticion['Medico'];
            
            if (!empty($CedulaNumero) ){ 

                $responseSellarCronologia= $consulDB->SellarCronologia($CedulaNumero, $PersonaCodigo, $Id_cronologicas);                                                                                    
                $datosRespuesta = $responseSellarCronologia;
                if (!isset($datosRespuesta["error"])){
                     $responseSelladoCronologia["error"] = "false";
                     $responseSelladoCronologia["status"] = "OK";
                     $responseSelladoCronologia["message"] = "SUCCESS";
                     $responseSelladoCronologia['fecha'] = ObtenerFecha();                 
                     $responseSelladoCronologia["respuesta"] = $datosRespuesta;
                     
                     //Aqui se genera el envio del correo con la información de la actuacion de la cronologia 
                           /*Enviamos Email*/
                           $agenteMail = new mailAgent();
                           $para                   = $Correo;
                           $titulo                 = "Recomendaciones para la Actuacion, dadas por Excelencia Medica ";
                           $html                   =$agenteMail->crearMailTemplateActuacionCronologica($NombreCompleto, $Actuacion, $FechaCronologia, $Profesion, $Medico);
                           $StatusMail             =$agenteMail->enviarMail($para,$titulo,$html);
                     //Verifica estado de envio de correo   
                     
                 }
                 else {
                     $responseSelladoCronologia["error"] = "true";
                     $responseSelladoCronologia["status"] = "error";
                     $responseSelladoCronologia["message"] = $datosRespuesta['error'];
                     $responseSelladoCronologia['fecha'] = "";
                     $responseSelladoCronologia["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseSelladoCronologia;
            }else{
                $responseSelladoCronologia["error"] = "true";
                $responseSelladoCronologia["status"] = "error";
                $responseSelladoCronologia["message"] = "Falta datos para sellar cronologia";
                $responseSelladoCronologia['fecha'] = "";
                $responseSelladoCronologia["respuesta"] = "{}";
                return $responseSelladoCronologia;
            }  
        }else{
            $responseSelladoCronologia["error"] = "true";
            $responseSelladoCronologia["status"] = "error";
            $responseSelladoCronologia["message"] = "Falta datos para para sellar cronologia";
            $responseSelladoCronologia['fecha'] = "";
            $responseSelladoCronologia['token'] = "";
            $responseSelladoCronologia["respuesta"] = "{}";
            return $responseSelladoCronologia;
        }
    }
    
    
    public function sellarAntropometrico() {  

            $consulDB = new consultasDB();    
            
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
           
            $CedulaNumero = $datosPeticion['Cedula'];  
            $CodigoPersona = $datosPeticion['CodigoPersona'];  
            $FechaToma = $datosPeticion['FechaToma'];  
            
                      
            if (!empty($CedulaNumero) ){ 

                $responseSellarCronologia= $consulDB->SellarAntropometria($CedulaNumero, $CodigoPersona, $FechaToma);                                                                                    
                $datosRespuesta = $responseSellarCronologia;
                if (!isset($datosRespuesta["error"])){
                     $responseSelladoAntropometria["error"] = "false";
                     $responseSelladoAntropometria["status"] = "OK";
                     $responseSelladoAntropometria["message"] = "SUCCESS";
                     $responseSelladoAntropometria['fecha'] = ObtenerFecha();                 
                     $responseSelladoAntropometria["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseSelladoAntropometria["error"] = "true";
                     $responseSelladoAntropometria["status"] = "error";
                     $responseSelladoAntropometria["message"] = $datosRespuesta['error'];
                     $responseSelladoAntropometria['fecha'] = "";
                     $responseSelladoAntropometria["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseSelladoAntropometria;
            }else{
                $responseSelladoAntropometria["error"] = "true";
                $responseSelladoAntropometria["status"] = "error";
                $responseSelladoAntropometria["message"] = "Falta datos para sellar antropometria";
                $responseSelladoAntropometria['fecha'] = "";
                $responseSelladoAntropometria["respuesta"] = "{}";
                return $responseSelladoAntropometria;
            }  
        }else{
            $responseSelladoAntropometria["error"] = "true";
            $responseSelladoAntropometria["status"] = "error";
            $responseSelladoAntropometria["message"] = "Falta datos para para sellar antropometria";
            $responseSelladoAntropometria['fecha'] = "";
            $responseSelladoAntropometria['token'] = "";
            $responseSelladoAntropometria["respuesta"] = "{}";
            return $responseSelladoAntropometria;
        }
    }
    public function obtenerUnDatoCronologicas() {  

            $consulDB = new consultasDB();    
            
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
            
            $Cedula = "";  
            $Persona ="";
            $Id_cronologicas ="";
            
            
            
        if (isset($datosPeticion['CedulaNumero'])) {
            
            $Cedula = $datosPeticion['CedulaNumero'];  
            $Persona =$datosPeticion['PersonaCodigo']; 
            $Id_cronologicas =$datosPeticion['Id_cronologicas']; 
                        
            if (!empty($Cedula) ){ 

                $responseCronologicaEdit = $consulDB->obtenerUnDatoCronologica($Cedula,$Persona, $Id_cronologicas );
                $datosRespuesta = $responseCronologicaEdit;
                if (!isset($datosRespuesta["error"])){
                     $responseCronologiaEdit["error"] = "false";
                     $responseCronologiaEdit["status"] = "OK";
                     $responseCronologiaEdit["message"] = "SUCCESS";
                     $responseCronologiaEdit['fecha'] = ObtenerFecha();                 
                     $responseCronologiaEdit["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseCronologiaEdit["error"] = "true";
                     $responseCronologiaEdit["status"] = "error";
                     $responseCronologiaEdit["message"] = $datosRespuesta['error'];
                     $responseCronologiaEdit['fecha'] = "";
                     $responseCronologiaEdit["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseCronologiaEdit;
            }else{
                $responseCronologiaEdit["error"] = "true";
                $responseCronologiaEdit["status"] = "error";
                $responseCronologiaEdit["message"] = " Falta Datos cedula" ;
                $responseCronologiaEdit['fecha'] = "";
                $responseCronologiaEdit["respuesta"] = "{}";
                return $responseCronologiaEdit;
            }  
        }else{
            $responseCronologiaEdit["error"] = "true";
            $responseCronologiaEdit["status"] = "error";
            $responseCronologiaEdit["message"] =  " Falta Datos cedula" ;
            $responseCronologiaEdit['fecha'] = "";
            $responseCronologiaEdit['token'] = "";
            $responseCronologiaEdit["respuesta"] = "{}";
            return $responseCronologiaEdit;
        }
    }
    
    
    public function obtenerListaTipoIdentificacion() {  

            $consulDB = new consultasDB();    
            
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
        
        if (isset($datosPeticion['Codigo_pais'])) {
            
            $Codigo_pais = $datosPeticion['Codigo_pais'];  
            if (!empty($Codigo_pais)) { 

                $responseTipoIdent = $consulDB->obtenerListaTipoIdentificacion($Codigo_pais);
                $datosRespuesta = $responseTipoIdent;
                if (!isset($datosRespuesta["error"])){
                     $responseTipoIdentif["error"] = "false";
                     $responseTipoIdentif["status"] = "OK";
                     $responseTipoIdentif["message"] = "SUCCESS";
                     $responseTipoIdentif['fecha'] = ObtenerFecha();                 
                     $responseTipoIdentif["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseTipoIdentif["error"] = "true";
                     $responseTipoIdentif["status"] = "error";
                     $responseTipoIdentif["message"] = $datosRespuesta['error'];
                     $responseTipoIdentif['fecha'] = "";
                     $responseTipoIdentif["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseTipoIdentif;
            }else{
                $responseTipoIdentif["error"] = "true";
                $responseTipoIdentif["status"] = "error";
                $responseTipoIdentif["message"] = "Falta datos pais";
                $responseTipoIdentif['fecha'] = "";
                $responseTipoIdentif["respuesta"] = "{}";
                return $responseTipoIdentif;
            }  
        }else{
            $responseTipoIdentif["error"] = "true";
            $responseTipoIdentif["status"] = "error";
            $responseTipoIdentif["message"] = "Falta datos pais";
            $responseTipoIdentif['fecha'] = "";
            $responseTipoIdentif['token'] = "";
            $responseTipoIdentif["respuesta"] = "{}";
            return $responseTipoIdentif;
        }
        
            
    }
    
    public function obtenerListaCIE() {  

        //objeto que maneja los requerimientos/peticiones
        $request = new simpleRest();
        //obtiene los datos de la peticion
        //$json = $request->getHttpRequestBody();
        //objeto que maneja las codificaciones/descodificaciones
        $handler = new requestRestHandler();
        
        //if (filter_var($username, FILTER_VALIDATE_EMAIL)) {  
            $consulDB = new consultasDB();    
            //$this->mostrarRespuesta($this->convertirJson($respuesta), 200);  
            $responseCIE = $consulDB->obtenerListaCIE();

            //echo $responseUsuario;
            //$datosRespuesta = (array)$handler->decodeJson($responsePaises);
            $datosRespuesta = $responseCIE;
            //$datosRespuesta = $handler->decodeJson($responsePaises);

            if (!isset($datosRespuesta["error"])){
                //$respuesta['usuario'] = $username;
                $responseObtenerCIE10["error"] = "false";
                $responseObtenerCIE10["status"] = "OK";
                $responseObtenerCIE10["message"] = "SUCCESS";
                $responseObtenerCIE10['fecha'] = ObtenerFecha(); //Obtiene la fecha actual
                //Aqui se implementa el manejo del token
                $responseObtenerCIE10["respuesta"] = $datosRespuesta;

            }
            else {
                //Hay posiblidades: 1 - usuario no existe  2 - clave invalida
                $responseObtenerCIE10["error"] = "true";
                $responseObtenerCIE10["status"] = "error";
                $responseObtenerCIE10["message"] = $datosRespuesta['error'];
                $responseObtenerCIE10['fecha'] = "";
                $responseObtenerCIE10["respuesta"] = "{}";
            }

            $consulDB = null;
            //enviar respuesta
            return $responseObtenerCIE10;

        //}
            
    }
    
    
    public function busquedaCIE() {  

        $consulDB = new consultasDB();    
            
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
        
        if (isset($datosPeticion['Criterio'])) {
           
            $Criterio= $datosPeticion['Criterio'];  
            $Valor = $datosPeticion['Valor'];  
            if (!empty($Criterio) ){ 

                $responseListarCIE= $consulDB->ListarBusquedaCIE10($Criterio, $Valor);                                                                                    
                $datosRespuesta = $responseListarCIE;
                if (!isset($datosRespuesta["error"])){
                     $responseListadoCIEBusqueda["error"] = "false";
                     $responseListadoCIEBusqueda["status"] = "OK";
                     $responseListadoCIEBusqueda["message"] = "SUCCESS";
                     $responseListadoCIEBusqueda['fecha'] = ObtenerFecha();                 
                     $responseListadoCIEBusqueda["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseListadoCIEBusqueda["error"] = "true";
                     $responseListadoCIEBusqueda["status"] = "error";
                     $responseListadoCIEBusqueda["message"] = $datosRespuesta['error'];
                     $responseListadoCIEBusqueda['fecha'] = "";
                     $responseListadoCIEBusqueda["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseListadoCIEBusqueda;
            }else{
                $responseListadoCIEBusqueda["error"] = "true";
                $responseListadoCIEBusqueda["status"] = "error";
                $responseListadoCIEBusqueda["message"] = "Falta datos para listar la busqueda de CIE ";
                $responseListadoCIEBusqueda['fecha'] = "";
                $responseListadoCIEBusqueda["respuesta"] = "{}";
                return $responseListadoCIEBusqueda;
            }  
        }else{
            $responseListadoCIEBusqueda["error"] = "true";
            $responseListadoCIEBusqueda["status"] = "error";
            $responseListadoCIEBusqueda["message"] = "Falta datos para listar la busqueda de CIE ";
            $responseListadoCIEBusqueda['fecha'] = "";
            $responseListadoCIEBusqueda['token'] = "";
            $responseListadoCIEBusqueda["respuesta"] = "{}";
            return $responseListadoCIEBusqueda;
        }
            
    }
    
    public function ListarSolicitudes() {  

        $consulDB = new consultasDB();    
            
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
        
        if (isset($datosPeticion['Codigo_empresa'])) {
           
            $Codigo_empresa= $datosPeticion['Codigo_empresa'];  
            if (!empty($Codigo_empresa) ){ 

                $responseListarSolicitudes = $consulDB->ListarSolicitudes($Codigo_empresa);                                                                                    
                $datosRespuesta = $responseListarSolicitudes;
                if (!isset($datosRespuesta["error"])){
                     $responseListadoSolicitudes["error"] = "false";
                     $responseListadoSolicitudes["status"] = "OK";
                     $responseListadoSolicitudes["message"] = "SUCCESS";
                     $responseListadoSolicitudes['fecha'] = ObtenerFecha();                 
                     $responseListadoSolicitudes["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseListadoSolicitudes["error"] = "true";
                     $responseListadoSolicitudes["status"] = "error";
                     $responseListadoSolicitudes["message"] = $datosRespuesta['error'];
                     $responseListadoSolicitudes['fecha'] = "";
                     $responseListadoSolicitudes["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseListadoSolicitudes;
            }else{
                $responseListadoSolicitudes["error"] = "true";
                $responseListadoSolicitudes["status"] = "error";
                $responseListadoSolicitudes["message"] = "Falta datos para cargar Solicitudes";
                $responseListadoSolicitudes['fecha'] = "";
                $responseListadoSolicitudes["respuesta"] = "{}";
                return $responseListadoSolicitudes;
            }  
        }else{
            $responseListadoSolicitudes["error"] = "true";
            $responseListadoSolicitudes["status"] = "error";
            $responseListadoSolicitudes["message"] = "Falta datos para cargar Solicitudes";
            $responseListadoSolicitudes['fecha'] = "";
            $responseListadoSolicitudes['token'] = "";
            $responseListadoSolicitudes["respuesta"] = "{}";
            return $responseListadoSolicitudes;
        }
            
    }
    
    public function editarDatosCronologicas() {  

            $consulDB = new consultasDB();    
            
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
            $Persona = $datosPeticion['Persona'];  
            $FechaToma = $datosPeticion['FechaToma'];  
            $Motivo = $datosPeticion['Motivo'];  
            $Anamnesis = $datosPeticion['Anamnesis'];  
            $Exploracion= $datosPeticion['Exploracion'];  
            $Diagnostico = $datosPeticion['Diagnostico'];  
            $Actuacion = $datosPeticion['Actuacion']; 
            $Codigo_CIE = $datosPeticion['Codigo_CIE'];  
            $Id_unico_cronologica = $datosPeticion['Id_unico_cronologica']; 
            
            if (!empty($Cedula) ){ 

                $responseEditarCronologias = $consulDB->editarCronologias($Cedula, $Persona, $FechaToma,$Motivo,$Anamnesis,$Exploracion, $Diagnostico, $Actuacion,  $Codigo_CIE,$Id_unico_cronologica);                                                                                    
                $datosRespuesta = $responseEditarCronologias;
                if (!isset($datosRespuesta["error"])){
                     $responseEditadoCronologias["error"] = "false";
                     $responseEditadoCronologias["status"] = "OK";
                     $responseEditadoCronologias["message"] = "SUCCESS";
                     $responseEditadoCronologias['fecha'] = ObtenerFecha();                 
                     $responseEditadoCronologias["respuesta"] = $datosRespuesta;
                 }
                 else {
                     $responseEditadoCronologias["error"] = "true";
                     $responseEditadoCronologias["status"] = "error";
                     $responseEditadoCronologias["message"] = $datosRespuesta['error'];
                     $responseEditadoCronologias['fecha'] = "";
                     $responseEditadoCronologias["respuesta"] = "{}";
                 }

                $consulDB = null;
                //enviar respuesta
                return $responseEditadoCronologias;
            }else{
                $responseEditadoCronologias["error"] = "true";
                $responseEditadoCronologias["status"] = "error";
                $responseEditadoCronologias["message"] = "Falta datos para editar Datos Cronologicas";
                $responseEditadoCronologias['fecha'] = "";
                $responseEditadoCronologias["respuesta"] = "{}";
                return $responseEditadoCronologias;
            }  
        }else{
            $responseEditadoCronologias["error"] = "true";
            $responseEditadoCronologias["status"] = "error";
            $responseEditadoCronologias["message"] = "Falta datos para editar Datos Cronologicas";
            $responseEditadoCronologias['fecha'] = "";
            $responseEditadoCronologias['token'] = "";
            $responseEditadoCronologias["respuesta"] = "{}";
            return $responseEditadoCronologias;
        }
    }
    
}
?>