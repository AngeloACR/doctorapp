/*
SQLyog Enterprise Trial - MySQL GUI v8.05 
MySQL - 5.5.5-10.4.6-MariaDB : Database - Docto
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

USE `Docto`;

/*Table structure for table `CalendarioDisponibleMedico` */

DROP TABLE IF EXISTS `CalendarioDisponibleMedico`;

CREATE TABLE `CalendarioDisponibleMedico` (
  `Id_calendariodisp` int(11) NOT NULL COMMENT ' Identificador dia disponible ',
  `id_Usuario` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico de la persona medico',
  `Id_Direccion` int(11) NOT NULL COMMENT ' Identificador unico   de direccion del medico donde labora para la fecha indicada',
  `Fecha` datetime NOT NULL COMMENT ' Fecha del calendario laborable para trabajo del medico en la direccion de trabajo',
  `Hora` datetime NOT NULL COMMENT ' Hora del dia que esta disponible el medico para la atencion medica',
  `id_estado_dia` int(11) NOT NULL COMMENT 'Estado de la pregunta ej.    0= no labora 1= labora ',
  `id_estado_hora` int(11) NOT NULL COMMENT 'Estado de la pregunta ej.    0= no labora 1= labora ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Id_calendariodisp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `CalendarioDisponibleMedico` */

LOCK TABLES `CalendarioDisponibleMedico` WRITE;

UNLOCK TABLES;

/*Table structure for table `CategoriasMedicamentos` */

DROP TABLE IF EXISTS `CategoriasMedicamentos`;

CREATE TABLE `CategoriasMedicamentos` (
  `Id_categoria` int(11) NOT NULL COMMENT ' Identificador unico categoria ',
  `Descripcion_categoria` varchar(150) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre o descripcion de la categoria de medicamentos',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de la pregunta ej. 1= activa   0= inactiva ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `CategoriasMedicamentos` */

LOCK TABLES `CategoriasMedicamentos` WRITE;

UNLOCK TABLES;

/*Table structure for table `Ciudad` */

DROP TABLE IF EXISTS `Ciudad`;

CREATE TABLE `Ciudad` (
  `Codigo_pais` int(11) NOT NULL COMMENT ' Identificador unico de pais',
  `Codigo_estado` int(11) NOT NULL COMMENT ' Identificador unico de estado',
  `Codigo_provincia` int(11) NOT NULL COMMENT ' Identificador unico de provincia',
  `Codigo_ciudad` int(11) NOT NULL COMMENT ' Identificador unico de ciudad',
  `Nombre_ciudad` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre de ciudad',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_pais`,`Codigo_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Ciudad` */

LOCK TABLES `Ciudad` WRITE;

UNLOCK TABLES;

/*Table structure for table `DetalleCitasMedicas` */

DROP TABLE IF EXISTS `DetalleCitasMedicas`;

CREATE TABLE `DetalleCitasMedicas` (
  `Id_cita` int(11) NOT NULL COMMENT ' Identificador unico cita ',
  `id_Usuario` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico de la persona medico',
  `Codigo_ubicacion_hospital` int(11) NOT NULL COMMENT ' Identificador unico   de direccion del medico donde va a realizar la atencion medica al paciente',
  `Id_calendariodisp` int(11) NOT NULL COMMENT ' Identificador dia disponible ',
  `id_Usuario_paciente` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Codigo_persona_paciente` int(11) NOT NULL COMMENT ' Identificador unico de la persona medico',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de la pregunta ej. 1= cerrado   0= activa ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Id_cita`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `DetalleCitasMedicas` */

LOCK TABLES `DetalleCitasMedicas` WRITE;

UNLOCK TABLES;

/*Table structure for table `DireccionesPersonas` */

DROP TABLE IF EXISTS `DireccionesPersonas`;

CREATE TABLE `DireccionesPersonas` (
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico de la persona',
  `Id_Direccion` int(11) NOT NULL COMMENT ' Identificador unico   de direccion de la persona',
  `Tipo_direccion` int(11) NOT NULL COMMENT ' Identificador unico  del tipo de direccion, ej. Casa, Oficina, Otro ',
  `Id_pais` int(11) NOT NULL COMMENT ' Identificador unico del Pais ej. EEUU  , Ecuador ',
  `Id_Estado` int(11) DEFAULT NULL COMMENT ' Identificador unico del Estado ej. New York, para el caso Ecuador no existe',
  `Id_Provincia` int(11) DEFAULT NULL COMMENT ' Identificador unico de Provincia o condado ej. Queens , Azuay',
  `Id_Ciudad` int(11) NOT NULL COMMENT ' Identificador unico de Ciudad ej. NY , Cuenca',
  `Id_Parroquia` int(11) DEFAULT NULL COMMENT ' Identificador unico de Parroquia ej. Sinincay',
  `Direccion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Calle principal, secundaria, Numero Casa o Departamento, Bloque',
  `Latitud` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Latitud de la ubicacion del la persona',
  `Longitud` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Longitud de la ubicacion del persona',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_persona`,`Id_Direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `DireccionesPersonas` */

LOCK TABLES `DireccionesPersonas` WRITE;

UNLOCK TABLES;

/*Table structure for table `Especializaciones` */

DROP TABLE IF EXISTS `Especializaciones`;

CREATE TABLE `Especializaciones` (
  `id_especializacion` int(11) NOT NULL COMMENT 'Identificador Unico del usuario ',
  `Descripcion_especializacion` varchar(150) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Especializacion descripcion',
  `id_estado_especializacion` int(11) NOT NULL COMMENT 'Estado del mensaje ej. 0= no activo   1= activo  ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`id_especializacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Especializaciones` */

LOCK TABLES `Especializaciones` WRITE;

UNLOCK TABLES;

/*Table structure for table `EspecializacionesMedico` */

DROP TABLE IF EXISTS `EspecializacionesMedico`;

CREATE TABLE `EspecializacionesMedico` (
  `id_especializacion` int(11) NOT NULL COMMENT 'Identificador Unico del usuario ',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico de la persona medico',
  `id_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del usuario medico ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_persona`,`id_especializacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `EspecializacionesMedico` */

LOCK TABLES `EspecializacionesMedico` WRITE;

UNLOCK TABLES;

/*Table structure for table `Estado` */

DROP TABLE IF EXISTS `Estado`;

CREATE TABLE `Estado` (
  `Codigo_pais` int(11) NOT NULL COMMENT ' Identificador unico de pais',
  `Codigo_estado` int(11) NOT NULL COMMENT ' Identificador unico de estado',
  `Nombre_estado` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre de Estado',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_pais`,`Codigo_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Estado` */

LOCK TABLES `Estado` WRITE;

UNLOCK TABLES;

/*Table structure for table `Hospital` */

DROP TABLE IF EXISTS `Hospital`;

CREATE TABLE `Hospital` (
  `Codigo_hospital` int(11) NOT NULL COMMENT ' Identificador unico del hospital',
  `Codigo_ubicacion_hospital` int(11) NOT NULL COMMENT ' Identificador unico de la ubicacion del hospital',
  `Nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre del hospital',
  `Especialidad` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Especialidad del hospital',
  `Imagenes` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Arreglo con la ubicación de las imagenes en el servidor',
  `TelefonoContacto` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Telefono de contacto del hospital',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_hospital`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Hospital` */

LOCK TABLES `Hospital` WRITE;

UNLOCK TABLES;

/*Table structure for table `HospitalDisponibilidad` */

DROP TABLE IF EXISTS `HospitalDisponibilidad`;

CREATE TABLE `HospitalDisponibilidad` (
  `Id_hospital` int(11) NOT NULL COMMENT ' Identificador unico hospital ',
  `id_Sec` int(11) NOT NULL COMMENT ' Identificador unico de la disponibilidad ',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de la disponibilidad ej. 1= activo   0= inactivo ',
  `Lunes` int(11) NOT NULL COMMENT ' Identificador si labora lunes el hospital ',
  `Martes` int(11) NOT NULL COMMENT ' Identificador si labora martes el hospital ',
  `Miercoles` int(11) NOT NULL COMMENT ' Identificador si labora miercoles el hospital ',
  `Jueves` int(11) NOT NULL COMMENT ' Identificador si labora jueves el hospital ',
  `Viernes` int(11) NOT NULL COMMENT ' Identificador si labora viernes el hospital ',
  `Sabado` int(11) NOT NULL COMMENT ' Identificador si labora sabado el hospital ',
  `Domingo` int(11) NOT NULL COMMENT ' Identificador si labora domingo el hospital ',
  `Lunes_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura lunes del hospital ',
  `Martes_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura martes del hospital ',
  `Miercoles_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura miercoles del hospital ',
  `Jueves_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura jueves del hospital ',
  `Viernes_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura viernes del hospital ',
  `Sabado_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura sabado del hospital ',
  `Domingo_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura domingo del hospital ',
  `Lunes_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre lunes del hospital ',
  `Martes_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre martes del hospital ',
  `Miercoles_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre miercoles del hospital ',
  `Jueves_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre jueves del hospital ',
  `Viernes_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre viernes del hospital ',
  `Sabado_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre sabado del hospital ',
  `Domingo_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre domingo del hospital ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`id_Sec`,`Id_hospital`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `HospitalDisponibilidad` */

LOCK TABLES `HospitalDisponibilidad` WRITE;

UNLOCK TABLES;

/*Table structure for table `HospitalesDepartamentos` */

DROP TABLE IF EXISTS `HospitalesDepartamentos`;

CREATE TABLE `HospitalesDepartamentos` (
  `Id_hospital` int(11) NOT NULL COMMENT ' Identificador unico hospital ',
  `Id_depatamento` int(11) NOT NULL COMMENT ' Identificador unico departamento ',
  `Nombre_departamento` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre del departamento',
  `id_estado` int(11) NOT NULL COMMENT 'Estado del departamento ej. 1= activo   0= inactivo ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Id_hospital`,`Id_depatamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `HospitalesDepartamentos` */

LOCK TABLES `HospitalesDepartamentos` WRITE;

UNLOCK TABLES;

/*Table structure for table `Idioma` */

DROP TABLE IF EXISTS `Idioma`;

CREATE TABLE `Idioma` (
  `Codigo_idioma` int(11) NOT NULL COMMENT ' Identificador unico del idioma',
  `Nombre_idioma` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre del Idioma',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Idioma` */

LOCK TABLES `Idioma` WRITE;

UNLOCK TABLES;

/*Table structure for table `Medicamentos` */

DROP TABLE IF EXISTS `Medicamentos`;

CREATE TABLE `Medicamentos` (
  `Id_medicamento` int(11) NOT NULL COMMENT ' Identificador unico medicamento ',
  `Id_categoria` int(11) NOT NULL COMMENT ' Identificador unico categoria ',
  `Descripcion_medicamento` varchar(150) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre o descripcion de la categoria de medicamentos',
  `Unidad_medida` int(11) NOT NULL COMMENT ' Unidad de medicamento ',
  `Foto_medicamento` blob NOT NULL COMMENT ' Foto del medicamento para la venta',
  `Cantidad_disponoble` int(11) NOT NULL COMMENT 'Cantidad disponible en inventario',
  `Precio_medicamento` double NOT NULL COMMENT 'Precio del medicamento por unidad',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de la pregunta ej. 1= activo   0= inactivo ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Id_categoria`,`Id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Medicamentos` */

LOCK TABLES `Medicamentos` WRITE;

UNLOCK TABLES;

/*Table structure for table `MedicoDisponibilidad` */

DROP TABLE IF EXISTS `MedicoDisponibilidad`;

CREATE TABLE `MedicoDisponibilidad` (
  `Id_persona` int(11) NOT NULL COMMENT ' Identificador unico hospital ',
  `id_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del usuario medico ',
  `id_Sec` int(11) NOT NULL COMMENT ' Identificador unico de la disponibilidad ',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de la disponibilidad ej. 1= activo   0= inactivo ',
  `Lunes` int(11) NOT NULL COMMENT ' Identificador si labora lunes el hospital ',
  `Martes` int(11) NOT NULL COMMENT ' Identificador si labora martes el hospital ',
  `Miercoles` int(11) NOT NULL COMMENT ' Identificador si labora miercoles el hospital ',
  `Jueves` int(11) NOT NULL COMMENT ' Identificador si labora jueves el hospital ',
  `Viernes` int(11) NOT NULL COMMENT ' Identificador si labora viernes el hospital ',
  `Sabado` int(11) NOT NULL COMMENT ' Identificador si labora sabado el hospital ',
  `Domingo` int(11) NOT NULL COMMENT ' Identificador si labora domingo el hospital ',
  `Lunes_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura lunes del hospital ',
  `Martes_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura martes del hospital ',
  `Miercoles_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura miercoles del hospital ',
  `Jueves_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura jueves del hospital ',
  `Viernes_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura viernes del hospital ',
  `Sabado_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura sabado del hospital ',
  `Domingo_hora_apertura` int(11) NOT NULL COMMENT ' Hora de apertura domingo del hospital ',
  `Lunes_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre lunes del hospital ',
  `Martes_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre martes del hospital ',
  `Miercoles_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre miercoles del hospital ',
  `Jueves_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre jueves del hospital ',
  `Viernes_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre viernes del hospital ',
  `Sabado_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre sabado del hospital ',
  `Domingo_hora_cierre` int(11) NOT NULL COMMENT ' Hora de cierre domingo del hospital ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`id_Sec`,`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `MedicoDisponibilidad` */

LOCK TABLES `MedicoDisponibilidad` WRITE;

UNLOCK TABLES;

/*Table structure for table `MetodoDePago` */

DROP TABLE IF EXISTS `MetodoDePago`;

CREATE TABLE `MetodoDePago` (
  `Codigo_metodo_de_pago` int(11) NOT NULL COMMENT 'Identificador unico del metodo de pago',
  `Metodo` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Descripcion del metodo de pago, si efectivo, paypal, tarjeta de credito, debito, transferencia bancaria o cualquier otro metodo de pago definido',
  PRIMARY KEY (`Codigo_metodo_de_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `MetodoDePago` */

LOCK TABLES `MetodoDePago` WRITE;

UNLOCK TABLES;

/*Table structure for table `OrdenCabecera` */

DROP TABLE IF EXISTS `OrdenCabecera`;

CREATE TABLE `OrdenCabecera` (
  `Codigo_orden` int(11) NOT NULL COMMENT ' Identificador unico de la orden',
  `Fecha` datetime NOT NULL COMMENT 'Fecha en que fue pedida la orden',
  `Codigo_usuario` int(11) NOT NULL COMMENT ' Identificador unico del usuario',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `Codigo_metodo_de_pago` int(11) DEFAULT NULL COMMENT 'Identificador del metodo de pago',
  `Estado` int(11) DEFAULT NULL COMMENT 'Indicador del estado de la orden, si en proceso, entregada o rechazada',
  `Subtotal` double DEFAULT NULL COMMENT 'Subtotal a pagar por la cantidad de productos solicitados',
  `Impuesto` double DEFAULT NULL COMMENT 'Impuesto  a pagar por la cantidad de productos solicitados',
  `Total` double DEFAULT NULL COMMENT 'Subtotal + IVA',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `OrdenCabecera` */

LOCK TABLES `OrdenCabecera` WRITE;

UNLOCK TABLES;

/*Table structure for table `OrdenDetalle` */

DROP TABLE IF EXISTS `OrdenDetalle`;

CREATE TABLE `OrdenDetalle` (
  `Codigo_orden` int(11) NOT NULL COMMENT ' Identificador unico de la orden',
  `Id_medicamento` int(11) NOT NULL COMMENT ' Identificador unico medicamento ',
  `Cantidad` int(11) NOT NULL COMMENT ' Identificador unico medicamento ',
  `Precio_medicamento` double NOT NULL COMMENT 'Precio del medicamento por unidad',
  `Subtotal_linea` double NOT NULL COMMENT 'Subtotal por linea',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_orden`,`Id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `OrdenDetalle` */

LOCK TABLES `OrdenDetalle` WRITE;

UNLOCK TABLES;

/*Table structure for table `Pais` */

DROP TABLE IF EXISTS `Pais`;

CREATE TABLE `Pais` (
  `Codigo_pais` int(11) NOT NULL COMMENT ' Identificador unico de pais',
  `Nombre_pais` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre de pais',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Pais` */

LOCK TABLES `Pais` WRITE;

UNLOCK TABLES;

/*Table structure for table `Parroquia` */

DROP TABLE IF EXISTS `Parroquia`;

CREATE TABLE `Parroquia` (
  `Codigo_pais` int(11) NOT NULL COMMENT ' Identificador unico de pais',
  `Codigo_estado` int(11) NOT NULL COMMENT ' Identificador unico de estado',
  `Codigo_provincia` int(11) NOT NULL COMMENT ' Identificador unico de provincia',
  `Codigo_ciudad` int(11) NOT NULL COMMENT ' Identificador unico de ciudad',
  `Codigo_parroquia` int(11) NOT NULL COMMENT ' Identificador unico de parroquia',
  `Nombre_ciudad` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre de parroquia',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_pais`,`Codigo_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Parroquia` */

LOCK TABLES `Parroquia` WRITE;

UNLOCK TABLES;

/*Table structure for table `PerfilMedico` */

DROP TABLE IF EXISTS `PerfilMedico`;

CREATE TABLE `PerfilMedico` (
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico de la persona medico',
  `id_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del usuario medico ',
  `Expericia_medico` int(11) NOT NULL COMMENT 'Anios de experiencia del usuario medico ',
  `Honorarios_consulta` int(11) NOT NULL COMMENT 'Honorarios de consulta ',
  `id_estado_medico` int(11) NOT NULL COMMENT 'Estado del mensaje ej. 0= no activo   1= activo  ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_persona`,`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `PerfilMedico` */

LOCK TABLES `PerfilMedico` WRITE;

UNLOCK TABLES;

/*Table structure for table `Persona` */

DROP TABLE IF EXISTS `Persona`;

CREATE TABLE `Persona` (
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico de la persona',
  `Nombres` varchar(30) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombres de la persona',
  `Apellidos` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Apellidos de la persona',
  `Codigo_tipo_identificacion` int(11) NOT NULL COMMENT ' Tipo de identificacion Pasaporte, Cedula, RUC',
  `Identificacion_persona` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Identicacion Nro de Cedula o pasaporte de la persona',
  `Sexo` varchar(1) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Fecha_nacimiento` datetime NOT NULL COMMENT ' Fecha de nacimiento de la persona',
  `Estado_persona` int(11) NOT NULL COMMENT ' Indicador si la persona esta activa o inactiva',
  `Foto_persona` blob NOT NULL COMMENT ' Foto de persona ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL,
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Persona` */

LOCK TABLES `Persona` WRITE;

UNLOCK TABLES;

/*Table structure for table `PreguntasFrecuentes` */

DROP TABLE IF EXISTS `PreguntasFrecuentes`;

CREATE TABLE `PreguntasFrecuentes` (
  `Id_pregunta` int(11) NOT NULL COMMENT ' Identificador unico pregunta ',
  `Id_pais` int(11) NOT NULL COMMENT ' Identificador unico del Pais ej. EEUU  , Ecuador ',
  `Codigo_idioma` int(11) NOT NULL COMMENT ' Identificador unico del idioma',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de la pregunta ej. 1= activo   0= inactivo ',
  `contenido_Pregunta` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Contenido de la pregunta',
  `respuesta_pregunta` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Respuesta default de la pregunta',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `PreguntasFrecuentes` */

LOCK TABLES `PreguntasFrecuentes` WRITE;

UNLOCK TABLES;

/*Table structure for table `Provincia` */

DROP TABLE IF EXISTS `Provincia`;

CREATE TABLE `Provincia` (
  `Codigo_pais` int(11) NOT NULL COMMENT ' Identificador unico de pais',
  `Codigo_estado` int(11) NOT NULL COMMENT ' Identificador unico de estado',
  `Codigo_provincia` int(11) NOT NULL COMMENT ' Identificador unico de provincia',
  `Nombre_provincia` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre de Provincia',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_pais`,`Codigo_estado`,`Codigo_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Provincia` */

LOCK TABLES `Provincia` WRITE;

UNLOCK TABLES;

/*Table structure for table `RatingDoctor` */

DROP TABLE IF EXISTS `RatingDoctor`;

CREATE TABLE `RatingDoctor` (
  `Codigo_rating` int(11) NOT NULL COMMENT ' Identificador unico del rating',
  `Codigo_personaDoctor` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `id_UsuarioDoctor` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Codigo_personaPaciente` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `id_UsuarioPaciente` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Rating` int(11) NOT NULL COMMENT ' Calificación del doctor',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_rating`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `RatingDoctor` */

LOCK TABLES `RatingDoctor` WRITE;

UNLOCK TABLES;

/*Table structure for table `RatingProducto` */

DROP TABLE IF EXISTS `RatingProducto`;

CREATE TABLE `RatingProducto` (
  `Codigo_rating` int(11) NOT NULL COMMENT ' Identificador unico del rating',
  `Id_medicamento` int(11) NOT NULL COMMENT ' Identificador unico medicamento ',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `id_Usuario` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Rating` int(11) NOT NULL COMMENT ' Calificación del producto',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_rating`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `RatingProducto` */

LOCK TABLES `RatingProducto` WRITE;

UNLOCK TABLES;

/*Table structure for table `ReseniaDoctor` */

DROP TABLE IF EXISTS `ReseniaDoctor`;

CREATE TABLE `ReseniaDoctor` (
  `Codigo_resenia` int(11) NOT NULL COMMENT ' Identificador unico de la reseña',
  `Codigo_personaDoctor` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `id_UsuarioDoctor` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Codigo_personaPaciente` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `id_UsuarioPaciente` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Resenia` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Reseña del doctor realizada por el usuario',
  `Motivo_resenia` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Motivo por el cual el paciente visito al medico ej. dolor de cabeza',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_resenia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `ReseniaDoctor` */

LOCK TABLES `ReseniaDoctor` WRITE;

UNLOCK TABLES;

/*Table structure for table `ReseniaProducto` */

DROP TABLE IF EXISTS `ReseniaProducto`;

CREATE TABLE `ReseniaProducto` (
  `Codigo_resenia` int(11) NOT NULL COMMENT ' Identificador unico de la reseña',
  `Id_medicamento` int(11) NOT NULL COMMENT ' Identificador unico medicamento ',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `id_Usuario` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Resenia` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Reseña del producto realizada por el usuario',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_resenia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `ReseniaProducto` */

LOCK TABLES `ReseniaProducto` WRITE;

UNLOCK TABLES;

/*Table structure for table `ServiciosMedico` */

DROP TABLE IF EXISTS `ServiciosMedico`;

CREATE TABLE `ServiciosMedico` (
  `id_servicios` int(11) NOT NULL COMMENT ' Identificador unico de la especializacion del medico',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico de la persona medico',
  `id_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del usuario medico ',
  `descripcion_servicios` varchar(150) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Descripcion del servicio que presta el medico',
  `id_estado_servicio` int(11) NOT NULL COMMENT 'Estado del mensaje ej. 0= no activo   1= activo  ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_persona`,`id_servicios`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `ServiciosMedico` */

LOCK TABLES `ServiciosMedico` WRITE;

UNLOCK TABLES;

/*Table structure for table `Soporte` */

DROP TABLE IF EXISTS `Soporte`;

CREATE TABLE `Soporte` (
  `id` int(11) NOT NULL COMMENT 'Identificador Unico del mensaje ',
  `fecha` datetime NOT NULL COMMENT ' Fecha Mensaje',
  `contenido` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Contenido el mensaje',
  `id_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del usuario ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `Soporte` */

LOCK TABLES `Soporte` WRITE;

UNLOCK TABLES;

/*Table structure for table `TerminosCondiciones` */

DROP TABLE IF EXISTS `TerminosCondiciones`;

CREATE TABLE `TerminosCondiciones` (
  `Id_terminoscondi` int(11) NOT NULL COMMENT ' Identificador unico de los terminos y condiciones ',
  `Id_pais` int(11) NOT NULL COMMENT ' Identificador unico del Pais ej. EEUU  , Ecuador ',
  `Codigo_idioma` int(11) NOT NULL COMMENT ' Identificador unico del idioma',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de los terminos y condiciones ej. 0= activo   2= inactivo ',
  `contenido_TerminosCond` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Contenido de terminos y condiciones',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Id_terminoscondi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `TerminosCondiciones` */

LOCK TABLES `TerminosCondiciones` WRITE;

UNLOCK TABLES;

/*Table structure for table `TipoIdentificacion` */

DROP TABLE IF EXISTS `TipoIdentificacion`;

CREATE TABLE `TipoIdentificacion` (
  `Codigo_tipo_identificacion` int(11) NOT NULL COMMENT ' Identificador unico del tipo',
  `Descripcion_tipo_identificacion` varchar(30) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Descripcion tipo de identicicacion RUC, Cedula, Pasaporte',
  PRIMARY KEY (`Codigo_tipo_identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `TipoIdentificacion` */

LOCK TABLES `TipoIdentificacion` WRITE;

UNLOCK TABLES;

/*Table structure for table `TipoUsuario` */

DROP TABLE IF EXISTS `TipoUsuario`;

CREATE TABLE `TipoUsuario` (
  `Codigo_tipo_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del tipo usuario ',
  `Descripcion_tipo_usuario` varchar(30) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Descripcion tipo usuario ej. Administrador, usuario medico, usuario doctorWeb, usuario delivery ',
  PRIMARY KEY (`Codigo_tipo_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `TipoUsuario` */

LOCK TABLES `TipoUsuario` WRITE;

UNLOCK TABLES;

/*Table structure for table `TiposDireccion` */

DROP TABLE IF EXISTS `TiposDireccion`;

CREATE TABLE `TiposDireccion` (
  `Tipo_direccion` int(11) NOT NULL,
  `Descripcion_Tipo` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Descripcion del tipo de Direccion',
  `Estado_Tipo` int(11) NOT NULL,
  PRIMARY KEY (`Tipo_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `TiposDireccion` */

LOCK TABLES `TiposDireccion` WRITE;

UNLOCK TABLES;

/*Table structure for table `UbicacionHospital` */

DROP TABLE IF EXISTS `UbicacionHospital`;

CREATE TABLE `UbicacionHospital` (
  `Codigo_ubicacion_hospital` int(11) NOT NULL COMMENT 'Identificador Unico de la ubicacion del hospital ',
  `Id_pais` int(11) NOT NULL COMMENT ' Identificador unico del Pais ej. EEUU  , Ecuador ',
  `Id_Estado` int(11) DEFAULT NULL COMMENT ' Identificador unico del Estado ej. New York, para el caso Ecuador no existe',
  `Id_Provincia` int(11) DEFAULT NULL COMMENT ' Identificador unico de Provincia o condado ej. Queens , Azuay',
  `Id_Ciudad` int(11) NOT NULL COMMENT ' Identificador unico de Ciudad ej. NY , Cuenca',
  `Id_Parroquia` int(11) DEFAULT NULL COMMENT ' Identificador unico de Parroquia ej. Sinincay',
  `Direccion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Dirección del hospital',
  `Latitud` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Latitud de la ubicacion del hospital',
  `Longitud` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Longitud de la ubicacion del hospital',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Codigo_ubicacion_hospital`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `UbicacionHospital` */

LOCK TABLES `UbicacionHospital` WRITE;

UNLOCK TABLES;

/*Table structure for table `UnidadesMedida` */

DROP TABLE IF EXISTS `UnidadesMedida`;

CREATE TABLE `UnidadesMedida` (
  `Unidad_medida` int(11) NOT NULL COMMENT ' Identificador unico unidad de medida medicamento ',
  `Descripcion_medida` varchar(150) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre o descripcion de la categoria de medicamentos',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de la pregunta ej. 1= activa   0= inactiva ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`Unidad_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `UnidadesMedida` */

LOCK TABLES `UnidadesMedida` WRITE;

UNLOCK TABLES;

/*Table structure for table `UsuarioDoctorWeb` */

DROP TABLE IF EXISTS `UsuarioDoctorWeb`;

CREATE TABLE `UsuarioDoctorWeb` (
  `id_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del usuario ',
  `Login_usuario` varchar(30) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Nombre del usuario ',
  `Correo_electronico` varchar(250) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Correo electronico ',
  `Numero_celular` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Numero del celular ',
  `Clave_usuario` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Clave del Usuario encriptada ',
  `Estado_usuario` int(11) NOT NULL COMMENT 'Senala si el usuario esta activo o inactivo ej. 0= Inactivo , 1= Activo',
  `Fecha_caducidad` datetime NOT NULL COMMENT 'Fecha hasta la cual es vigente el usuario, pasada la fecha se inactiva ',
  `Codigo_persona` int(11) NOT NULL COMMENT 'Identificador unico del codigo del persona ',
  `Codigo_tipo_Usuario` int(11) NOT NULL COMMENT 'Para el codigo del tipo de usuario ej. . Administrador, usuario medico, usuario doctorWeb, usuario delivery ',
  `Telefono_validado` tinyint(1) NOT NULL COMMENT ' Indicador para saber si el telefono esta verificado',
  `Correo_validado` tinyint(1) NOT NULL COMMENT ' Indicador para saber si el correo esta verificado',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL,
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  PRIMARY KEY (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `UsuarioDoctorWeb` */

LOCK TABLES `UsuarioDoctorWeb` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
