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
    
    
    /**
     * verifica si un ID existe
     * @param string $username nombre usuario unico de registro
     * @return Bool TRUE|FALSE
     */
    public function verificarUsuario($username=''){
        $sql = "SELECT count(*) as existe FROM ".db.".usuariodoctorweb WHERE Login_usuario = '".$username."';";
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);
            $row = $stmt->fetch();
               
            
            //echo $stmt->queryString;
            //echo $row['existe'];
            
            if($row['existe']==1){ //Evalúas $data directamente
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
    
    /**
     * obtiene un solo registro dado su ID
     * @param int $id identificador unico de registro
     * @return Array array con los registros obtenidos de la base de datos
     */
    
    function getAutenticacionUsuario($username='',$clave='') {
        if ($this->verificarUsuario($username)){
            
            //Encripta la clave con mi funcion PHP - para comparar con el valor encriptado en la tabla
            $crypto = new password_encrypt();
            //$clave_encrypt = $crypto->encriptar($clave);
            
            
            $clave_encrypt = $clave;
            $sql = " SELECT usr.id_Usuario, usr.Login_usuario, usr.Correo_electronico, usr.Numero_celular, per.Nombres, per.Apellidos, per.Identificacion_persona ".
                   " FROM usuariodoctorweb usr ".
                           " LEFT JOIN persona per ".
	                     " ON usr.Codigo_persona = per.Codigo_persona ".
                   " WHERE usr.Login_usuario='".$username."' AND  usr.clave_usuario='".$clave_encrypt."' AND usr.Estado_usuario = 1;";
            
            
           
            try {
                $dbCon = getConnection();
                $stmt = $dbCon->query($sql);  
                
                //$stmt->execute();
                
                $user = $stmt->fetch();  
                
                if(!empty($user['id_Usuario'])){ 
                    $dbCon = null;
                    $usuario["id_Usuario"]=utf8_encode($user['id_Usuario']);
                    $usuario["Login_usuario"]=utf8_encode($user['Login_usuario']);
                    $usuario["Correo_electronico"]=utf8_encode($user['Correo_electronico']);
                    $usuario["Numero_celular"]=utf8_encode($user['Numero_celular']);
                    $usuario["Nombres"]=utf8_encode($user['Nombres']);
                    $usuario["Apellidos"]=utf8_encode('Apellidos');                    
                    $usuario["Identificacion_persona"]=utf8_encode($user['Identificacion_persona']);                  

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
