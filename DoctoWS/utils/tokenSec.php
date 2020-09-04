<?php

/*
 * Licencia de uso libre para el MSP - Derechos de autor: Msc. Carmen Tacuri

 */

/**
 * Description of tokenSec
 *
 * @author Carmen Tacuri
 */
class tokenSec {
    //put your code here
    
    
    public function generateToken($id,$userName){
        // base64 encodes the header json
        
        // get the local secret key
        $secret = API_KEY;

        // Create the token header
        $header = json_encode([
            'typ' => 'JWT',
            'alg' => 'HS256'
        ]);

        $date = new DateTime();
        $date->modify('+'.API_TIMELIFE.' second');
        
        // Create the token payload
        $payload = json_encode([
            'user_id' => $id,
            'username' => $userName,
            'exp' => ($date->format('Y-m-d H:i:s'))
        ]); 


        // Encode Header
        $base64UrlHeader = base64UrlEncode($header);

        // Encode Payload
        $base64UrlPayload = base64UrlEncode($payload);
        
        // Create Signature Hash
        $signature = hash_hmac('sha256', $base64UrlHeader . "." . $base64UrlPayload, $secret, true);
        
        // Encode Signature to Base64Url String
        $base64UrlSignature = base64UrlEncode($signature);
        
        // Create JWT
        $jwt_token = $base64UrlHeader . "." . $base64UrlPayload . "." . $base64UrlSignature;

        //listing the resulted  JWT
        return $jwt_token;
    
    }
    
    public function validateToken($jwt){
        
        // get the local secret key
        $secret = API_KEY;
        
        // split the token
        $tokenParts = explode('.', $jwt);
        $header = base64_decode($tokenParts[0]);
        $payload = base64_decode($tokenParts[1]);
        $signatureProvided = $tokenParts[2];

        $exp_str = json_decode($payload)->exp;
        
        $expiration = new DateTime(json_decode($payload)->exp);
        
        // check the expiration time - note this will cause an error if there is no 'exp' claim in the token
        $date = new DateTime();
        //$tokenExpired = false;
        $tokenExpired = (($expiration->getTimestamp() - $date->getTimestamp()) < 0);

        // build a signature based on the header and payload using the secret
        $base64UrlHeader = base64UrlEncode($header);
        $base64UrlPayload = base64UrlEncode($payload);
        $signature = hash_hmac('sha256', $base64UrlHeader . "." . $base64UrlPayload, $secret, true);
        $base64UrlSignature = base64UrlEncode($signature);

        // verify it matches the signature provided in the token
        $signatureValid = ($base64UrlSignature === $signatureProvided);

        //echo "Header:\n" . $header . "\n";
        //echo "Payload:\n" . $payload . "\n";

        if ($signatureValid) {
            //echo "The signature is valid.\n";
            $firma = 'firma valida';
        } else {
            //echo "The signature is NOT valid\n";
            $firma = 'firma invalida';
        }
        $respToken[]="{}";
        if ($tokenExpired) {
            $respToken["token"]=$jwt;
            $respToken["estado"]="expirado";
            //$respToken["firma"]=$firma;
            $respToken["expira"]=$exp_str;
           // echo "Token has expired.\n";
        } else {
            $respToken["token"]=$jwt;
            $respToken["estado"]="valido";
            //$respToken["firma"]=$firma;
            $respToken["expira"]=$exp_str;
            //echo "Token has not expired yet.\n";
        }
        return $respToken;
    }
    
    /*Generamos Codigo Activacion*/
    function generarCodigoActivacion(){
        try{
            $str = API_ACTIVATION_KEY;
            $tiempo_caducidad = API_ACTIVATION_TIMELIFE;
            $CodigoActivacion ="";
            for($i=0;$i<12;$i++) {
                $CodigoActivacion = $CodigoActivacion.substr($str,rand(0,62),1);
            }
            $date = new DateTime();
            $date->modify('+'.$tiempo_caducidad.' second');

            $responseCodActivacion["Codigo_activacion"] = $CodigoActivacion;
            $responseCodActivacion["Fecha_caducidad_activacion"] = $date->format('Y-m-d');

            return $responseCodActivacion;
        }
        catch(Exception $e){
            $responseCodActivacion["error"] = $e->getMessage();
            return $responseCodActivacion;
        }
    }
    
}
?>