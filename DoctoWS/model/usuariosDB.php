<?php
//Inclusion de clases para interactuar con MariaDB

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of NutrizyDB
 *
 * @author Carmen Tacuri
 */

class usuariosDB {
    //obtiene los datos de la conexion a MariaDB
       
    /**
     * Constructor de clase
     */
    public function __construct() {           
    } 
    
    /**
     * obtiene un solo registro dado su ID
     * @param int $id identificador unico de registro
     * @return Array array con los registros obtenidos de la base de datos
     */
    
    function getUsuario($id=0) {
        $sql = "SELECT id_usuario,cedula_usuario,nombres_usuario,apellidos_usuario,sexo_usuario,email_usuario,cargo_usuario,username_usuario,administrador,estado_usuario FROM ".db.".Usuario WHERE username_usuario='".$id."';";
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  

            //$stmt->execute();
            $user = $stmt->fetch();  

            if(!empty($user['id_usuario'])){ //Evalúas $data directamente
                $dbCon = null;
                $usuario["id_usuario"]=utf8_encode($user['id_usuario']);
                $usuario["cedula_usuario"]=utf8_encode($user['cedula_usuario']);
                $usuario["nombres_usuario"]=utf8_encode($user['nombres_usuario']);
                $usuario["apellidos_usuario"]=utf8_encode($user['apellidos_usuario']);
                $usuario["sexo_usuario"]=utf8_encode($user['sexo_usuario']);
                $usuario["email_usuario"]=utf8_encode($user['email_usuario']);
                $usuario["cargo_usuario"]=utf8_encode($user['cargo_usuario']);
                $usuario["username_usuario"]=utf8_encode($username);
                $usuario["administrador"]=utf8_encode($user['administrador']);
                $usuario["estado_usuario"]=utf8_encode($user['estado_usuario']);
                //$tipousuario["usuario"]=$usuario;
                return json_encode($usuario,JSON_PRETTY_PRINT); 
            } else {
                $dbCon = null;
                return '{"error":"clave inválida"}'; 
            }
        } catch(PDOException $e) {
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    }
    
    /**
     * obtiene todos los registros de la tabla "usuarios"
     * @return Array array con los registros obtenidos de la base de datos
     */
      
    function obtenerListaUsuarios() {
        $sql = "SELECT id_usuario,cedula_usuario,nombres_usuario,apellidos_usuario,sexo_usuario,email_usuario,cargo_usuario,username_usuario,administrador,estado_usuario FROM ".db.".Usuario WHERE estado_usuario=1;";
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($user = $stmt->fetch()) {
                
                $usuario["id_usuario"]=utf8_encode($user['id_usuario']);
                $usuario["cedula_usuario"]=utf8_encode($user['cedula_usuario']);
                $usuario["nombres_usuario"]=utf8_encode($user['nombres_usuario']);
                $usuario["apellidos_usuario"]=utf8_encode($user['apellidos_usuario']);
                $usuario["sexo_usuario"]=utf8_encode($user['sexo_usuario']);
                $usuario["email_usuario"]=utf8_encode($user['email_usuario']);
                $usuario["cargo_usuario"]=utf8_encode($user['cargo_usuario']);
                $usuario["username_usuario"]=utf8_encode($user['username_usuario']);
                $usuario["administrador"]=utf8_encode($user['administrador']);
                $usuario["estado_usuario"]=utf8_encode($user['estado_usuario']);
                //$tipousuario["usuario"]=$usuario;
                
                
                $fila = json_encode($user,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
            //elimiar la primera coma
            $lista = substr($lista,2);
            //cirra la conexion
            $dbCon = null;
            //retorna lista json de neonatos
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }    
        
        
                
        
        
        
    }
    
    
    function grabarUsuario($Cedula,$Sexo,$Username,$Nombres,$Apellidos,$Email,$Cargo,$Clave,$Admin,$Estado) {
        
                try {
                    
                    $dbCon = getConnection();
        
                    $sql = "SELECT AUTO_INCREMENT AS ID FROM information_schema.tables WHERE table_name = 'Usuario' AND table_schema = DATABASE();";
                    //Obtiene el Id autogenerado
                    $stmt = $dbCon->query($sql);
                    
                    $respuesta='last id=';
                    $Id = 0;
                    
                    while ($row = $stmt->fetch()) {
                        $Id=$row[0];
                    }
                    
                    $sql1 =  " INSERT INTO ".db.".Usuario (cedula_usuario,nombres_usuario,apellidos_usuario,sexo_usuario,email_usuario,cargo_usuario,username_usuario,clave_usuario,administrador,estado_usuario) ".
                             " VALUES('".$Cedula."','".$Nombres."','".$Apellidos."','".$Sexo."','".$Email."','".$Cargo."','".$Username."',SHA('".$Clave."'),".$Admin.",".$Estado.");";
        
                   
                    
                    $dbCon->beginTransaction();
                    $dbCon->exec($sql1);  
                    
                    if($Id!=0){                    
                            $sql2 =  " INSERT INTO ".db.".Usuarios_CentroSalud (Id_CentroSalud,id_usuario) ".
                                     " VALUES(1,".$Id.");";
                        $dbCon->exec($sql2);  
                        
                        $dbCon->commit();
                        $respuesta = '{"exec":"OK"}'; 
                    }
                    else
                    {
                        $respuesta = '{"exec":"error - No Id"}'; 
                        $dbCon->rollback();
                    }
                    
                    $dbCon = null;
                    //retorna lista json de neonatos
                    return $respuesta;
                } catch(Exception $e) {
                    
                    if ($dbCon->inTransaction()) {
                        $dbCon->rollback();
                        // If we got here our two data updates are not in the database
                    }
                    //throw $e;
                    $dbCon = null;
                    return '{"error":"'. $e->getMessage() .'"}'; 
                }
        
    }
    
    function borrarUsuario($Cedula,$Id,$Usuario) {
        
        try {

            $dbCon = getConnection();
            
            /*$sql =  " UPDATE Usuario SET Estado_usuario = 0, Usuario_ult_modif ='".$Usuario."', Fecha_ult_modif=NOW() ".
                     " WHERE Cedula = '".$Cedula."' AND Id = ".$Id." ";
            */
            
            $sql =  " UPDATE ".db.".Usuario SET Estado_usuario = 0 ".
                     " WHERE cedula_usuario = '".$Cedula."' AND id_usuario = ".$Id." ";

            $dbCon->beginTransaction();
            $dbCon->exec($sql);  
            $dbCon->commit();
            $respuesta = '{"exec":"OK"}'; 

            //cierra la conexion
            $dbCon = null;
            //retorna lista json de neonatos
            return $respuesta;
        } catch(Exception $e) {

            if ($dbCon->inTransaction()) {
                $dbCon->rollback();
                // If we got here our two data updates are not in the database
            }
            //throw $e;
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
        
    }
    
}
