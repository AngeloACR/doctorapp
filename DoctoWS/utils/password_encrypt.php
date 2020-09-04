<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of password_encrypt
 *
 * @author Carmen Tacuri
 */
    

class password_encrypt {
    
    private $clave;
    private $method;
    private $iv;
    
    /**
     * Constructor de clase
     */
    public function __construct() {      
        //Configuración del algoritmo de encriptación
        //Debes cambiar esta cadena, debe ser larga y unica
        //nadie mas debe conocerla
        $this->clave  = API_KEY_PASSWORD;
        //Metodo de encriptación
        $this->method = 'aes-256-cbc';
        // Puedes generar una diferente usando la funcion $getIV()
        $this->iv = base64_decode(API_IV_PASSWORD);
    } 
    
    
    //$iv = $getIV();
     /*
     Encripta el contenido de la variable, enviada como parametro.
      */
     function encriptar($valor) {
         return openssl_encrypt ($valor, $this->method, $this->clave, false, $this->iv);
     }
     /*
     Desencripta el texto recibido
     */
     function desencriptar($valor) {
         //$encrypted_data = base64_decode($valor);
         return openssl_decrypt($valor, $this->method, $this->clave, false, $this->iv);
     }
     /*
     Genera un valor para IV
     */
     function getIV() {
         return base64_encode(openssl_random_pseudo_bytes(openssl_cipher_iv_length($this->method)));
     }
    
}

?>

