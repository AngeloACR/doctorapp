<?php

/*
 * 

 */

/**
 * 
 *
 * @author Carmen Tacuri
 */
class consultasDB {
    //put your code here
    
    public function __construct() {           
    } 
    
    function obtenerListaPaises() {
        
        $sql = "SELECT Codigo_pais,Nombre_pais, Nombre_corto, Prefijo_telefonico, Estado_pais FROM ".db.".pais WHERE Estado_pais=1;";
        
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($row = $stmt->fetch()) {
                $pais["Codigo_pais"]=utf8_encode($row['Codigo_pais']);
                $pais["Nombre_pais"]=utf8_encode($row['Nombre_pais']);
                $pais["Nombre_corto"]=utf8_encode($row['Nombre_corto']);
                $pais["Prefijo_telefonico"]=utf8_encode($row['Prefijo_telefonico']);
                $pais["Estado_pais"]=utf8_encode($row['Estado_pais']);
                
                $fila = json_encode($pais,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
            //elimiar la primera coma
            //if(!($lista=="")){
                $lista = substr($lista,2);
            //}
            //else{
            //    $lista = "{}";
            //}
            
            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    }
   
    function obtenerListaCIE() {
        
        $sql = "SELECT Codigo_CIE10 as CodigoCIE, TRIM(Codigo_Visible) AS Codigo_Visible, TRIM(Descripcion_CIE10) AS DescripcionCIE  FROM ".db.".CIE10 WHERE Codigo_visible like 'A0%' ORDER BY Codigo_Visible;";
        
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($row = $stmt->fetch()) {
                $pais["CodigoCIE"]=utf8_encode($row['CodigoCIE']);
                $pais["DescripcionCIE"]=utf8_encode($row['Codigo_Visible']).'-->'.utf8_encode($row['DescripcionCIE']);
                                
                $fila = json_encode($pais,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
            //elimiar la primera coma
            //if(!($lista=="")){
                $lista = substr($lista,2);
            //}
            //else{
            //    $lista = "{}";
            //}
            
            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    }
    
    
    function ListarBusquedaCIE10($Criterio, $Valor) {
       
        try {    
            if ($Criterio=="Codigo_Visible"){
                $sql = "select Codigo_CIE10, Codigo_Visible, Descripcion_CIE10 from ".db.".CIE10 where Codigo_Visible like '".$Valor."%';";
            }
            else
            {
                $sql = "select Codigo_CIE10, Codigo_Visible, Descripcion_CIE10 from ".db.".CIE10 where Descripcion_CIE10 like '%".$Valor."%';";
            }   
            
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($row = $stmt->fetch()) {
                $CIE["Codigo_CIE10"]=utf8_encode($row['Codigo_CIE10']);
                $CIE["Codigo_Visible"]=utf8_encode($row['Codigo_Visible']);
                $CIE["Descripcion_CIE10"]=utf8_encode($row['Descripcion_CIE10']);
                                
                $fila = json_encode($CIE,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
           
            $lista = substr($lista,2);
            
            
            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    }
    
    function ListarSolicitudes($Codigo_empresa) {
        
        $sql = " SELECT per_emp_usu.Codigo_usuario, usu.Login_usuario, usu.Nombre_usuario, usu.Correo_electronico, usu.Numero_celular, ".
               " per_emp_usu.Codigo_perfil_usuario, per.Descripcion_perfil_usuario, pers.Codigo_persona, pers.Codigo_profesion , profes.Descripcion_profesion, ".
               " per_emp_usu.Numero_Registro, per_emp_usu.Numero_Registro_MSP , CASE WHEN per_emp_usu.EstValidacion_medico = 0  THEN 'POR APROBAR' WHEN per_emp_usu.EstValidacion_medico = 1 THEN 'APROBADO' WHEN per_emp_usu.EstValidacion_medico = 2 THEN 'RECHAZADO' END AS EstadoValidacion  ".
               " FROM ".db.".perfil_empresa_usuario per_emp_usu ".
               " INNER JOIN ".db.".usuarios usu ".
	               " ON usu.Codigo_Usuario = per_emp_usu.Codigo_usuario ".
               " INNER JOIN ".db.".persona pers ".
	               " ON pers.Codigo_persona = usu.Codigo_persona ".
               " INNER JOIN ".db.".profesiones profes ".
	               " ON pers.Codigo_profesion = profes.Codigo_Profesion ".
               " INNER JOIN ".db.".perfil_usuarios per ".
	               " ON per_emp_usu.Codigo_perfil_usuario = per.Codigo_perfil_usuario ".
               " WHERE Codigo_empresa = ".$Codigo_empresa." AND per_emp_usu.Estado_usuario =1 AND EstValidacion_medico in (0,1,2) AND per.Codigo_perfil_usuario IN (2,3); ";
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($row = $stmt->fetch()) {
                $solicitudes["Codigo_usuario"]=utf8_encode($row['Codigo_usuario']);
                $solicitudes["Login_usuario"]=utf8_encode($row['Login_usuario']);
                $solicitudes["Nombre_usuario"]=utf8_encode($row['Nombre_usuario']);
                $solicitudes["Correo_electronico"]=utf8_encode($row['Correo_electronico']);
                $solicitudes["Numero_celular"]=utf8_encode($row['Numero_celular']);
                $solicitudes["Codigo_perfil_usuario"]=utf8_encode($row['Codigo_perfil_usuario']);
                $solicitudes["Descripcion_perfil_usuario"]=utf8_encode($row['Descripcion_perfil_usuario']);
                $solicitudes["Codigo_persona"]=utf8_encode($row['Codigo_persona']);
                $solicitudes["Codigo_profesion"]=utf8_encode($row['Codigo_profesion']);
                $solicitudes["Descripcion_profesion"]=utf8_encode($row['Descripcion_profesion']);
                $solicitudes["Numero_Registro"]=utf8_encode($row['Numero_Registro']);
                $solicitudes["Numero_Registro_MSP"]=utf8_encode($row['Numero_Registro_MSP']);                
                $solicitudes["EstadoValidacion"]=utf8_encode($row['EstadoValidacion']);
                
                
                
                $fila = json_encode($solicitudes,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
                $lista = substr($lista,2);
            
            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    }
    
    function obtenerListaProvicias($Codigo_pais) {
        
        $sql = "SELECT Codigo_pais, Codigo_provincia, Nombre_provincia FROM ".db.".provincia WHERE codigo_pais =" .$Codigo_pais;
        
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($row = $stmt->fetch()) {
                $provincia["Codigo_pais"]=utf8_encode($row['Codigo_pais']);
                $provincia["Codigo_provincia"]=utf8_encode($row['Codigo_provincia']);
                $provincia["Nombre_provincia"]=utf8_encode($row['Nombre_provincia']);
                $fila = json_encode($provincia,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
            //elimiar la primera coma
            //if(!($lista=="")){
                $lista = substr($lista,2);
            //}
            //else{
            //    $lista = "{}";
            //}
            
            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
    
    function obtenerListaCantones($Codigo_pais, $Codigo_provincia) {
        $sql = "SELECT Codigo_provincia, Codigo_canton, Nombre_canton FROM ".db.".canton WHERE codigo_pais = ".$Codigo_pais. " and codigo_provincia = ".$Codigo_provincia." ORDER BY codigo_canton ASC;";
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($row = $stmt->fetch()) {
                $provincia["Codigo_provincia"]=utf8_encode($row['Codigo_provincia']);
                $provincia["Codigo_canton"]=utf8_encode($row['Codigo_canton']);
                $provincia["Nombre_canton"]=utf8_encode($row['Nombre_canton']);
                $fila = json_encode($provincia,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
            
            $lista = substr($lista,2);
            
            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
      
    function obtenerListaParroquias($Codigo_pais, $Codigo_provincia, $Codigo_canton) {
        $sql = "SELECT Codigo_provincia, Codigo_canton, Codigo_parroquia,  Nombre_parroquia FROM  ".db.".parroquia WHERE codigo_pais = ".$Codigo_pais." AND codigo_provincia=".$Codigo_provincia." AND codigo_canton = ".$Codigo_canton." ORDER BY codigo_parroquia ASC;";
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($row = $stmt->fetch()) {
                $unidad["Codigo_provincia"]=utf8_encode($row['Codigo_provincia']);
                $unidad["Codigo_canton"]=utf8_encode($row['Codigo_canton']);
                $unidad["Codigo_parroquia"]=utf8_encode($row['Codigo_parroquia']);
                $unidad["Nombre_parroquia"]=utf8_encode($row['Nombre_parroquia']);
                $fila = json_encode($unidad,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
            
            $lista = substr($lista,2);
            
            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
    
    function obtenerListaUnidades($Codigo_pais, $Codigo_provincia, $Codigo_canton, $Codigo_parroquia) {
        $sql = "SELECT Codigo_provincia, Codigo_canton, Codigo_parroquia, Codigo_unidad_salud, Nombre_unidad_salud FROM ".db.".unidad_salud WHERE codigo_pais = ".$Codigo_pais. " AND codigo_provincia=".$Codigo_provincia." AND codigo_canton = ".$Codigo_canton." and codigo_parroquia = ".$Codigo_parroquia." ORDER BY codigo_unidad_salud ASC;";
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($row = $stmt->fetch()) {
                $unidad["Codigo_provincia"]=utf8_encode($row['Codigo_provincia']);
                $unidad["Codigo_canton"]=utf8_encode($row['Codigo_canton']);
                $unidad["Codigo_parroquia"]=utf8_encode($row['Codigo_parroquia']);
                $unidad["Codigo_unidad_salud"]=utf8_encode($row['Codigo_unidad_salud']);
                $unidad["Nombre_unidad_salud"]=utf8_encode($row['Nombre_unidad_salud']);
                $fila = json_encode($unidad,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
            
            $lista = substr($lista,2);
            
            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
    
    
    function obtenerListaProfesiones() {
        
        $sql = "SELECT Codigo_profesion, Descripcion_profesion, Codigo_categoria_profesion FROM ".db.".profesiones;";
        
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($row = $stmt->fetch()) {
                $pais["Codigo_profesion"]=utf8_encode($row['Codigo_profesion']);
                $pais["Descripcion_profesion"]=utf8_encode($row['Descripcion_profesion']);
                $pais["Codigo_categoria_profesion"]=utf8_encode($row['Codigo_categoria_profesion']);
                
                
                $fila = json_encode($pais,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
            //elimiar la primera coma
            //if(!($lista=="")){
                $lista = substr($lista,2);
            //}
            //else{
            //    $lista = "{}";
            //}
            
            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    }
    
        function obtenerCedulaHC($Cedula) {
                
        $sql = " SELECT Id_Centro_Salud, Centro_Salud_Asignado, Nombre_unidad_salud, Direccion_unidad_salud, ".
                " f.Nombre_parroquia, e.Nombre_canton, d.Nombre_provincia, c.Nombre_pais, Numero_Historia_clinica, Codigo_persona ".
                " FROM ".db.".historia_clinica a ". 
                " INNER JOIN ".db.".unidad_salud b ". 
	        "   ON b.Codigo_unidad_salud = a.Id_Centro_Salud ". 
                " INNER JOIN ".db.".pais c ". 
	        "   ON b.Codigo_pais = c.Codigo_pais ". 
                " INNER JOIN ".db.".provincia d ". 
                "   	ON b.Codigo_pais =d.codigo_pais  AND b.codigo_provincia = d.codigo_provincia ". 
                " INNER JOIN ".db.".canton e ". 
                "   	ON b.Codigo_pais =e.codigo_pais AND b.codigo_provincia = e.codigo_provincia  AND b.codigo_canton = e.codigo_canton ". 
                " INNER JOIN ".db.".parroquia f ". 
	        "   ON b.Codigo_pais =f.codigo_pais AND b.codigo_provincia = f.codigo_provincia  AND b.codigo_canton = f.codigo_canton AND  b.codigo_parroquia = f.codigo_parroquia ". 
                " WHERE Numero_Identificacion = '".$Cedula."' AND  Centro_Salud_Asignado =1; ";
      
      
        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            
            $lista="";
            
            while ($row = $stmt->fetch()) {
                $CedulaEnHC["Id_Centro_Salud"]=utf8_encode($row['Id_Centro_Salud']);
                $CedulaEnHC["Centro_Salud_Asignado"]=utf8_encode($row['Centro_Salud_Asignado']);
                $CedulaEnHC["Nombre_unidad_salud"]=utf8_encode($row['Nombre_unidad_salud']);
                $CedulaEnHC["Direccion_unidad_salud"]=utf8_encode($row['Direccion_unidad_salud']);
                $CedulaEnHC["Nombre_parroquia"]=utf8_encode($row['Nombre_parroquia']);
                $CedulaEnHC["Nombre_canton"]=utf8_encode($row['Nombre_canton']);
                $CedulaEnHC["Nombre_provincia"]=utf8_encode($row['Nombre_provincia']);
                $CedulaEnHC["Nombre_pais"]=utf8_encode($row['Nombre_pais']);
                $CedulaEnHC["Numero_Historia_clinica"]=utf8_encode($row['Numero_Historia_clinica']);
                $CedulaEnHC["Codigo_persona"]=utf8_encode($row['Codigo_persona']);
                              
                
                $fila = json_encode($CedulaEnHC,JSON_PRETTY_PRINT); 
                $lista = $lista."||".$fila;
            
            }
            
            $lista = substr($lista,2);
            
            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
    
    function obtenerListaTipoIdentificacion($cod_pais) {

        $sql = "SELECT Codigo_pais,Codigo_tipo_identificacion, Descripcion_tipo_identificacion, Abreviacion_tipo_identificacion, Estado_tipo_identificacion FROM ".db.".tipo_identificacion WHERE Estado_tipo_identificacion=1 AND Codigo_pais = ".$cod_pais.";";

        try {
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  

            $lista="";

            while ($row = $stmt->fetch()) {
                $tipo_identif["Codigo_pais"]=utf8_encode($row['Codigo_pais']);
                $tipo_identif["Codigo_tipo_identificacion"]=utf8_encode($row['Codigo_tipo_identificacion']);
                $tipo_identif["Descripcion_tipo_identificacion"]=utf8_encode($row['Descripcion_tipo_identificacion']);
                $tipo_identif["Abreviacion_tipo_identificacion"]=utf8_encode($row['Abreviacion_tipo_identificacion']);
                $tipo_identif["Estado_tipo_identificacion"]=utf8_encode($row['Estado_tipo_identificacion']);

                //$fila = json_encode($tipo_identif,JSON_PRETTY_PRINT);
                $fila = json_encode($tipo_identif);
                
                if(!($lista=="")){
                    $lista = $lista."||".$fila;
                }
                else{
                    $lista = $fila;
                }

            }
            //elimiar la primera coma
            //if(!($lista=="")){
                //$lista = substr($lista,2);
            //}
            //else{
            //    $lista = "{}";
            //}

            //cierra la conexion
            $dbCon = null;
            //retorna lista json de paises
            return $lista; 
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    }
    
    /***********************************
     * Funciones para inserccion , edicion y eliminacion de registros en la Base de datos
     ***********************************/
    
     function insertarHC($Cedula, $Persona, $CentroSalud) {
        try {
            //Obtiene el maximo de la tabla de Historias Clinicas
            $sql = " SELECT (IFNULL(MAX(Numero_Historia_clinica),0)+1) AS Siguiente FROM ".db.".historia_clinica;";
            
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            $lista1="";
            while ($row = $stmt->fetch()) {
                $Siguiente["Siguiente"]=utf8_encode($row['Siguiente']);               
            }
            
            $dbCon = null;
            
            //Inserta la Historia clinica y le asigna al Centro de Salud
            $sql = " INSERT ".db.".historia_clinica (Numero_Historia_clinica, Numero_Identificacion,Codigo_persona,Id_Centro_Salud,Centro_Salud_Asignado) ".
                   " VALUES (".$Siguiente["Siguiente"].",'".$Cedula."', ".$Persona.", ".$CentroSalud.", 1)";
            try
            {
                $dbCon = getConnection();
                $stmt = $dbCon->query($sql);  
                
                return "InsertadoHC"; 
            } 
            catch(PDOException $errInsertarHC) {
                $dbCon = null;
                return '{"error":"'. $errInsertarHC->getMessage() .'"}'; 
            }            
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }  
    
    function editarHC($Cedula, $Persona, $CentroSalud) {
        
        //Actualiza la Historia clinica desasignadola de todos los  Centro de Salud
        try
        {
            $sql = " UPDATE ".db.".historia_clinica SET Centro_Salud_Asignado =0 WHERE Codigo_persona = ".$Persona." AND Numero_Identificacion ='".$Cedula."';";                   
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            $dbCon = null;
        }    
        catch(PDOException $errInsertarHC) {
            $dbCon = null;
            return '{"error":"'. $errDesasignadoHC->getMessage() .'"}'; 
        }  
        
        //Consulta si la historia clinica ha sido creada alguna vez en el centro de salud 
        try {
            $sql = " SELECT COUNT(*) AS Contador FROM ".db.".historia_clinica WHERE Codigo_persona = ".$Persona." AND Numero_Identificacion = '".$Cedula."' AND Id_Centro_Salud = ".$CentroSalud."; ";
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            $lista1="";
            while ($row = $stmt->fetch()) {
                $Contador["Contador"]=utf8_encode($row['Contador']);               
            }
            if ($Contador["Contador"]==0){
                $Operacion = "Adicionar";
            }
            else
            {
                $Operacion = "Editar";
            }            
            $dbCon = null;
           
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error al consultar si la historia clinica ha sido creada alguna vez en el centro de salud":"'. $e->getMessage() .'"}'; 
        }
        
        //Adiciona o Edita la historia clinica asignadole al centro de salud enviado por el usuario
        switch ($Operacion) {
            case  "Adicionar":
                {
                    try
                    {
                        
                        //Obtiene el máximo de la tabla de Historias Clinicas
                        $sql = " SELECT (IFNULL(MAX(Numero_Historia_clinica),0)+1) AS Siguiente FROM ".db.".historia_clinica;";
                        $dbCon = getConnection();
                        $stmt = $dbCon->query($sql);  
                        
                        $lista1="";
                        while ($row = $stmt->fetch()) {
                            $Siguiente["Siguiente"]=utf8_encode($row['Siguiente']);               
                        }
                        $dbCon = null; 
                        
                        $sql1 = " INSERT ".db.".historia_clinica (Numero_Historia_clinica, Numero_Identificacion,Codigo_persona,Id_Centro_Salud,Centro_Salud_Asignado) ".
                                " VALUES (".$Siguiente["Siguiente"].",'".$Cedula."', ".$Persona.", ".$CentroSalud.", 1)";
                        $dbCon = getConnection();
                        $stmt = $dbCon->query($sql1);  
                     
                        $dbCon = null;
                        
                        return "EditadoHC";
                    }    
                    catch(PDOException $errInsertarHC) {
                        $dbCon = null;
                        return '{"error al editar asignandole al nuevo centro de salud":"'. $errDesasignadoHC->getMessage() .'"}'; 
                    }                      
                }
                break;
            case "Editar":
                {
                    try
                    {
                        //Actualiza la HC asignandole el centro de salud enviado por el usuario
                        $sql1 = " UPDATE ".db.".historia_clinica SET Centro_Salud_Asignado =1 ".
                                " WHERE Codigo_persona = ".$Persona." AND Numero_Identificacion = '".$Cedula."' AND Id_Centro_Salud = ".$CentroSalud."; ";
                        $dbCon = getConnection();
                        $stmt = $dbCon->query($sql1);  
                        $dbCon = null;
                        
                        return "EditadoHC";
                    }    
                    catch(PDOException $errInsertarHC) {
                        $dbCon = null;
                        return '{"error al editar la Historia Clinica activandole centro de salud":"'. $errDesasignadoHC->getMessage() .'"}'; 
                    }                
                }
                break;
            
        }
        
        
    
    }
    
    function insertarDatAntro ($Cedula, $Persona, $FechaToma, $Peso,$Talla,$CircunfeAbdominal, $Temperatura,$IMC, $P_sistolica, $P_Diastolica, $PocentGrasa, $ContorCintura, $PorcenMusculo, $PorcGrasViseral, $FrecCardiaca,  $FrecRespiratoria,  $Glicemia, $Otro, $Usuario) {
        try {
            
             //Obtener la hora actual para insertar
            $dbCon = getConnection();
            $sql3 = " SELECT CAST(TIME (NOW())  AS CHAR) AS hora;";
            
            $stmt3 = $dbCon->query($sql3);  
            $lista="";
            while ($rowN = $stmt3->fetch()) {
                $Hora=utf8_encode($rowN['hora']);               
            }
            
            $FechaHoraToma= $FechaToma." ".$Hora;
            
            //Inserta el dato Antropometrico 
            $sql = " INSERT ".db.".datos_antropometricos (Codigo_persona,Numero_Identificacion, Fecha_hora_toma, Peso_Kg, ".
                " Talla_Mts, Circunferencia_abdominal, Temperatura, IMC,Presion_arterial_sistolica, Presion_arterial_distolica, ".
                " Porcentaje_grasa, Contorno_cintura, Porcentaje_musculo, Porcentaje_grasa_viseral, Frecuencia_cardiaca, ".
                " Frecuencia_respiratoria, Glicemia, Otro, Estado_datoantropom, Fecha_creacion, Usuario_creacion, Fecha_ult_modif, Usuario_ult_modif, Sellado) ".
                " VALUES (".$Persona.",'".$Cedula."','".$FechaHoraToma."', ".$Peso.",".$Talla.",".$CircunfeAbdominal.",".$Temperatura.",".$IMC.",".
                $P_sistolica.",".$P_Diastolica.",".$PocentGrasa.",".$ContorCintura.",".$PorcenMusculo.",".$PorcGrasViseral.",".$FrecCardiaca.",".$FrecRespiratoria.",".$Glicemia.",'".$Otro."', 1, NOW(),'".$Usuario."', NOW(),'".$Usuario."', 'N');";
             
             
            try
            {
                
                $stmt = $dbCon->query($sql);  
                
                return "InsertadoDatAntr"; 
                        
            } 
            catch(PDOException $errInsertadoDatAntr) {
                $dbCon = null;
                return '{"error":"'. $errInsertadoDatAntr->getMessage() .'"}'; 
            }            
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
    
    function editarDatAntro ($Cedula, $Persona, $FechaToma, $Peso,$Talla,$CircunfeAbdominal, $Temperatura,$IMC, $P_sistolica, $P_Diastolica, $PocentGrasa, $ContorCintura, $PorcenMusculo, $PorcGrasViseral, $FrecCardiaca,  $FrecRespiratoria,  $Glicemia, $Otro, $Usuario) {
        try {
            $dbCon = getConnection();
            //Edita el dato Antropometrico 
            $sql = " UPDATE ".db.".datos_antropometricos ".
                   " SET Peso_Kg =".$Peso.", Talla_Mts =".$Talla.", Circunferencia_abdominal =".$CircunfeAbdominal.", Temperatura =".$Temperatura.", IMC = ".$IMC.", Presion_arterial_sistolica = ".$P_sistolica.", Presion_arterial_distolica =".$P_Diastolica.", ".
                   " Porcentaje_grasa =".$PocentGrasa.", Contorno_cintura=".$ContorCintura.", Porcentaje_musculo=".$PorcenMusculo.", Porcentaje_grasa_viseral=".$PorcGrasViseral.", Frecuencia_cardiaca=".$FrecCardiaca.",  ".
                   " Frecuencia_respiratoria =".$FrecRespiratoria.", Glicemia=".$Glicemia.", Otro='".$Otro."', Fecha_ult_modif = NOW() , Usuario_ult_modif = '".$Usuario."'".
                   " WHERE Codigo_persona =".$Persona." AND Numero_Identificacion ='".$Cedula."' AND  Fecha_hora_toma= '".$FechaToma."';";
            try
            {

                $stmt = $dbCon->query($sql);  
                
                return "EditadoDatAntr"; 
            } 
            catch(PDOException $errInsertadoDatAntr) {
                $dbCon = null;
                return '{"error":"'. $errInsertadoDatAntr->getMessage() .'"}'; 
            }            
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
    
    
    function insertarCronologias ($Cedula, $Persona, $FechaToma, $Motivo, $Anamnesis, $Exploracion, $Diagnostico , $Actuacion, $codigo_usuario, $Codigo_CIE, $CodigoPlan) {
        try {
            //Obtiene el maximo de la tabla de Cronologicas
            $sql = " SELECT (IFNULL(MAX(Id_unico_cronologica),0)+1) AS Siguiente FROM ".db.".cronologica;";
            
            $dbCon = getConnection();
            $stmt = $dbCon->query($sql);  
            $lista1="";
            while ($row = $stmt->fetch()) {
                $Siguiente["Siguiente"]=utf8_encode($row['Siguiente']);                
            }
            
            //$dbCon = null;
            
            //Verificar si existen cronologicas del usuario
             //Obtiene el numero de visita al profesional de la tabla de Cronologicas
            $sql2 = " SELECT COUNT(*) AS ExistenCronologicas FROM ".db.".cronologica WHERE codigo_usuario = ".$codigo_usuario.";";
            //$dbCon1 = getConnection();
            $stmt2 = $dbCon->query($sql2);  
            $lista="";
            while ($rowN = $stmt2->fetch()) {
                $ExistenCronologicas=utf8_encode($rowN['ExistenCronologicas']);               
            }
            
            
            if($ExistenCronologicas){
            
            
                //Obtiene el numero de visita al profesional de la tabla de Cronologicas
                $sql1 = " SELECT IFNULL(MAX(Nro_visita),0) AS Nro_visita FROM ".db.".cronologica WHERE codigo_usuario = ".$codigo_usuario.";";
                //$dbCon1 = getConnection();
                $stmt1 = $dbCon->query($sql1);  
                $lista="";
                while ($rowN = $stmt1->fetch()) {
                    $NroVisitaProf["Nro_visita"]=utf8_encode($rowN['Nro_visita']);               
                }

            }
            else
            {
                $NroVisitaProf["Nro_visita"]="1";
            }
            
            //Obtener la hora actual para insertar
            
            $sql3 = " SELECT CAST(TIME (NOW())  AS CHAR) AS hora;";
            //$dbCon1 = getConnection();
            $stmt3 = $dbCon->query($sql3);  
            $lista="";
            while ($rowN = $stmt3->fetch()) {
                $Hora=utf8_encode($rowN['hora']);               
            }
            
            $FechaHoraToma= $FechaToma." ".$Hora;
            
            //Inserta la Cronologicas 
            $sql = " INSERT ".db.".cronologica (id_plan_tratamiento, codigo_persona, numero_identificacion, codigo_plan, codigo_usuario,  ".
                   " Nro_visita, Fecha_incio_ejecutada_visita, Fecha_fin_ejecutada_visita, Motivo, Anamnesis, Exploracion, Diagnostico, Indicaciones, Codigo_CIE, Id_unico_cronologica, Sellado)  ".
                   " VALUES (1,".$Persona.",'".$Cedula."', ".$CodigoPlan." , ".$codigo_usuario.",".$NroVisitaProf["Nro_visita"].",'".$FechaHoraToma."', '".$FechaHoraToma."', '".$Motivo."', '".$Anamnesis."','".$Exploracion."', '".$Diagnostico."' , '".$Actuacion."', ".$Codigo_CIE.",".$Siguiente["Siguiente"].", 'N');";
                                
            
            
            try
            {
                $dbCon = getConnection();
                $stmt = $dbCon->query($sql);  
                
             return "InsertadoCronologicas"; 
            } 
            catch(PDOException $errinsertarCronologias) {
                $dbCon = null;
                return '{"error":"'. $errinsertarCronologias->getMessage() .'"}'; 
            }            
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
    
    
    function obtenerUnDatoCronologica($Cedula, $Persona, $Id_unico_cronologica) {
        
        $sql =  " SELECT cro.Codigo_persona, cro.Numero_identificacion, per.Nombres, per.Apellidos,  DATE_FORMAT(per.Fecha_Nacimiento,'%Y %m %d') AS Fecha_Nacimiento , per.Correo_electronico, ".  
                " per.Celular, CASE WHEN per.Sexo = 0 THEN 'Masculino' WHEN per.Sexo =1 THEN 'Femenino' END AS Sexo, ".
                " per.Codigo_profesion, prof.Descripcion_profesion, cro.Codigo_plan, plan.Descripcion_plan, cro.Codigo_usuario, medico.Nombres AS NomMedico, medico.Apellidos AS ApeMedico, medico.Codigo_profesion AS Codigo_profesionProfesional, profPersonal.Descripcion_profesion AS Descrip_profesionProfesional, cro.Nro_visita, ".
                " cro.Fecha_incio_ejecutada_visita , cro.Fecha_fin_ejecutada_visita, cro.Motivo, cro.Anamnesis, cro.Exploracion, cro.Diagnostico, cro.Indicaciones, cro.Codigo_CIE, cie10.Descripcion_CIE10, cie10.Codigo_Visible, cro.Id_unico_cronologica ".
                " FROM ".db.".cronologica cro ".
                " INNER JOIN ".db.".persona per   ".
	                " ON cro.Codigo_persona = per.Codigo_persona  ".
                " INNER JOIN ".db.".profesiones prof  ".
	                " ON prof.codigo_profesion = per.codigo_profesion ".	
                " INNER JOIN ".db.".plan_persona planPer   ".
	                " ON per.Codigo_persona = planPer.Codigo_Persona  ".
	                " AND cro.codigo_plan =  planPer.codigo_plan ".
                " INNER JOIN ".db.".planes_medicos plan   ".
	                " ON plan.Codigo_plan = planPer.Codigo_plan ".
                " INNER JOIN ".db.".usuarios usu ".
	                " ON usu.Codigo_Usuario = cro.codigo_usuario ".
                " INNER JOIN ".db.".persona medico ".
	                " ON medico.Codigo_persona = usu.Codigo_persona ".
                " INNER JOIN ".db.".profesiones profPersonal  ".
                        " ON profPersonal.codigo_profesion = medico.codigo_profesion ".
                " INNER JOIN ".db.".CIE10 cie10 ".
	                " ON cie10.Codigo_CIE10 = cro.Codigo_CIE ".
                " WHERE cro.Codigo_persona = ".$Persona." AND cro.numero_identificacion = '".$Cedula."' and cro.Id_unico_cronologica = ".$Id_unico_cronologica." ORDER BY Fecha_incio_ejecutada_visita DESC ;";

        
                try {
                           
                        $dbCon = getConnection();
                        $stmt = $dbCon->query($sql);  

                        $lista="";

                        while ($row = $stmt->fetch()) {                            
                            $Cronologia["Id_unico_cronologica"]=utf8_encode($row['Id_unico_cronologica']);
                            $Cronologia["Codigo_persona"]=utf8_encode($row['Codigo_persona']);
                            $Cronologia["Numero_identificacion"]=utf8_encode($row['Numero_identificacion']);
                            $Cronologia["Nombres"]=utf8_encode($row['Nombres']);
                            $Cronologia["Apellidos"]=utf8_encode($row['Apellidos']);
                            $Cronologia["Fecha_Nacimiento"]=utf8_encode($row['Fecha_Nacimiento']);
                            $Cronologia["Correo_electronico"]=utf8_encode($row['Correo_electronico']);
                            $Cronologia["Celular"]=utf8_encode($row['Celular']);
                            $Cronologia["Sexo"]=utf8_encode($row['Sexo']);
                            $Cronologia["Codigo_profesion"]=utf8_encode($row['Codigo_profesion']);
                            $Cronologia["Descripcion_profesion"]=utf8_encode($row['Descripcion_profesion']);
                            $Cronologia["Codigo_plan"]=utf8_encode($row['Codigo_plan']);                            
                            $Cronologia["Descripcion_plan"]=utf8_encode($row['Descripcion_plan']);
                            $Cronologia["Codigo_usuario"]=utf8_encode($row['Codigo_usuario']);        
                            $Cronologia["NomMedico"]=utf8_encode($row['NomMedico']); 
                            $Cronologia["ApeMedico"]=utf8_encode($row['ApeMedico']); 
                            $Cronologia["Codigo_profesionProfesional"]=utf8_encode($row['Codigo_profesionProfesional']); 
                            $Cronologia["Descrip_profesionProfesional"]=utf8_encode($row['Descrip_profesionProfesional']);                             
                            $Cronologia["Nro_visita"]=utf8_encode($row['Nro_visita']); 
                            $Cronologia["Fecha_incio_ejecutada_visita"]=utf8_encode($row['Fecha_incio_ejecutada_visita']); 
                            $Cronologia["Fecha_fin_ejecutada_visita"]=utf8_encode($row['Fecha_fin_ejecutada_visita']); 
                            $Cronologia["Motivo"]=utf8_encode($row['Motivo']); 
                            $Cronologia["Anamnesis"]=utf8_encode($row['Anamnesis']); 
                            $Cronologia["Exploracion"]=utf8_encode($row['Exploracion']); 
                            $Cronologia["Diagnostico"]=utf8_encode($row['Diagnostico']); 
                            $Cronologia["Indicaciones"]=utf8_encode($row['Indicaciones']); 
                            $Cronologia["Codigo_CIE"]=utf8_encode($row['Codigo_CIE']); 
                            $Cronologia["Descripcion_CIE10"]= utf8_encode($row['Codigo_Visible'])." ".utf8_encode($row['Descripcion_CIE10']); 
                            
                            
                            $fila = json_encode($Cronologia,JSON_PRETTY_PRINT); 
                            $lista = $lista."||".$fila;

                        }
                    //eliminar la primera coma
                    $lista = substr($lista,2);
                    //cierra la conexion
                    $dbCon = null;
                    //retorna lista json de neonatos
                    return $lista; 
                } catch(PDOException $e) {
                    $dbCon = null;
                    return '{"error":"'. $e->getMessage() .'"}'; 
                }
        
    }
    
    
    function borrarCronologicas ($Cedula, $Persona, $Id_unico_cronologica) {
        try {
            
            $dbCon = getConnection();
            
            //Borrar la Cronologicas 
            $sql = " DELETE  FROM ".db.".cronologica WHERE Id_unico_cronologica = ".$Id_unico_cronologica."  AND codigo_persona = ".$Persona."  AND numero_identificacion = '".$Cedula."'";
                 
            try
            {
                $dbCon = getConnection();
                $stmt = $dbCon->query($sql);  
                
             return "BorradoCronologicas"; 
            } 
            catch(PDOException $errborrarCronologias) {
                $dbCon = null;
                return '{"error":"'. $errborrarCronologias->getMessage() .'"}'; 
            }            
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
    
    function SellarCronologia ($Cedula, $Persona, $Id_unico_cronologica) {
        try {
            
            $dbCon = getConnection();
            
            //Sellar la Cronologicas 
            $sql = " UPDATE ".db.".cronologica set Sellado = 'S' WHERE Id_unico_cronologica = ".$Id_unico_cronologica."  AND codigo_persona = ".$Persona."  AND numero_identificacion = '".$Cedula."'";
                 
            try
            {
                $dbCon = getConnection();
                $stmt = $dbCon->query($sql);  
                
             return "SelladoCronologica"; 
            } 
            catch(PDOException $errborrarCronologias) {
                $dbCon = null;
                return '{"error":"'. $errborrarCronologias->getMessage() .'"}'; 
            }            
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
        
    function SellarAntropometria ($CedulaNumero, $Persona, $FechaHora) {
        try {
            
            $dbCon = getConnection();
            
            //Sellar la Antropometria 
            $sql = " UPDATE ".db.".datos_antropometricos set Sellado = 'S' WHERE Codigo_persona = ".$Persona."  AND Numero_Identificacion = ".$CedulaNumero."  AND Fecha_hora_toma = '".$FechaHora."'";
                 
            try
            {
                $dbCon = getConnection();
                $stmt = $dbCon->query($sql);  
                
             return "SelladoAntropometria"; 
            } 
            catch(PDOException $errselladoAntropometria) {
                $dbCon = null;
                return '{"error":"'. $errselladoAntropometria->getMessage() .'"}'; 
            }            
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
    
    function AprobarMedico ($Codigo_usuario, $Codigo_perfil_usuario, $codigo_empresa, $estado) {
        try {
            
            $dbCon = getConnection();
            
            //Aprobar Medico
            $sql = " UPDATE ".db.".perfil_empresa_usuario SET EstValidacion_medico = ".$estado." WHERE Codigo_usuario =".$Codigo_usuario." AND Codigo_perfil_usuario = ".$Codigo_perfil_usuario." AND codigo_empresa = ".$codigo_empresa.";";
                   
            try
            {
                $dbCon = getConnection();
                $stmt = $dbCon->query($sql);  
                
                return "AprobadoRechazadoMedico"; 
            } 
            catch(PDOException $erraprobarMedico) {
                $dbCon = null;
                return '{"error":"'. $erraprobarMedico->getMessage() .'"}'; 
            }            
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
    
    function editarCronologias ($Cedula, $Persona, $FechaToma, $Motivo, $Anamnesis, $Exploracion, $Diagnostico , $Actuacion,  $Codigo_CIE,  $Id_unico_cronologica ) {
        try { 
            
            
            //Obtener la hora actual para editar la cronologia
            
            $sql3 = " SELECT CAST(TIME (NOW())  AS CHAR) AS hora;";
            $dbCon = getConnection();
            $stmt3 = $dbCon->query($sql3);  
           
            while ($rowN = $stmt3->fetch()) {
                $Hora=utf8_encode($rowN['hora']);               
            }
            
            
            
           
            $FechaHoraToma= $FechaToma." ".$Hora;
            
            
            
           
            //Editar la Cronologicas 
            $sql = " UPDATE ".db.".cronologica ".
                   " SET Fecha_incio_ejecutada_visita = '".$FechaHoraToma."', ".
                   " Fecha_fin_ejecutada_visita= '".$FechaHoraToma."', ".
	           " Motivo ='".$Motivo."', ".
		   " Anamnesis= '".$Anamnesis."', ".
                   " Exploracion= '".$Exploracion."', ".
                   " Diagnostico = '".$Diagnostico."',  ".
                   " Indicaciones ='".$Actuacion."',  ".
                   " Codigo_CIE = ".$Codigo_CIE." ".
                   " WHERE Id_unico_cronologica = ".$Id_unico_cronologica."  AND codigo_persona = ".$Persona." AND numero_identificacion ='".$Cedula."';";
	
            
            try
            {
                $dbCon = getConnection();
                $stmt = $dbCon->query($sql);  
                
             return "EditadoCronologicas"; 
            } 
            catch(PDOException $errinsertarCronologias) {
                $dbCon = null;
                return '{"error":"'. $erreditarCronologias->getMessage() .'"}'; 
            }         
        } catch(PDOException $e) {
            $dbCon = null;
            return '{"error":"'. $e->getMessage() .'"}'; 
        }
    
    }
}
?>