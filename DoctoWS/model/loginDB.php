<?php
//Inclusion de clases para interactuar con MariaDB

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once "utils/password_encrypt.php";

/**
 * Description of NutrizyDB
 *
 * @author Carmen Tacuri
 */

class loginDB {
    //obtiene los datos de la conexion a MariaDB
       
    /**
     * Constructor de clase
     */
    public function __construct() {           
    } 
    
    
    public function verificarUsuario($celular=''){
       
        $sql = "SELECT COUNT(*) AS existe FROM ".db.".UsuarioDoctorWeb WHERE Numero_celular = '".$celular."';";
                
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);
            $row = $stmt->fetch();            
            
           
            
            if($row['existe']==1){ 
                $dbCon = null;
                return true;
            } else {
                $dbCon = null;
                return false;
            }
        } catch(PDOException $e) {
            return false;
        }
    }
   
    
    function getAutenticacionUsuario($correo_electronico='', $celular ='', $clave='') {
        if ($this->verificarUsuario($celular)){
            
            //Encripta la clave con mi funcion PHP - para comparar con el valor encriptado en la tabla
            $crypto = new password_encrypt();
           
            
            $sql =" SELECT a.id_Usuario, a.Login_usuario, a.Correo_electronico, a.Numero_celular, a.Login_usuario, b.Nombres, b.Apellidos " .
                    " FROM ".db.".UsuarioDoctorWeb a " .
                    " INNER JOIN ".db.".Persona b " .
                        " ON a.Codigo_persona = b.Codigo_persona " .
                    " WHERE a.Numero_celular= '".$celular."' AND a.Correo_electronico = '".$correo_electronico."' AND a.Clave_usuario = MD5('".$clave."') AND Estado_usuario =1;";
            
                       
            try {
                $dbCon = getConnection();
                $stmt = $dbCon->query($sql);  
                
              
                
                $user = $stmt->fetch();  
                
                if(!empty($user['id_Usuario'])){ 
                    $dbCon = null;
                    $usuario["id_Usuario"]=utf8_encode($user['id_Usuario']);
                    $usuario["Login_usuario"]=utf8_encode($user['Login_usuario']);
                    $usuario["Correo_electronico"]=utf8_encode($user['Correo_electronico']);
                    $usuario["Numero_celular"]=utf8_encode($user['Numero_celular']);
                    $usuario["Nombres"]=utf8_encode($user['Nombres']);
                    $usuario["Apellidos"]=utf8_encode('Apellidos');                    
                    $usuario["Codigo_persona"]=utf8_encode($user['Codigo_persona']);                  

                    return json_encode($usuario,JSON_PRETTY_PRINT); 
                } else {
                    $dbCon = null;
                    return '{"error":"clave inválida"}'; 
                }
            } catch(PDOException $e) {
                return '{"error":"'. $e->getMessage() .'"}'; 
            }
        }
        else{
            return '{"error":"usuario no existe"}'; 
        }
    }
    
    
    
}
