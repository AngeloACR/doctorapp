<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once "utils/simpleRest.php";
include_once "utils/requestRestHandler.php";

include_once "utils/utilsDB.php";
include_once "utils/tokenSec.php";
include_once "utils/encript.php";
include_once "controller/mailControl.php";
include_once "controller/consultasControl.php";
include_once "controller/loginControl.php";
include_once "controller/usuariosControl.php";


/**
 * Description of HeliAPI
 *
 * @author Carmen Tacuri
 */
class DoctoAPI {
    //API function
    public function api(){
        
        try{
            //Declara el objeto rest
            $restObj = New simpleRest();

             //Define la respuesta JSON
            $restObj->setHttpMessageHeader(200);
            //$restObj->setHttpHeaders('Access-Control-Allow-Origin','*');
            //$restObj->setHttpHeaders('Access-Control-Allow-Headers','Origin, X-Requested-With, Content-Type, Accept, Authorization');
            //$restObj->setHttpHeaders('Access-Control-Allow-Methods','GET, POST, PUT, DELETE');
            $restObj->setHttpHeaders('Content-Type','application/JSON; charset=UTF-8');
            

            //switchear funcion
            $method = $_SERVER['REQUEST_METHOD'];
            $action = $_GET['action'];
            $headers = apache_request_headers();

            switch ($action) {
                case 'obtenerListaPaises':
                    if($method=="GET"){
                        $consCtl = new consultasControl();
                        $responseCons = $consCtl->obtenerListaPaises();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'obtenerListaTipoIdentificacion':
                    if($method=="POST"){
                        $consCtl = new consultasControl();
                        $responseCons = $consCtl->obtenerListaTipoIdentificacion();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;    
                case 'obtenerListaProvincias':
                    if($method=="POST"){
                        $consCtl = new consultasControl();
                        $responseCons = $consCtl->obtenerListaProvincias();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'obtenerListaProfesiones':
                    if($method=="GET"){
                        $consCtl = new consultasControl();
                        $responseCons = $consCtl->obtenerListaProfesiones();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'verificarPersona'://valida que la cedula exista o no exista en la tabla personas
                    if ($method=="POST"){
                        $persCtl = new personasControl();
                        $responseCons=$persCtl->verificarPersona();
                        $this->response(200,$responseCons); 
                    }
                    else{
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'registrarPersona':
                    if($method=="POST"){
                        $persCtl = new personasControl();
                        $responseCons = $persCtl->registrarPersona();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'obtenerPersona':
                    if($method=="POST"){
                        $persCtl = new personasControl();
                        $responseCons = $persCtl->obtenerPersona();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'obtenerTipoPerfil':
                    if($method=="POST"){
                        $perfilCtl = new perfilesControl();
                        $responseCons = $perfilCtl->obtenerTipoPerfil();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'obtenerListaPerfiles':
                    if($method=="POST"){
                        $perfilCtl = new perfilesControl();
                        $responseCons = $perfilCtl->obtenerListaPerfiles();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'obtenerListaEmpresasPais':
                    if($method=="POST"){
                        $emprCtl = new empresasControl();
                        $responseCons = $emprCtl->obtenerListaEmpresasPais();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'validarActivacion':
                    if($method=="POST"){
                        $persCtl = new personasControl();
                        $responseCons = $persCtl->validarActivacion();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'activarPersona':
                    if($method=="POST"){
                        $persCtl = new personasControl();
                        $responseCons = $persCtl->activarPersona();
                        $this->response(200,$responseCons); //status - 400
                    }
                    else
                    {
                        $responseCons["error"] = "true";
                        $responseCons["status"] = "error";
                        $responseCons["message"] = "Método NO soportado";
                        $this->response(200,$responseCons); //status - 405
                    }
                    break;
                case 'encriptarPassword'://encriptarPassword
                    if($method=="POST"){
                        $loginCtl = new loginControl();
                        $responsePassword = $loginCtl->encriptarPassword();
                        switch ($responsePassword["status"]) {
                            case "OK":
                                    $this->response(200,$responsePassword);
                                break;
                            default:
                                $this->response(200,$responsePassword); //status - 400
                                break;
                        }
                    }
                    else
                    {
                        $responseLogin["error"] = "true";
                        $responseLogin["status"] = "error";
                        $responseLogin["message"] = "Método NO soportado";
                        $this->response(200,$responseLogin); //status - 405
                    }
                    break;
                    
                case 'mailTestRegister':
                    if($method=="POST"){
                        $mailCtl = new mailControl();
                        $responseMailTest = $mailCtl->mailTestRegister();
                        switch ($responseMailTest["status"]) {
                            case "OK":
                                    $this->response(200,$responseMailTest);
                                break;
                            default:
                                $this->response(200,$responseMailTest); //status - 400
                                break;
                        }
                    }
                    else
                    {
                        $responseMailTest["error"] = "true";
                        $responseMailTest["status"] = "error";
                        $responseMailTest["message"] = "Método NO soportado";
                        $this->response(200,$responseMailTest); //status - 405
                    }
                    break;
                
                case 'mailTestAprobation':
                    if($method=="POST"){
                        $mailCtl = new mailControl();
                        $responseMailTest = $mailCtl->mailTestAprobation();
                        switch ($responseMailTest["status"]) {
                            case "OK":
                                    $this->response(200,$responseMailTest);
                                break;
                            default:
                                $this->response(200,$responseMailTest); //status - 400
                                break;
                        }
                    }
                    else
                    {
                        $responseMailTest["error"] = "true";
                        $responseMailTest["status"] = "error";
                        $responseMailTest["message"] = "Método NO soportado";
                        $this->response(200,$responseMailTest); //status - 405
                    }
                    break;
                case 'mailTestRechazo':
                    if($method=="POST"){
                        $mailCtl = new mailControl();
                        $responseMailTest = $mailCtl->mailTestRechazo();
                        switch ($responseMailTest["status"]) {
                            case "OK":
                                    $this->response(200,$responseMailTest);
                                break;
                            default:
                                $this->response(200,$responseMailTest); //status - 400
                                break;
                        }
                    }
                    else
                    {
                        $responseMailTest["error"] = "true";
                        $responseMailTest["status"] = "error";
                        $responseMailTest["message"] = "Método NO soportado";
                        $this->response(200,$responseMailTest); //status - 405
                    }
                    break;
                case 'mailTestActuacion':
                    if($method=="POST"){
                        $mailCtl = new mailControl();
                        $responseMailTest = $mailCtl->mailTestActuacion();
                        switch ($responseMailTest["status"]) {
                            case "OK":
                                    $this->response(200,$responseMailTest);
                                break;
                            default:
                                $this->response(200,$responseMailTest); //status - 400
                                break;
                        }
                    }
                    else
                    {
                        $responseMailTest["error"] = "true";
                        $responseMailTest["status"] = "error";
                        $responseMailTest["message"] = "Método NO soportado";
                        $this->response(200,$responseMailTest); //status - 405
                    }
                    break;
                case 'autenticarUsuario'://autenticaUsuario   Carmita
                    if($method=="POST"){
                        $loginCtl = new loginControl();
                        $responseLogin = $loginCtl->autenticarUsuario();
                        switch ($responseLogin["status"]) {
                            case "OK":
                                    $this->response(200,$responseLogin);
                                break;
                            default:
                                $this->response(200,$responseLogin); //status - 400
                                break;
                        }
                    }
                    else
                    {
                        $responseLogin["error"] = "true";
                        $responseLogin["status"] = "error";
                        $responseLogin["message"] = "Método NO soportado";
                        $this->response(200,$responseLogin); //status - 405
                    }
                    break;
                default:

                    // Verifying Authorization Header
                    if (isset($headers['Authorization'])) {
                    //$db = new DbHandler(); //utilizar para manejar autenticacion contra base de datos
                        // get the api key
                        $token = $headers['Authorization'];
                        // validating token
                        $jwt = new tokenSec();
                        $respToken = $jwt->validateToken($token);

                        if (!($respToken["estado"] == "valido")) { //API_KEY declarada en Config.php
                            // api key is not present in users table
                            $responseLogin["error"] = "true";
                            $responseLogin["status"] = "error";
                            //$responseLogin["message"] = "Acceso denegado. Token inválido";
                            $responseLogin["message"] = $respToken;
                            $this->response(200, $responseLogin); //status - 401
                        } else {
                            //procede utilizar el recurso o metodo del llamado del API

                            switch($action){
                                case 'obtenerModulosPerfil'://obtener Listado de opciones del sistema
                                    if ($method=="POST"){
                                        $listaMod = new modulosControl();
                                        $responseLista=$listaMod->obtenerListaModulosPerfil();
                                        $this->response(200,$responseLista); //status - 400
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                                                   
                                case 'obtenerListaOpcionesPerfil': //obtener listado de subopciones del sistma
                                    if ($method=="POST"){
                                        $listaOp = new opcionesControl();
                                        $responseLista=$listaOp->obtenerListaOpcionesPerfil();
                                        $this->response(200,$responseLista); //status - 400
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                case 'obtenerListaSubopcionesPerfil': //obtener listado de subopciones del sistma
                                    if ($method=="POST"){
                                        $listaSubop = new subopcionesControl();
                                        $responseLista=$listaSubop->obtenerListaSubOpcionesPerfil();
                                        $this->response(200,$responseLista); //status - 400
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                case 'obtenerListaPersonas'://obtener Listado de Personas
                                    if ($method=="POST"){
                                        $listaPersona = new personasControl();
                                        $responseLista=$listaPersona->obtenerListaPersonas();
                                        $this->response(200,$responseLista); //status - 400
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                case 'obtenerListaCantones'://obtener Listado de Cantones
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->obtenerListaCantones();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                         $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;  
                                case 'obtenerListaParroquias'://obtener Listado de parroquias
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->obtenerListaParroquias();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                         $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break; 
                                case 'obtenerListaUnidades'://obtener Listado de Unidades
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->obtenerListaUnidades();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                         $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;
                                case 'validarCedula'://valida que la cedula exista o no exista en la tabla Historias Clinicas
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->obtenerCedulaHC();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;
                                case 'insertarHC'://inserta a historia clínica y le asigna una unidad de salud
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->insertarCedulaHC();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;
                                case 'editarHC'://editar la historia clínica asignandole una unidad de salud
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->editarCedulaHC();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;   
                                case 'insertarDAntro'://inserta datos antropometricos
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->insertarDatosAntro();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;      
                                case 'editarDAntro'://edita datos antropometricos
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->editarDatosAntro();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;  
                                case 'obtenerListaHistoriasCli'://obtener Listado de Historias Clinicas
                                    if ($method=="POST"){
                                        $listaHistoriasCli = new historiasCliControl();
                                        $responseLista=$listaHistoriasCli->obtenerListaHistoriasCli();
                                        $this->response(200,$responseLista); //status - 400
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;    
                                    
                                case 'obtenerCIE'://obtener Listado de CIE10
                                    if ($method=="GET"){
                                        $listaCIE = new consultasControl();
                                        $responseLista=$listaCIE->obtenerListaCIE();
                                        $this->response(200,$responseLista); //status - 400
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break; 
                                case 'obtenerListadoCIE':// hacer la busqueda del CIE10
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->busquedaCIE();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;
                                case 'insertarDatoCronologicas'://inserta datos cronologicas
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->insertarDatosCronologicas();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;                                     
                                case 'obtenerCronologiaEdit':
                                     if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->obtenerUnDatoCronologicas();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;    
                                case 'obtenerEmpresasUsuario'://obtener Listado de Centros Salud
                                    if ($method=="POST"){
                                        $listaEmpresas = new empresasControl();
                                        $responseLista = $listaEmpresas->obtenerListaEmpresasUsuario();
                                        $this->response(200,$responseLista);
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                case 'obtenerAntropEvaluc'://obtener Listado Antropometricos y Evaluacion nutricional
                                    if ($method=="POST"){
                                        $antropEvaluc = new antropom_EvaluacionControl();
                                        $responseLista=$antropEvaluc->obtenerListaAntropEvalua();
                                        $this->response(200,$responseLista);
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                case 'obtenerUnidadesSalud'://obtener Listado de Centros Salud
                                    if ($method=="POST"){
                                        $listaUnidades = new unidadesSaludControl();
                                        $responseLista = $listaUnidades->obtenerListaUnidades();
                                        $this->response(200,$responseLista);
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                case 'borrarDatoAntropom'://Para borrar el dato antropometrico
                                    if ($method=="POST"){
                                        $evalNut = new antropom_EvaluacionControl();
                                        $responseLista = $evalNut->borrarDatoApromoetrico();
                                        $this->response(200,$responseLista);
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                case 'obtenerCronologiaPaciente'://obtener la cronologia de un paciente
                                    if ($method=="POST"){
                                        $obtCronologias = new cronologPacienteControl();
                                        $responseLista = $obtCronologias->obtenerListaCronologia();
                                        $this->response(200,$responseLista);
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;    
                                case 'editarDatoCronologicas'://editar la cronologia de un paciente
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->editarDatosCronologicas();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;        
                                    
                                case 'BorrarCronologia'://borrar la cronologia de un paciente
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->borrarCronologicas();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break; 
                                case 'SellarCronologia'://sellar la cronologia de un paciente
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->sellarCronologia();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break; 
                                case 'SellarAntropometrico'://sellar la antropometria de un paciente
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->sellarAntropometrico();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break; 
                                case 'ListaSolicitudes': //mostrar la lista de solicitudes de medicos
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->ListarSolicitudes();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;                                 
                                case 'AprobarMedico': //aprobar o rechazar medico
                                    if ($method=="POST"){
                                        $consCtl = new consultasControl();
                                        $responseCons=$consCtl->AprobarMedico();
                                        $this->response(200,$responseCons); 
                                    }
                                    else{
                                        $responseCons["error"] = "true";
                                        $responseCons["status"] = "error";
                                        $responseCons["message"] = "Método NO soportado";
                                        $this->response(200,$responseCons); //status - 405
                                    }
                                    break;     
                                    
                                    
                                /*********************/
                                case 'obtenerListaUsuarios'://obtener la lista usuarios
                                    if ($method=="GET"){
                                        $usuariosCtrl = new usuariosControl();
                                        $responseLista = $usuariosCtrl->obtenerListaUsuarios();
                                        $this->response(200,$responseLista);
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                case 'grabarUsuario'://obtener la lista usuarios
                                    if ($method=="POST"){
                                        $usuarioCtrl = new usuariosControl();
                                        $responseLista = $usuarioCtrl->grabarUsuario();
                                        $this->response(200,$responseLista);
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                case 'borrarUsuario'://obtener la curva de Peso
                                    if ($method=="POST"){
                                        $userCtl = new usuariosControl();
                                        $responseLista = $userCtl->borrarUsuario();
                                        $this->response(200,$responseLista);
                                    }
                                    else{
                                        $responseLista["error"] = "true";
                                        $responseLista["status"] = "error";
                                        $responseLista["message"] = "Método NO soportado";
                                        $this->response(200,$responseLista); //status - 405
                                    }
                                    break;
                                /*********************/
                                default://metodo NO soportado
                                    $responseLogin["error"] = "true";
                                    $responseLogin["status"] = "error";
                                    $responseLogin["message"] = "Método NO soportado";
                                    $this->response(200,$responseLogin); //status - 405
                                    break;
                                //
                            }
                        }
                    } else {
                        // api key is missing in header
                        $responseLogin["error"] = "true";
                        $responseLogin["status"] = "error";
                        $responseLogin["message"] = "Falta token de autorización";
                        $this->response(200,$responseLogin); //status - 401
                    }
                    break;   

            }
        } catch(Exception $e) {
            $responseLogin["error"] = "true";
            $responseLogin["status"] = "error";
            $responseLogin["message"] = ".$e->getMessage().";
            $this->response(200,$responseLogin); //status - 405
        }
    }                                   
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                
                                
                                    
                                    
                                   
    
    
    
    
    
    
    
    
    /**
     * función que segun el valor de "action" e "id":
     *  - mostrara una array con todos los registros de personas
     *  - mostrara un solo registro 
     *  - mostrara un array vacio
    */
    function getUsuarios(){
        $db = new UsuariosDB();
        if(isset($_GET['id'])){//muestra 1 solo registro si es que existiera ID                 
            $response = $db->getUsuario($_GET['id']);                
            echo json_encode($response,JSON_PRETTY_PRINT);
        }else{ //muestra todos los registros                   
            $response = $db->getUsuarios();              
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }       
    
    /**
    * Respuesta al cliente
    * @param int $code Codigo de respuesta HTTP
    * @param String $status indica el estado de la respuesta puede ser "success" o "error"
    * @param String $message Descripcion de lo ocurrido
    */
    function response($code=200,$responseRest) {
        //objeto que maneja los respuestas
       $rest = new simpleRest();
       //setea el codigo de respuesta
       $rest->setHttpResponseCode($code);
       //objeto que maneja las codificaciones/descodificaciones
       $request = new requestRestHandler();
           
       
       //obtiene el body
        if(API_DATA_ENCRYPTION_OUTPUT){
            //codifica el foramtoJSON y lo pasa a base64
            $respuesta["dat"]=encrypt(API_ENCRIPT_KEY,($request->encodeJson($responseRest)));
            echo $request->encodeJson($respuesta);
            return;
        }
                                
        //codifica la respuetsa en formato Json
        echo $request->encodeJson($responseRest);
    }
    
    
    
}//end class
?>
