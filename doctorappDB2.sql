-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-10-2020 a las 08:59:11
-- Versión del servidor: 10.4.15-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u198324488_Docto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CalendarioDisponibleMedico`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CategoriasMedicamentos`
--

CREATE TABLE `CategoriasMedicamentos` (
  `Id_categoria` int(11) NOT NULL COMMENT ' Identificador unico categoria ',
  `Descripcion_categoria` varchar(150) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre o descripcion de la categoria de medicamentos',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de la pregunta ej. 1= activa   0= inactiva ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciudad`
--

CREATE TABLE `Ciudad` (
  `Codigo_pais` int(11) NOT NULL COMMENT ' Identificador unico de pais',
  `Codigo_estado` int(11) NOT NULL COMMENT ' Identificador unico de estado',
  `Codigo_provincia` int(11) NOT NULL COMMENT ' Identificador unico de provincia',
  `Codigo_ciudad` int(11) NOT NULL COMMENT ' Identificador unico de ciudad',
  `Nombre_ciudad` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre de ciudad',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DetalleCitasMedicas`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DireccionesPersonas`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Especializaciones`
--

CREATE TABLE `Especializaciones` (
  `id_especializacion` int(11) NOT NULL COMMENT 'Identificador Unico del usuario ',
  `Descripcion_especializacion` varchar(150) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Especializacion descripcion',
  `id_estado_especializacion` int(11) NOT NULL COMMENT 'Estado del mensaje ej. 0= no activo   1= activo  ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EspecializacionesMedico`
--

CREATE TABLE `EspecializacionesMedico` (
  `id_especializacion` int(11) NOT NULL COMMENT 'Identificador Unico del usuario ',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico de la persona medico',
  `id_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del usuario medico ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estado`
--

CREATE TABLE `Estado` (
  `Codigo_pais` int(11) NOT NULL COMMENT ' Identificador unico de pais',
  `Codigo_estado` int(11) NOT NULL COMMENT ' Identificador unico de estado',
  `Nombre_estado` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre de Estado',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Hospital`
--

CREATE TABLE `Hospital` (
  `Codigo_hospital` int(11) NOT NULL COMMENT ' Identificador unico del hospital',
  `Codigo_ubicacion_hospital` int(11) NOT NULL COMMENT ' Identificador unico de la ubicacion del hospital',
  `Nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre del hospital',
  `Especialidad` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Especialidad del hospital',
  `Imagenes` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Arreglo con la ubicación de las imagenes en el servidor',
  `TelefonoContacto` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Telefono de contacto del hospital',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `HospitalDisponibilidad`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `HospitalesDepartamentos`
--

CREATE TABLE `HospitalesDepartamentos` (
  `Id_hospital` int(11) NOT NULL COMMENT ' Identificador unico hospital ',
  `Id_depatamento` int(11) NOT NULL COMMENT ' Identificador unico departamento ',
  `Nombre_departamento` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre del departamento',
  `id_estado` int(11) NOT NULL COMMENT 'Estado del departamento ej. 1= activo   0= inactivo ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Idioma`
--

CREATE TABLE `Idioma` (
  `Codigo_idioma` int(11) NOT NULL COMMENT ' Identificador unico del idioma',
  `Nombre_idioma` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre del Idioma',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medicamentos`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MedicoDisponibilidad`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MetodoDePago`
--

CREATE TABLE `MetodoDePago` (
  `Codigo_metodo_de_pago` int(11) NOT NULL COMMENT 'Identificador unico del metodo de pago',
  `Metodo` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Descripcion del metodo de pago, si efectivo, paypal, tarjeta de credito, debito, transferencia bancaria o cualquier otro metodo de pago definido'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `OrdenCabecera`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `OrdenDetalle`
--

CREATE TABLE `OrdenDetalle` (
  `Codigo_orden` int(11) NOT NULL COMMENT ' Identificador unico de la orden',
  `Id_medicamento` int(11) NOT NULL COMMENT ' Identificador unico medicamento ',
  `Cantidad` int(11) NOT NULL COMMENT ' Identificador unico medicamento ',
  `Precio_medicamento` double NOT NULL COMMENT 'Precio del medicamento por unidad',
  `Subtotal_linea` double NOT NULL COMMENT 'Subtotal por linea',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Otp_expiracion`
--

CREATE TABLE `Otp_expiracion` (
  `id_Usuario` int(11) NOT NULL,
  `otp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expira_si_no` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Otp_expiracion`
--

INSERT INTO `Otp_expiracion` (`id_Usuario`, `otp`, `expira_si_no`, `fecha_creacion`) VALUES
(1, '937814', 0, '0000-00-00 00:00:00'),
(1, '499267', 0, '0000-00-00 00:00:00'),
(1, '012996', 0, '0000-00-00 00:00:00'),
(1, '605538', 0, '0000-00-00 00:00:00'),
(1, '770282', 0, '0000-00-00 00:00:00'),
(1, '224610', 0, '2020-09-25 23:13:48'),
(1, '263527', 0, '2020-09-25 23:22:33'),
(1, '382059', 0, '2020-09-25 23:25:06'),
(1, '383770', 0, '2020-09-25 23:25:35'),
(1, '598070', 0, '2020-09-25 23:26:32'),
(1, '054355', 0, '2020-09-26 16:28:32'),
(1, '268331', 0, '2020-09-26 16:33:29'),
(1, '779120', 0, '2020-09-26 16:37:25'),
(1, '005483', 0, '2020-09-26 16:39:28'),
(1, '164947', 0, '2020-09-26 16:48:11'),
(1, '240631', 0, '2020-09-26 16:52:39'),
(1, '444031', 0, '2020-09-26 16:59:01'),
(1, '217750', 0, '2020-09-26 17:45:48'),
(1, '463548', 0, '2020-09-26 17:46:14'),
(1, '987659', 0, '2020-10-07 04:09:32'),
(1, '293271', 0, '2020-10-07 04:09:56'),
(1, '715854', 0, '2020-10-07 04:10:46'),
(1, '450422', 0, '2020-10-07 04:12:44'),
(1, '475313', 0, '2020-10-07 04:13:08'),
(1, '101095', 0, '2020-10-07 04:13:57'),
(1, '992124', 0, '2020-10-07 04:14:12'),
(1, '100514', 0, '2020-10-07 04:14:34'),
(1, '822997', 0, '2020-10-07 04:16:33'),
(1, '219644', 0, '2020-10-07 04:21:11'),
(1, '502527', 0, '2020-10-07 04:24:50'),
(1, '984493', 0, '2020-10-07 04:27:16'),
(1, '805078', 0, '2020-10-07 04:28:22'),
(1, '268685', 0, '2020-10-07 04:31:48'),
(1, '595237', 0, '2020-10-07 18:16:03'),
(1, '168704', 0, '2020-10-12 13:52:46'),
(1, '165149', 0, '2020-10-12 15:10:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pais`
--

CREATE TABLE `Pais` (
  `Codigo_pais` int(11) NOT NULL COMMENT ' Identificador unico de pais',
  `Nombre_pais` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre de pais',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Parroquia`
--

CREATE TABLE `Parroquia` (
  `Codigo_pais` int(11) NOT NULL COMMENT ' Identificador unico de pais',
  `Codigo_estado` int(11) NOT NULL COMMENT ' Identificador unico de estado',
  `Codigo_provincia` int(11) NOT NULL COMMENT ' Identificador unico de provincia',
  `Codigo_ciudad` int(11) NOT NULL COMMENT ' Identificador unico de ciudad',
  `Codigo_parroquia` int(11) NOT NULL COMMENT ' Identificador unico de parroquia',
  `Nombre_ciudad` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre de parroquia',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PerfilMedico`
--

CREATE TABLE `PerfilMedico` (
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico de la persona medico',
  `id_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del usuario medico ',
  `Expericia_medico` int(11) NOT NULL COMMENT 'Anios de experiencia del usuario medico ',
  `Honorarios_consulta` int(11) NOT NULL COMMENT 'Honorarios de consulta ',
  `id_estado_medico` int(11) NOT NULL COMMENT 'Estado del mensaje ej. 0= no activo   1= activo  ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Persona`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Persona`
--

INSERT INTO `Persona` (`Codigo_persona`, `Nombres`, `Apellidos`, `Codigo_tipo_identificacion`, `Identificacion_persona`, `Sexo`, `Fecha_nacimiento`, `Estado_persona`, `Foto_persona`, `Usuario_creacion`, `Fecha_ult_modif`, `Usuario_ult_modif`) VALUES
(1, 'CARMEN JUANA ', 'TACURI VINTIMILLA', 1, '0103533766', '2', '0000-00-00 00:00:00', 1, 0x89504e470d0a1a0a0000000d4948445200000096000000c60802000000bfedee42000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000f6e649444154785e54fdd9cf2e5b9a1f08ad39e678a76fd8dfb78733659ecaccc265bb5d6dc405b4af1042f4251243d3b88d5de52adbad0609897f0009eefa062e5103426ac44dd30376cbd8ae2a979d5595e5ca793af3d9f337bd53ccb1267ecfbb330b88ccf3ed778e88f53ccf6f586bc50afe2fbef787a9703ef4abcdb71eee7f6e74354c7ba51652382553eb5a290a1f1b2dab79eea54cf149c6121682490a2ea6e0a59d5bce948da35605633ec62078605144cebd639bf38fdae665f44c4a2954e2ec1002f7be53320f7ee03c896190aae8a743962ebd3d4abdb07ec742354f3b37e487e1ee8b5fbef9f9e7bfd81d5b99aadd6cb1bff5729967b910a69f8e1745c56c338d090e81cb3058cfdb991bdd7a6ba292ca253ad526697683500796ac4bc5858fad9d8c2858e6e6515ad1b260b25c2953a771fad9672febc5eadffe1bbffd8d6f3c36e9bace3cce2bc62ef2cc24817911629082e34cb9c8790c5c881819ce45ebd4fb51ea6a1c9b245904df2b55f7d3164deac2d124cbb9dfe7d97a1cb64c2feb82599bceae8941f9d02ab1e8877ba31721dac0d07c436e163c0e9345bb0993a43cbabeef94ca386773f491b1541821ec64a3280daf57cf38cf18639bb36f3bdfa766b55e3f5d2c3f08f4d355b5b85e2e7fc3b92e4f16f5f2c96afd316793d269515de4c553ef1bc486f1f1fcfc3b217621f8d5fa1b21b2c5fa1b1c6114013f1b83af964f58646e6ecafa31a774f926ce70b1f94670ede2ece372f9d8c84cc87979f6ad6a711546d6b70f8f1effd61ffed13ffd27ffe45f7cff47dffffaf5db63db8cce3f3e5b6f96e7df78ef7d6183e49e457db8dfb9c0170b552565dfcd710c481f255ce20d1a27e3619e0737cd21b682e7460a3b2385241a3dd7515bbea94cc2eb32373a3322b69ab10fdf7bcc66fb67dffda3e75fdf7ef8f4290fd1d9dd72f5fe6a7959645738772d261ec7bc782cc251f091fb8ec7bd9673744d9a5f07d708e1191b59447e1f8c8cce1d859b159b1265e7718f0ce2f118c2e8eddecdc7e05be6fbe8f7295230343c7652cc06ed169b182723ad12439cf19941e18b7c126cca65c8852f33cec26894154a28b4b2e4387836b4f76868a58addee333cf5210a6eb6f79f0ccd4ec49094e7cdee97a70f339398c3fe97ede12de3828b6cb9f94e7b78b35e7f479c7e87334a0816137efa71cee4e1fecb1863b9780f4fabf537bac3cd62f34d3c5e5e7c7bbb7d7d77f3f318ca6e186eeebe7ef1f99f7dfdf58b7ffe2ffef9ffe13ffe8fbffbbdbff8ecb3e756c9eba78faf2eead5d999708ef69e9a2aa30aaa0d8f1a392b861e919a6214d304444108bcd2528c764e1470e2d83412471d1311b8757eb73f9445ddcfe176dfcea3473acb209bbb7ed88fc7819f2d0b59a42cba7ffda77ff15ffc93ffc7e6e2836e6a70a837f73fc35f6c69f17e56bedf1fde26c57b267bcca448f20f002736b869b889cc6ba0d7d4a0194d7a81238dbecfabf75d1c945cc7d823935898e639b1be2b8aa78cf545f9418823131522049cd3ca1a8903989948b8742679cc194e4a2895a22985e45c30ce79d737c85516a2fc0fffd7ff9b66fb0b2164dfdf70a6439ceac5e37178c8b24d9a6d749265f9669e9a7249ad9f6467a7bf1ba5f2343d3369394f877af1acdd7fc998ee873731aa793e2c57cfdae32b8ebd21f0d9d2a4f534ecb1d7bebbf776ee87db7af9b46f5e8e4377dcdd58915e5ebcbf1f9a47e71f94c5f2bffe27ffe55ffcf88b9ffdfc977787fed9878ff2622933952a6398abcae5d0f52146a40d4231b447e7423bcc610e1ca1147ab623508de16450607a9e06bb2c6aa0e8e82605f033c9e1f890e449aab98b26af72eb671ca11d46898a069e1c7b254df0e310c420433f8cafdfbcfcf9975ffe77ff9d7ff7cf7ff97d25c5aabed8f5fb661c5040685b9d15e3f0860b032c41eee217d02c317ac434cdaf663ba3d1f1f33e8c5c262866a5d7daac829f9d9ba42e2382aa6a6f1b06346173a26b935d685da0b5d3ec51b04d923e927261dd48df0a56276b54369a1199aacc9954959b7b8593fddbfff3ff3eaac447bb587fdc0f37abf5379be6055074fbf009e779db7c358e47e0e729ffd871ffb59d8fdea160ee800976062ce8717ca8961f52385d173d4a17683a023093a49ac6ed3c3c24d97a42a457ef59db454420baa13f823dead5d363bfb73c2e8ac5edebafd6eb8bffe4fff47ffc177ff0c7435080cbb428b3324b8daa57abfdf6463231f6735d544966baa18f0e0de1188f6592fb1044ae18e21941c99310c0613bbac1ba1082b363a3055ef7ca339de742a7e7e7f9ee38bae0114910c4ecf9725976d38cf865468e6e9c107670b91fbce7a3b37ff04fff5f87715ca4aa51f1fdcd8763b377615e6e4e6d123b14854ecead3d727022b832502b8fe316d41ac21685e2fc8474f7f180749986d788ee346d8548bd6b8d59390b2652def726bdecbbafb459ce762b23438d066f952ef0d63c6fc1b83e748c05a5cf431862e8a7e91eb88d82917fef77ff6742961ebbc951766b60a6750d4e3cf8aeacaf87e15ecbe5d03ff7818fc3eb24d9308e863121421d2c110ca028c3ee004ff3aea89e22c08056d4c9f6ee756453bd7ccfcedd3434a0dbe3ee058a2fc96a3b0f8bd5b3245ba105acf7c7f6feedabd79ffdf4871f7ffbaffe5fffcfffc9faecd1b3274f8cc990da9313a13b3095020ae609d96b9b79449a27c88eace8c711403fb55db4b1aace641c394b11d745912bad678f37558c231441a6508406dca18b5ccab0a8966142fc8556803d06e688726eba2ee179599bed610013e529244490d238eb810d48cbe66effe8eaec3ffdbffd5ff65d7f7dbe917cd4c9024d2764eea61b933e521aa7b69712c875150183619222936605e48fbc91a202a70a968fd3add1a542427128a80cdf9a66e05f0a39a374e51df00fb97e93e5ef7b77f46148cc5aeb2a82cb01a360377fd4e6c2cebb347f6aa75b649afc0f7ef7df2f174fa6f12e3d81a403ddc7a65abc378f0fc1073c30693ef77742d555750dbd34bb2329528205fcee5056d749b2d20690729cacad175769b64cd31ab8c1a54a92627233936a1abb7a79dd1def87f188a68312f3ce43c2bdbdbdbff9faab3ffffecfffd51f7fef5f7cefcf93445f5e5c473b021ec14763e71225030b3c421a695455a204da030166424d53670a2d63220badf09b832df3b49fbb2cd7b69f927a05d006a44948553b2f578b538d88719ceedb164f858a876d8f2cc82b3e5b960b1cae8a5c3b1781b13cc925e04ea440b7e0dcf6e1de4fe2a38f3efc27ffd97f310cf35fff6ffd37a1122d50c043634dc88280e28b33eacfe8621c3b70108e5899859bef99c870f8783d00091430034d5723eba13fc7098d8cf40028afb2fc9c74089c40703e02d81d0a4f883ab803f42f5809f9041d22b9a2d0728d9acef35240cc802011b9c5fa5bcdf1ab66fba9b50fc8c1e6f0658442b7ede1fe93e3eeab7af36d1f51c5cc4e2d8f1225cbb90ef65856efb5c737edf145dbbc3e29177e6cef8ec72d3e69d24c88040fc0cfd08d8c1bf050519fa1e9a346d1cb5d337cfa8b4f3e78f6ecfffe9ffe972f5fdca8f5ea5ceb7ab98cd380d8ebc2b8d964d046097ec7c479f66e2c372584fc93f71e1755398f4369ce20f8073b4eb355a08a4ce3c4abe5aa1d4359ae8c7565a29543a31a84b36b069d180b2d2db5e1bcd935876e5a56883deb9ba09274f20a1437cdce4005365d6f07200ceb6392e7e330ac96e5cddd0dccd7e5d5256ad73a3106f0a9f2aa1f91a31130643b1bf0239c2b688069b703144d76b4112029a00a81b08932a08304da5b20524088a8387d3ef2042219ea9445580a9816e903c4581a22e5151a2370c538c82e2258e03e5838202d38df3a026d08836c383e475b23d7942ac9a5e9159e2c56df0c7146a9f193315022005491c655fd1e8e438802af76cd3da835f234301c4422512110165cb7ed11c71d3c1bfb367a5e554b01bb576f8679021531ef201ec3645fbf7cf9bffddffdef55999994bf7776669655012de7392c001ffcb248e6096d03c7356d8f3d6c143f765a8bb619a6613cf46de78ed30894abf4ccdba1dff5a29f6609b630fad8b7cde4275056f02537a900eb85095688c91190d9bb455ef9be773ced0e0727a0cd2a906ba1d245920d433b07a6c1a059a113d1ec9bbacaba43bb2c17433fcc2c1d7575b7dd8f931bc7dd43678f63bb9b5d3f1e71d840d119071c85374aa98447b477cad1e0c1587819f01fc53345f0e0b609c48986104fb83dc86a234837a3157d660c822c2479506ae1e888b38285cdf0c14272e2f3c82f387554bffcfbbffff700b8265d8108bd1d11c272f93e3427d51ca812061c124ba5498277f113b30379300e5f88b0a2b6a8f850d4c80ba1113de43cd944a076c47f54ffd0bfd338e295c8a34738c60970de75dd8f7ff8937ff3bd3f6fa71ed471beaae77e1ce6319dd80435990bdb0c83f3d8abedfb659d4d285bd01b64bb8b25401c87bf6f71ae99594093e05cf76307cc8027944e2c73a358522cea185cb52827346d708068380aa4fbb11d13248d45964ea359c3d28d0da01e50e844992a354eadb261368b7c3c848bc79bb6dd2b994e9195cbd24fe1e5fd9bc566d11e6e3a3bdd1d765f82c53fffb9c873c00d4e8d240ce04ba2cee127d150a48e090135aa8d5c01b8008dc9399c01bc69808ea5b292d474284d54217ee1d46f00dc820a472122a409bd09e286c997091e451c2e900aa9aaf4385bf977fffeff0416c4a41433650ab427fc00a0074fc77e8b5fa8164f600490536e1ef0141a1a250c118543a4a2c62e680784c64010a40e62862cc3316197d815fe87d6478821b29db59011f78787effeebef7efaf9679187ac006e95c0ec1c986e58d37628ee34c9d83cbb6051d55d3f23f626d5f81c600ba758c3eac569bbdd29b27f2ce17e7f6898f0ab0c3e1e16b0879948980150cd7d5f6e965ac454f9611871f046652028d0cc3ad7cd64a18534348ccc00199989d61a16c4b139e80cf4e9473b68934a3e3781bb01b43a1f86036aa9aaca091cd8bb1ffef42787ddfdaeb5cfbffafac79f7cf2e2d32fa76e28eb0ac88d26410b6809c0836f9450c65a5372e3019e526c29cddf352089143ca346e4d4e543d08ab645339e9a14e51c296c60438de001db50e52029b43c150662f1b7ffceffb05eff067ee3b0ff7a1c6efd3cc033c0b80cc39bc5ea6348bf1ee6c10e9091b43361f01ffd9f2098c286077fb961378818fe4fbe02aa03d48b882a384e44cfcd9e60edd077ffeacffef4d32fbf9a9cbdbed8b4c70ed53bb72310df798f90e0c7a77600baba61b4424cfd040c17510f83dddab1004659777f770b1c4908a1b84e642e428252536223005d28f2bed4ae9fad11be1d06e415d04b73942258ab374a838b5c84891689820df773d39ea164d9947aed630b2186939cc71ef93775d326cb3b3ba73839040018160076fabe6d8c8b2a5bd97e9619f0018282039fbeffdd3fbdbfbfbfbebe52262a9da877269c93e90420226200276c681cb4d089c568c32bd4521c488b623dc5f25412d492c03784f9f4943c3d1537d218a9402877fa312e7fe777ffb6b77dd7de002e108572f1de34bc9572e9218b9998e73d0bd0231ed219b58c57dee50b7df7d7f1c3837765870da7487bc646dd3e0a251a10ff619eb9845278d86f9f7ff1c9bffca7ffbc481617ab64e89c90690fb53a0ea43851204906dd22a49f861ecd875f02dc3faeab067be02a8c83311a5aa2ccd1d6ae80a2e580437f562788655695081960eae9e599ed8e886f9ed670f18b2cb3765c0ae2a5f32518206616b82a1722407d9a85fa6626f2ac5c25460e43be309b1c60ca1752aceb0d521626d70d5d9280e1a01fd86a71c9e052603351a6fbeee2a210bdcdb31a074a4563b2b7284b90d922351970191040ce098889a600444190804e1042bc8066443b51eb9dea101fa4a85271527b62836dc707f03ae971fc4771271922206d0803499de27df977feeeffa85a7d0053e8a663b97836b4b770a952e5f5e219f605ccc18151a791ca9204ae8b98f0dd3ef0f757c982c8212b4eaf60a39d23cc4623e51c913b489b4dc137dbfd279ffce4c7bffca99d639a17c0df699ab8b53668e1a33102960e12030622331c6227cb33089f3a4d4d95f0d98d765ce7e942f1671f7d08bbb1e06a55a791f5eb223baf8ae3d4a3e9f318374883454ebd6a75761ee725833f1e5244cbcf67b5c9835bc22915e27a595ea27aa27894670a8599ea8bb3ab85ea1564c26cce57cb1430abe4b2926d77480df2aba8959aa32aa00ef27a7b806e4f8a4277ed0c9887d74282520e166591aaedeeeddd761b59b2ccb314a08ad6d08a8570824d28be7721fb5525fcaa2529ebf11e55029ea26ae9c1e9457ce0f42f3d3841316094c80b28ad8d46bbcbbffd3bff5e961311b6edcd3cc14b5a08b46af118af50272cf60b1002bbfe7a67ef7e0e008fe778fa6ec36fce504c387fec49a1f0158394846f3a7d0b1eb06d9b3ffbfef77ef2e39f402827e05168cd19820c0869e791a8da0dad897e1ce199a0a6033701e1d761d226026351cc704357ebe566552d32fda85e6f58cf5571b5aecf13883857b1980a9f67a1c88bb58a99e48b30d7252b799d4204c7718db243cb4473beaef39a6b5da250cea32f0a7c355b162175ba32930c7a735d5650a71779e183e21e8df58ed3ca30efda03767673b7cdb30c2029b99b267f79be243dc7e10738f41a084a730905fbf5575f3213ab728d6fbf8b962451c391d314a1534b9e1a8fc409da8990f6f4125a0cfaf914270e22fcff7e0c6d4b761bda801a1c3f808206d0c9dff9fb7f27c916ddf1359073b9fec63c1feb5367347c1878d343272bfd973f84bfa451b041eafeff2411796fc2007c16cdcda1bb406c6c82bb2759bc6ff69f7df2d5a73ffab193888c152667030e32c8083c428d7b1a5f00d80438275865f20fd3385406164a9cad2fa4b7d7d1296157cbfa29ce6ab85b8a2e57e9597d76514dc8c3220dab7a6566bb59e428033045cddd7251e53e4d57fa02286ba7755e3cd2c9e5c2c00c6faa7a310893b12262ff7952c6b5290a649c5217cb0db2a94222d7593ef047672510334fb344cb799a5228aa48514a6c685c0bea599d55c7e351c301e3f80e7d024216b14a5368750bd9a2692c6ae06eb3581ad851127812b0e891e7600b1ab4a236442322f6f817961241a36139b841daf097c42a9a98a4c7495b80ab4eb1e0f83a1a994af2777fffef407f9aa49ae72e4d1776eef0749a513954d7104414b75382bca3660a18e2f6ae22b1773a04fa4b6e15c91a1da01f9f86b0c41e1d8339b35f7efdf91ffff11f0f91a5693e1c3a90e4d0b43183e468a4883077c0686e47eedd3c36f53a5db374b929e0a78a1c5e89d5a9bf64ac5c2d9fc1cdad378b54d586a752a72ac228682b920c96d29879c8165522742955897fb350a7d4656812593eabf1f94c79536632bfd0b9824393b216393c33149ad4f60817c293490d8a43ce668c5b552619afe272599bd6b3c5f2a2aa6eb7b79a06028718f5aa2cbc1488d6d01ef8aa8c3d7e90c150a646c1bcc1216c62e8e7ee975f7ef9e67eab9a11bb46d2a33ddf55188c31b51e4092da937808ad8be00895c0c5fdbaf040032805848998131f430b43d523c4a439de11238aeaeffefdffa91d1f4cba7614bc0a0971eadd39059e8a997410fd18b093528110191c895f7917453a087c0ef942826d7e07f4a79033542ee8edf6e1e1c77ff2bde7fb7becd90005e0f6809eb033e3a1d609f034a14c45f6caaa545cc7f5a2ae80f1a9abb8be5ed56bc65729df24e9b34505db0ef50fc84e70ba6594b77b3864fa662a63cf7892e485014226d58a31c301c9f912992c0a6d9c4841b056f04bd46701d7a247c92b8226649ae0a95997e1e84c0513ad8d2a988c19f503ccb0b4c2a8546790bf40cd31cc4801db434bc023fbc3a11d47f8d7f1d84603fbd3b922335d0bc32a545506d76e8729cf73dbb9afbffa1a6c39bb49960503fa31018e1ca781da9562778a181a17ad86acb433d419a12b2406a4eca995bda38e38284492b2140dd2a3143f6cffc1dffdf7ead5475df34ac9c4ba21a142440152f828f49c24d53bfec58353b2d0df777ba5382b698c21d933cd54b5f80e7d849c07f63fb4dd8f7ef6931ffde293245150b708dcf1703000985c41718034a67ee8faf6ac4a663b0531d52554103f936c5316e7a58296c1095dc0e2d62a8b437298ab8ab3a31349c2022cacd1792574ce339f81b0562b3ea6a28a01c807f8b1f8580e86ca8c8c2213fd21662b184a532cd1666eee815ca2a8e4d80b03f904c7c175c17496fac3115a56556b1a643fe3b6e30192ca6483e82b9345be4b58314cc7791c1f8ee3f96a0519eac611278bd63a76233c24c491efed02aa49209fb41132e369bb3b7ef9c5e7674fae965985dd01a2e014216bc9499ce80628499c89909c480e6d9e6419b28ccc19c91754097d006fa1e5e1a9de49208ae2ffe277fefd345bcdb607b22b63905d142ec4e614a477fffdea258a1905099547a300f8410da5a1a8d706f972523e275af748020fb9efddd7cf5ffef4c73fc6f37186d33a45d74e125a9541a448101e14695521cbcd6a999c2f8a8dc9368ba434d95559107580a5789e395194d8130db6a6256a273510b4cb1ce24722e4452a21631380cf224e93c87470a344652f72867a81d3648a999907cd4a405ca78b556059b559d0202afcfcd83203470fd6061f173c85692e45020b934a3bf39905f01b53be7334e4177551a81c2f8a6c4e7cb4aab7e3e4071100ebfaa64714a9b774ee07344e6dca18663f51fecb947ad077db075dd6499ea6c868c6d33c0726414650b3108ab2530f1b8c2df552beeb329909d820134f7e023fe4a8911108841541c16322d4dff9ddffb1b334e040634438df5f9798a6e70077472ef214516c14a8136ae3dbca681ad7c7fe2073b1ffd3ff9015d81be87a46c20ff67bdffb932fbfbe09462516783bcbd1af4ae3710cf314fa76b92eca9495692e85faad8bc7761e1e914f2fd34c5ac90b17d64b149a54934d1e21c9822ace1464cbe61a3900f9c393946b683326c689950bf6b0e5e5192015c69d19ed4725ab20e0d6c1c8131a4881f1e0cd03eb7170a8017880797f087016be41f23356438308377a28a7ac12de0508f563371745af5772bc03bbe4135ab6ea422302ab13decc1cf0001504a83878672124a709eecb4b9e66859f2d93be1f6691a66765be7db89bbc3fde6dbffcf4d3ab8bcad48b04f509b9883078b02a75c0400b510f365ea476a4f923769e11ec0819824626b903cd47f1c063e23354e449572645fd641a5b80edbbe7881fe20fd94befff3aa6efea8c2a114fb4d438730bf474279ea4ea047cd303a4011469e4ddbef9c90f7ff8f2d32fb22cad14f4d1886a00191cc7b95c552d4d94188f6ff7557d86df7e94cb28c7736978a196f506659f780b55173b1186562f7533b5624a1878c54f3cf5d38876b1a877b8ecb9656c93f2de012d039c7852b0115e258dd8db2c5cd4346823725581bf50498974ca84e3d8ddcc881520564165d42870075f6a1aea44e1968d078869166c542c3bca75688d7135abcaba2d995d2aa45d8144beaccb4755f5f822b5537721f367e5ea3c5986c68e211e104c903cea4031e8d8979f7dbdaab3aad0a8e237af5ffed77ff627383808134815c406258b0fea533fdca931a9e5c9f7719167b9344aa16ad384691c2e694ad21f278c84fe40a4e5dffbfddf0505d2102bce90068ca8cade850d1bb283f037e25ca8caa8cca8df3d12d39ed2814015ff9cdec40671ec63ec9aee0ffed91f7cf2f5e70053ea8e57920cd349de0277940f0b081006df96d4650a2780b34b60d198d549c1e5a43910335b196966cf4a28f602a1c0b1f15487b967aa0f479c23f57600eaf4a266b0d5c1d2916584236c3272c5e20cfd6d788976192164889bb5e604755194c03be9c739462bf484d60232d2f42b4f9d663a714c9f13061e8f3185f11fe360a4f7b0155aa76298609b1c1a548e42d5873dd4aa68ba21330bc1c6b78763926b9de8e572097b340937ed47175d6e1228910c420e159698e79f7f79b1589e9f5d924b40bd9d2a84665f40a06b49c38588e5a97aa89d9d4780d1ae140e684614df89b350bb78f02b9ed42675763a859feaf4f46d8acdbbbf960628a06149b91078e209c244429836e02cf68d9013c222f0a741e397cf3ffdeebffa97d3012769ce2f37885399a4960ddd301e9bb6d91e6120d7d5eac97a79bda86b699659ae382bf232f551cfbe980f3051d8a5acabb23c4b37d7325b80dbe67e8494b303be50ae1e5f88a2d6591e2c25ad2f33af82ac2a0188dfd4f36ee40aadc604e00db064121ad93115745a8899f5c66ba8b7911805993348912fc04de43bf204be0e5688ce044d06ee70a54f7b59d4e27c0d93c6b28225a9f4d3466799df650a9e526ff2a2e30fdd611bc73ee3f4a93882126dbb87780d43df24c6ce931dc23cf60de0ad4e8b3ff8833f7c38ee1b3ba1015131685e34b7738e4280763c75d0e0018e1e65e410b7d38bef580df17bd7d478801881d388f3e82784848d3b3dfcf5868f9f0249321655cce1f7c9ede325fce2bb8f2035e803ce0f433f20a2d6eddfbef9f33ffe6e0571b934694e6e76b35e0c63bbb42825797dbe78fc68d31ef6644c234d363a5bad94b48a3ab03defedc4676772480dbe5cc54ccec1b8fd41e51aafe804bec5b360d2cda36e9870c2795d7085429fa44a182406eac602206d3425533620e1500940c402a49385de8624f3384db18020f721f5d048d0d326faf621f2d1a1d6dae0c7bbe80664908ed0b5229ee68e56cf9eb061142127ed015f94cb84a58b32fdf8d1b264325f9757c8c97af1e8f21a2d0e7e198e8d4972e662ae936596f55674ed90e799aad23a2b4d91dfbd7efb077ffaddfdd0e12c805b0031d4038505ff213c108de0eec400599067a8602847a5157d060d1740d4a71e388a4f242025144494c8ff21eba8aedfc58638133f298486f50ed13a0ba0a4b8d1768a1c32e8b4219ea3834276fbedee473ff8d77ffae73f79f4e4090cbbe601f2ba8f701cd3972f5ffa30a7a852eb90c68fe11b325968884dcbb7771c6efa3848842993ab492f9428d7e7c57a3387890e1354c73c5a87ba2baa62b1bc9ea6838346ddb73c81b6d1c9652dc744225413b885913c9870fce42ba45923c142e1549c69620b4e0558d5f4baccd4e821367122521532b6d19d4535c542399b8bc246f84088515486e1f368a1c880240860021f10a311c920eb256f9480bbedd742dd347392e7ede180ac7df2f4d1fdddb6e91beee7deb1f37a15b4876fadf36c1ea729d834cd3efbfaabf72e6ba6141ecb99ce0ecd0814460192180166a28167f84f642d5affa43c281e347909a13945810a51febddffb1df023428da7e40411c4d37b4902f081784500657481e0144f4fb547413bc50f8fdf153541394d8dd8ffeb7ff527fff81fffbfbff9dff8d6c547cfbafbbb76808299de6eefe91febd09c682ab8af45a5aa2cbbae0b6347a5668017a801c79605692ad0bfcda0554d5e9d6ffa4313c05533c80e6e0487046e63433828884c1743aae2d8090b6f3200a98299596e18bc0a4f1b2aa310eb341e0f9183536b390ca07fd431c240e7e1525e4b3658e426cec4d16b963540d782973e0e2d37b9df09e06d84741b60de80ab230f136a41f5b3cfb807bbe2b455a26336c1fad984a7d0019332115479bbdb9d5f6c5061c36467842235cd6d07daca4dde0d082d6fa6bedd3e8c3cb9bcb84e90155cf5de65c07cea6c04632324e0ce53b59d9a1d0d8ea2c4492354d485f2ce2004488d53dd512fe789f088004e1186ab43fc407f04c0a76e59ea9d41cc4f4587afe25f3cc55f6c0e0a4884b7aff7bff8d14fd262e1e7e9eeeb37b7db3be7da99a69e5936cd8bccd4f5e2836f7e1319a54dbed63948aa9640e789a5b9d8893500d0234442d72b274d17c6de3a3ee11cac5aa73a2f50cc5c41bab970374cfd2e34b348748763592c41345a19b00cfc83c8568c4f08c41c7319ca88ac75418fb3c3feb8f33205bc82f718dc602fd422ca72255c0f1f30a09e65cafc433cb04c9e49b04091070372da402eb0bab43689c57a4046a7cb90b1c51252c4a5a2bfe4c3d52417d9a406f0dbf6d4aefae9d9752ed271f417cb65516cd87d9f17a602eb4fd68854d7c972917ffdd5abcf7ef033fb707f88711ce78c80114485608012a19322c4bf4a0de4689a67d8101df03b82845da0f1a9ab1d8ae834b5e69d35a00dda84a411d93e5004b88db40c34cfbb77f14da415020b5381c8d12b11f694ecc8be6bfff84fffa8edc70fbff93428398e28035e71d3580bda59d6257eedd0ec810e2217898cf8812a5bf215dc7cb6013af1115622ad534853114b7c175c321df660758eeff43d5051d1e1270c4eab9cd934b1ba0ed358e4b58a2ca5d007150764acc32f089607a64bc5ec007958ae60e41592d41f2c1f072427949ce0ba7cf461e417c10c9e66b208a37259827ce06d5035094a3f2f645a3dcb53661254512ad7f59c2e68f002ba758a920f462f5199b1b0d3ba4a127651c947f5666c8f7e9c5edcbede1e0e75ae87de76c7c3048cef50766d133a9f1adb5a932eaeafcfb787dbe7fbbd82534b91849a601d213ad942b4180ca800ac42d0cf40524f835627d2a39607ba4af21810db68187296bfea762150057d6a4b534e4807017f51b9c05540fcbb9a7b2767f12b7897c412fcdb347ffef39f7effcfbf6faac4cf1dde703df5d0dc1c46ec56683d347374900bd3e1617b5ee74fd39272add98ac1d756f768aca52acbacceb410102133ce0550013547a3b8c1c579a2eeca53d713cd3f68bb50ae813d101bca4d2aedb4aca456d4776100bb8e7bba24c67838b461746e8e1a1e9fa5a98b604ec3b2eb98707f442ca7d08d8be23df3f80afe9ce69268cbea2bd81745d60e5469eddcdbb6076e8cdbd7a1eb934969f9482c845cbe7766de2b8be54286e86d719afea4d2ece3274f8b32df1db609053e457e43e475f380e302fa3ac7c7765493536e04b90d41e09c8faeb5a8b99342494e1d5e08092ad05b87e68504398505984a66039f812143eb2362c6bc9b74732a269ae08607a85343d22792e4c16b84c1f88fc275a240141f1ee0cb08e7bb5750cb761aef5ebcf8ee1ffe51b539abaadcb991839c193fdfac21178b227b7a75a56970d06534a76578628c559312dc29364f431b652e7518915bb01140d842ce23cbe112fb300c5c335031a9341ac32e989f4965895cd345450fde52c7aca33e6ff0c451ccc8b98a144a889ada1f90d2fb6a653448c2e2e7f542bac2fb54e2187d659afe1576d9b437b669210a6125c8a54040816dad850aa4e922f0a638ffa967101a8032edd352f35e578bb56d1f3adf84224d11613b6d125d63a7bc295c308b2a75acb97f0853ac929cb56cecbaa7e7e770c363e4d6dbac5a9ee9fc225fa443f8d9bffa999b89ce488bb09346c696189326848584178ae642a5290c22ce172daf0016082a6c376124240b8918b28df81678d24e13028ecffd2af8a0573480a54246f1e193d8f073a461f1214881deffc91ffdc1cbd76f37ab1a46cb942513bc1bc70131e06c1ac6972f9f03b6b1cf99fa30bd4385e07021f0844f37d0616104a561477aa3f30af6339619380b8e3bc035a9044a88f2c58f9106d2a9cf50a48af560f5020700531e8f962a16189b1a210e6c4a630a0b6c600ae21433364a4403fb2960fe2a1a031b8e08844990ed46eb7e12451866f85f29ac6ba85713098f740377c681a98c47b83f8fd2473e0187e7381c2457eef54b2b7a0325e1c3a4a1cec452179e23987a7db9367e5e250a923bca34cc5d48505fa6f1de24cadaa94cf369b6e4d1dc805cde1e6ff66d4b1c17912a233073a4b92a54b31ecd8ea61fa1e8270ac10c802147ae70d6a700117c22c3d0d0247fa4c0d7507c68aebfdcf02104ecdd63587ed806bc829fe8ba6eb6d4413a8cf38b172ffee2fb7ff1e8ea5ac3620ab9bf6fb7bb5d9d27085e3782df1ff019cfd5c5c5faf1d579aa8bb9194b64fbaa94c0e0614e22749c4de1810a4d57270d21ce0332c9d44bf243606e96e125ae52014265099895b4f53c8b19d08ab665c2427ecb798258859c86e4f4b280f9a3a9d9b2cc043f76500b3228e092c0ef98189ba8d0a826abcf5996707b88c932cc5a1826add74020964310893a07ebb941339dcf53c372c84d2fd7832f6b6f2a9606b9de085d7522c9f24d6b16ac82edab2a11ce8a7a9a469808e5841c70ba566762425573dfb881cd73dbf7cd76df8ed3ebdb071be5573fffe4e6abd71dd2e89db487b976f41f150ccef4d78dff0e484fb682e48ca34e38b085c6419ed014d87bea2007e7e18577a2f4c48ff480c6ec4f0f4eff52b16367ca7b12f2f3f4a3efff3957c96299db7e446d43c262b763db4408110e536ea0097b3c0d214f8ab23c2b96cb63124459c87515aa0d76ad124503df6116d60b13455961175dd3c80c3b05922aaf0df4854d8181250c7b9823903642d3863482f2d29195caf3d4c3330ca9e4deeda249835a2c58c8a6d148283354e9004d2fa501f127aa1e850bc3e1a53fd5a5c4579764a2bc8af87db4249ff308739200c307e6660d838fe246961f53f2656c37413236dcf4f735b39a5b110f62de25dc80b7835417d57a809e00f0a41e155a70be819df2bc1da8c3c168979765ca264bfd06160cfff2e52b34ae1b80c364dc709860284404ed4c7da7a7ee30b43cde42c9012d6342f33aa124e1b84f5de36828a0aa83148c90a08814b941eabca70dad49f14739d20f5009e2c7105d9a62e7c35ffcc977ffe2fbdf3b5b6d00d255592b1c4f5ae69919226f3b20074d8ecb525da6e069b424704914cfbe532c36ac7fe37a97cead4a50faa3714d3c3a562721665126a2d672de8711893343dcb35405e3a53d4d9f459a56098b2d7418e3bd1a2103d0e8756a9c70103896890c88e7813ded3d3c1fe195d01c81f113f5056e671a9f9b464a1d5985a65166a9c3001c8eb2f023b2f944110a8de74456f949fbc9993403e9d344e78ba762dccbb4848b92592292455e15666cb35c045170e0a237399bd7699a9461e261b7dbb9a60f5ee9cc000bb5b3cb7ac9a9db0199a0de3b3f179630f178d842fb2311de6d0487a72e1bb43ccaf134d386c6f9024a8e6cba9bbb1e7fb1211cd0ea1ec1c4d768360b3e19f0314257bc822f8260e9f1afcb914a108ff1290fca60c3d0207db27a7371b6b1534834924506642152d6ba75019706f521b1bf7ab97af6e1c78f9f3d554c21f797b9f2a3a4a9dc39cd99d2491acf9f511f9e4c50dda030dfc3baa0bd9570233bce10c15a0bbb3b522719532600f2a4a8954cf2d0c01c247e6ad90ce5c6589673bc094d37cf3431034ebf12806bca3f23dca4839e9d425a6a90185a4eb191ab01f08616c5c9ea022c23759e032ee45cd2e08e00dce097218451e3ed7cf3362cafe08af41c336d61558f73d0599afb3c5d54558938d2e5bd48fc021690c50b536475d5d2984444b3c207f4ed70180695f2b7cda19f2554eb6ab3dcbd791d619c4e661ded0c3543080a380495002a159d2fde423cc95d384f0586337a4787f41dfa380246a97142507a0bafe233f4fc24810840df91229e22f2f882775ffcfc8b1f7cff8797672b143d6a75e7a67d77a88b02dc9be9d453e1a8dece3e96e5a246021d07282f30ee7178e878ae0ac8ced12759c1162b888b74b311b3457947e45587f6d28eb9a80a203e75846446e2c09544634803a048c656d3648002681b539d10484220f119358f1f49eb0b1cae981d742c0f8d98a8b32dcd4636f791810e714629996366fcc36c72a9f4cc0bd4ae601313d3ad6d470e99199da961440a4e1347230a549609f457181ba6f271ebf01b658e3202494466ef5c2e6b3bd2f59ea076adcd34cc40c9183ebcb87a7cf518b99064863352296fdfee9659717c7808b643c36f8f6fdbe3ad078f9c7aaea1163303239ae29cd0b41cc21896051619c71da9371c1f0308e29334d641e1a1ba22e2a454811d3995230a99c28e50fe3a78683fcaf3d31b80e96efff0831ffc9b7c01332c0e8716244272cebbfbedcd0c01884ae53e2f1675512fd615ace63c40dab4537b58148bd10f4e825f52394b344ada7bdb6e692002006947a48d82a4e40a87692d7e070d2d195df238f260b2241d2f5668ef27d7cb6612e7cbcae8ac07b8c3770a59d71b371ce9d2ddb9c56b007d11accc975e83bc26129666c9a9d5c00b3ba602e2cac6d18e02dec13b6d96690002c03b0af8972942310dc1cb11901e0df600e1072e913478269c2d914aa8a24c725b36ec626495ca20675b6feb74e6a35b5c56808475568deef8f2c55b9620162dc0d7a4450649ef639ae556cbf5a3e5c3ddf1b3af6fa9378a86830ceaa748c1e22375ad50d7181512365233efb0101fa37934081ab8e3d7454675f44ef4a0d2083cc9e9035d29f4a7cdcd96218693a32eefeef8f2ebb75f7ff9d562b3421a8029905a3835c3134b7dcc092428ca862e5fe8fae002b7fd437be74fd78601aa404ec6364085f2ec9c5bbafecf59c155c72d974bed768e7128f8192dae6174571544cedc1981b3afd4595d869b11c7fcf2f51e7fdf8c7dd3854d615d26d3b4468bf334a1d50ab43ed9e50e2909c729a11851d891ab52c559a3f6fc644252ce7164eb257c964206d8c677073497834c2e05d94a3e85948c932c211f04cbb5ec60353a409dd68556c05f1f7ae889b528f95c430b2eb85210b9dbdd3e33c16d8f85887787edcdddb1bfdfbddcdd6e8f834fe163dad24453256a6a71caae5546f9437f84274785206c7ddb3decb781889c7a6108294994e0f821b448662242e4d1f1369e2a942a153b6d546d547230592467a93b86021b8826b191da24f61c829b63ff173ffc2e53fa627d05ba9ba6de4610440ac200844251ecdbc3972f5fc05424d011537bdcbe00882746cd764eb37a950277729f725aaee0d8d31552e532a2ca610a217a521e070705cf80882886b1132ca8556ed38b96f3e7d089d3e1bdab1267f597db43a7f3e565f4cd1c0ea7aee05227b304f5f11c3e17381ffa1e15272a159a56304074204b83a4e5b9f0038f475526f033401a2f179073a401ec1164262c50c60ad60182246c3923afca4d1e0e0db1af4e01c1220ff3f20cea3bf6bbb37c93c431a4dab3b13a031cc6616cb41c7c363fab56ab5cdbae433dbf797bbfbddf1993d73402257591ffecc7ff661e3ad409341be0111e9caae8d7168224088a8f62430567e719beeedd331a607cf72114c73b264478f10562b7939085443b8d317107eca1a9e529b3fcf6cdee673ffcbc3adb8c638b3c28d20a8e2430ea56b3938063c5ef14591147baf03533a61963db587f1cf2c85fbfb98571c57122e920887ca2b9ae05937e2a00eb210c348e8d343029c3cf49cd8ead11250bd31938feb44dc9e2eb37edbbc77fb9b5fb7eecb65d374da8a1a1f5bdf1c2a3b6f11ff420d28cc10cce512786668e8ca9833a7440e681f32286d11e2ccb160c00af90a1de01abea2c8c28e8fba8d631bf24601096e93470c8e6103738669a3231eac4eb4add3b6587015625e12ca9960c76df6517178fdf7b0a5e9449a693c5ac80a1f5ec3b2116971f7f54e51914941ff67398eab3cd1ec74f76001c45fc056d95c1c2223ca700111c9dc2f84e58be0bd93b4a3bc95894251ed2f3a00d5d1b8716213d0a8e3c7d9abe4b1a2e4c88c23436e3f4f31f7eb2dd0f55bae89bfbfdc3c3c36cdbc3915ba83f86331afb115950562064280e8810534abd4993d33cd8d64698d8a0c69ef57b49d71fa5dc0e94f766d6a5d17301e343f3f6e0f2d4e43b0fdf0d316e78dcaeb2278b4c5ca64fd774eddcbbedc30fe86a82779b56a55eae683501688c7256d50a2a39aa49c615a369ac33fc301e30b84003f32a858f7ae8bc811e4938122e9721359a97c0118e3c9807251a9a5943cbf9d820f3302441036d3c3e2c766f6ce65c3b22ea69918bc48a7c0351dd38b7dce0f4164d0b59a49addb64ccc68015bddd8f6b70f7799d39005a299a761dcded39541286ccd797fdc1d9ac6817a4e35274075404dc245424eea72f955022322f4f7d701a5a9f950fed4438797a065a158adb5ef2a973e78da107f7c2d68e9141f62d81ff7ffe6a73f7cf2f871994a08bdd5325371caeae2fef6f5619ceb345d64f9384c769a21b100c3fbfdfdc37e8ff24852352152ceaaf19064248e7203bf88a370f67090406ecd6207438c88f6d01adca73249b5866b4f20ee41812f0f03febed81e9f5d14ef8eed8b2f1ff0f7fd330a6a1f33713c98c50a0691cf06744c1739f3328ecfe344dd228c2615191e6626cbd35428ec05b53e3883b39dd2d58ae9d2851de3e77e682796db6405692333230e234f3b9e941a2a1bc26e3edab4624e47e8d844b96e27600cf78d2944e16dd91a5614e7e71b179c80d904b554295c09ac9bd1d8dbb1a87293aa4ceab347671c7e392f14149b085f7df125d426c2868d2a8b8a88d090ca0cf13cb9040f5bec2940f80c556424e37e8a2778f9b48131df6956fa8977ec888d7e86c194249195317ef1c31f00af9e7d70b1ef1bfcf2dd7dc3bc689a2eaf169bb2d86f7763dfd3240e7208807506317f79b9014d435cf298c9a21ca1ff80c93c75aa3cc4099184fd8e686e07ff3cf2e33479cda620521a706060757b44a2d191fc7a7b7edba11c7ff584b1afee8ff88b57c0e0e3d0c9aa88464ddd9ee6f620c1e820ce42af389fe648d76a8db67533921f4a1515a8f9686c1a6c7f4f0b0af08165b0aaa5ae96a1cf640ef761e9ea48997060c2c32ea82474890c10c0695a96627888bd998fde178a069618bf43dd4d0ed6370bfad83573d7e6ddd48e6d22f34c8b3bba8e7f3c0ee3e0faa66944651ca84fe6abd5d98f7efef306744857dc034b23952320349e30f31404eae14755d27030d944ea54432071cc34ba81a051edbeeb4aa3ef207e27103d7d1f1196b0980a4f8e5df7e6e5eb3ccbc836c0662b05481ec679b95a5d3dbec4d7ac8f8baab8bc384b4cb6d96cd66566923c318bbcbc5629629c1d8ef7286bdffba25e1a118b380b5acb00ce4fb27ecb69118a9a71787063679ccbd6d37204dc0b4510ba283ffae057f5f74e97bedbdefbc605fefadb23d224b0d9f5c7b94591881d0d71eb586c42a99cf433074ce621263d6bfdbb99781ca1613aa3660c6dc8c14fac8070633934d544e2c56b7cde4313c5c2d73e58cec78946c120861e063e5816923193a81d06639f974242a46d7b167abaaea887c39b710860c1a428d75002ba284bb87e627dd0c908ab636d83e4a209fb77afdeba91720cd90a3347a547c39fe4eb104ec402711534f984c2047e427951207f556aa76a4315e22fdea30ac54b82589488f46430e9aa09e70fdddd8bdb9bb3eb73378aaeef20aec32cc1728fae1f5f5c5cd79b33afe4dda16fda2e4df33a85b14817cb7560627d9ed775c5fd58e39084ebecd8b65b1a7d407ab98146fd8fcc76d063f0d3036b41ec96bac6a0ee4ba560da639abf797871685ffee23505edff7ffbfab35bfc859f168b821735cb0ab5d6b9d96464754c5a262ca4b1947c7dc6f1fbcc56762d94e7d205560555fb34897ac354a1d891c13e40231a58103556dac524ccf85441aba139cf8a2b497def030c1f5f18ec92e78b3434f9d8f993750822fa29b3bb87557a5e9e9568f4c2ebddd82209dba6bd78fc384f60a36fdcd88b8ce729e0b82c53bd6dfbb3f52235c9ebdb1b493e0ecc464a06d2e6a444100a8253fae734b88b9ac441e0a55f5521fe83d53f8d45d1e728a8f8033b2d257811c1a3df422540ef28f6f2f99b711874612cf6e1dde0c6c55906ffd21c0f0f6fef6f1ef6a87f54a136d0986c7b6c6eee6ee6e341a5a60eea78f7a607b32ac3abc5ea6c03629c87b903b6a98226bc78b4edc0a07a200d96902fe0338e9c86c783cb8c266f45715670fbecb29a1f9ebe472b0f61bbfee8e9bb07d8785ec93c0acfc5b244934dbcdb3cfe904b76bcd947764c0c73db5d808ba82ce44b8453d445ba42100e74697e96b0944b3064827db4be6b5124d579759afe8566eb58821816dc8c718e3287285df80e0c3bb869eb76769b4c832c54a6ddc1e64a982279686e61a14d2eccc57a99e54eb9c3613f1ff601988c24903cd7cb868543dcef8efbc5fac29c575dbf6b76ed6922621868060d9512d50f45911e63432cdec5d4339aaeedd0ccbffb0f7e0f1fc1f923485410d8e872268a33d4117d194d833a013afbf0faed9b3ffc67ffcc546521d2fb8737b0050fdb065c3a8ed4d93c87085f38b604ffc3d0a779b258d68a472f6758d771bb053d443b14305a331867a471b33a9961e7d74b5a830eee3f02cc730f22e09a75416cb254d793aa425e840e3c0545d0bb965f7df383e75fddd3a132d6ec8e174fab39d3a1b37e74a3c9b53090449afaea61f854181b9a536a665ee16090c6c8bc5c2e505113605ccf8e251051991f071c3c6aae1f666d46d8009cbf2a156f544cacf635f21ad29a6638a26a0f87d61f5c0280e5f76ea00b6f06258b05767de3a7102aa04e71fdcc7653331c8fcdd4f5a7815b9d81b11ad0205d7612babe4795e9900cf3e850d6232d81a4eaf2d97b1f9e9685923449e1048defc246d5852638bd789aed727a8aeca2974e6a077f691edb3b44452ca978490f1163505ed084f6c3cded273fff6550a18d835762e60e907cdc1d0b48315a11a6bd7f7b9725a6541256a210e2eef5edb13b76bb87c94d35d8bc54a7791a7ac2af91123090729e27bbae1b393bf66e62ac1dfd368adeabd65ab4e68ea66e1ffa6d0723e7523385cc94d9d75fdce0902e2f6969226c77b7f77ef2eabc109951f3dc763d9f5a9340a1b1a1d9fabc86499e5406af07841074e164cf1b917338c0c417d1e1347aa740edd68b59a4a313aa80fe15269bc1981b5a7f024030d26c4a7fdb8adbdd9bb73ebd9d8adbe3f0f343d774cdaba67ae5f957bbd777db968d6ea8dc91cbf1f557086c9dae6444aec81a265ea5f7871eb07eb1be7ab4b940cc9554bba1df14cb8cebd9faf5f9c53c326ebd04d1069a1a8fb33bd51c6def4e165101ffbd9333ef5e97bff78f7e1f51c2e711af40dd8c1c35805c450e93a801099e6288d3680efbefffe0fb2f5edf7cfba30fa1a79a69cc383f76b0c13e2b8a62b3b9be3c9fc72126c93cd2988d367c91d305e9e7555d14d250f854bd2aa7be118146259550382f688faed9f733945dd76cad1cdae36ce7ed015139f2d8f4f6ab66cbc606c514c3a4f26aea7b803a88b6bfdff32c1b1329c913b1a99b8186d2b699ce749130db22a23872580899189d0adeb73a5f29d1fa681cc914683e0dc6d5dd3ce735efb6a15e8d8737d09adccea7553fa6881f7dbd1b26634d7cb8dd0d83bc7bf8fa61d73f1c6187dba9bdefb67ee8c66edfaad4cdb3707c9f06038c999504a135dda4e382f55de787d593a78845912d47211e6016c1eeb9ce657ab95aeffa315d1412c237ca8b47e79767e7a936302492e6d1bceb6f210dfa2e84544fd880c4a7de170458fece3ffc3dbc02e4a4e78829b97c2a45c48ce28c409e8a9405f7e5579ffee7fff97ff5e4d9e35ccbdbfd3e76f3be6b2aa356eb4d9ed7365a64218d1720d101d17e1efbc1230ede5e6d56d0999581c38aa94a416b3455cb4f00554883f930de1d77ed0d145c6bf7bd37f1f0d0ec83bf6dfafdd8fee28bd7c36eeae77efb723b0be9f2a44c54ffb09f8f5b5527b119751a25adfcebc3889c8557615c59367b617269fbd0d35276c1364e237848ded4cf0db24983ab8d49d236368598b6d4fb4f6bb525a63db272e9dd16bf76f4bbedddf161ee9aa179f5bc1b9a3787fdddf3fb9b611a6dd70e531762bf3b4e06e22b76312f8076301ded1406654bbdea8898fcc3619bd7eb30d3bcacfbdb6dd78c2b5a096942b64137593b35c4f416af2480562b6861b9457d71b931749936c50f058708d09c979359a7e13fec89e6ce50e71055e1effc035421422aa90f8d024b42879017da85a3a6c951c02a8ed3f0dd7ff94f7ffce34f3657d7ebcbab91bae8063bf791fa877db9c8eaa46e2044e7619886bc2a11f9aa4c11cbb91bf3e53265735ed4d66440d154f4729e07088a7e38f4737bbc03955e97a6e7ec6a599e27ee10e36e1ebbe6a8155d788f907bd7ec1c30d675a36bb7b7b63d385a7e1a7a3a98e005fc27cec8061c06146de8273ef96a7341e3a2be81316f7c9a25b40c1f22c5998196765dcb133b3e8c0128c252a1d18c155393ed7a2ff4541814da672f5ebf7ad1c2fb424d1e0f2fa60619e710a8be6f40adb4caa6c91ed597267191e334dd717f2fa313790a3e87f4f3fdd10d6118e0e753426f5db4ad5b2daae7b7f7154a4a933939b6db21c03de1f3accc53c40be879797ef5fee32bbc4493b089c74e7a928090e202284385014ee9291ea0fc7e1f2184bda0f2a322a52e002a4722414474262a853561f7af5ffff1bffa23a5caf532e726d9eeb67dd3391667e43e82a1e47468dabed350e240adc4403814dc1ffb6eb35e17c22f994c1655a6b20c190b48082c97bc77ecd01dedd4e6f5e3c7570b58a7f5d5462e97a5e14a1ba9dda34595af137bb74b0a5dc724937ad736eafeedf6d0bdbdbbcd4356248de83275898ccd5937c644f2c6f1c5864667111aeaf81f98d4d0fea283bd98618c08240f0ee06b8d0d0ddcbae2ea2e681ca391590f74f7d60fdbbbbbfd9bfbe7770fc7364ad61eee2a938256654caaa55c2d16ebb47cf2e8d1f9227df2ec914eca7c49c7bbdff55676ad83914353db693448258460a66b9b5b681a8092868a12d23a972960807e7f597efdf64d6a74b00edc240bb95a2f3ffaf6f562b1b19046d0a227394aaefdd7408a078808e94d2023612593bff70fff215e42d65068497912852290f828f6442b7140e036d3dbfbd7fffc9ffdd1f5d5d5fa72f1e2e5abedfe487de154b9b12ae0def3d942dfaaf5b2daef0fe0066eadc953e02872a34cf2606482d619478ecaa20912b48e4cbf3d6ece2a54e7a3a78bc5e2fcf27a55650b5a00f3faba3632cf63992d98b0d2caaca225b1f21c25a6e2d4d3e5468be5d2e871e8711ae41b750614a5994f167b6c821330cc536f434849c1b750f77006b36b022d04cdad322aeea6604a662c7338c585d63d44b2b0bc6d9b979f7d72f3e6888c04271b6f3e787c65e73885d92cd3671797eb47d7578f1f6fca45ba2ce534674991a562b3b95ac00d05f6f9438bcc974e4629a7c88a3c1fc6eef9fd1178665472ec06ea4e74c118eefb11ec6ab2fc1846805661b224415cd3ba2e9e6cce32d4e669bc812bba200d0587189eccfa499a521d9e1c215eff87ffabffe8d79d3302d587b2c587b0a14201bec09d31d222a4dffbf10f9007a8afe3dc1d0ecd2a2be8f2cca14b93a2ac32f0c8c3dd5d2245db8f4668d8c238217a406cb15e14d5223dd3aaccd7ab7ab91d0f455e6fc716079dd6c993cbcb2a1397174fca7c91c35f837ca159e8421c326879b52e0b9dab1cb2e42c496539cd37f738d5328f39721a1c4f0b40f2422a66d2d0351eaee0e14e26298e984dd004608859aac8ba99123af68c5c428443e3838aed316a150533ed1eca0d0d0e154af2f7f697af6e2711807c3e61e2eaf21cd268a5fd47efbdaff2c5d367178bacd01ca2bb937a1263c54b97a0ba93a22e686e923ec244693e7ac5529f494f0b611c0fb3289274b15e57cb15fc16e42d53d080f9ae69b2ba06b5a0b20015bb7ebf4eaa64993eb9fe18720141a2b23b7941922727d8a4ea42a44ee88ab2a358fad32231a7a161c256c240a3f1576b9da629f2db0466692dd4eca3a7cf8eed71fffa61ece687fd8d90294037af6a48b7c3c35e9a342a01ef383bd7c1f9e0e7005c38a522a5997239147f007ff1c83ddfd674f5a62e13e9ba7e5d2c8c9d68f56a6362e2589e0797aa459de833916e3279b6da5c9c2dafea75b212e6a3c5f2d9997954e4e79b95603e9df96655851105d4b0c90b7f30a28c2e91ed41221ffa91ae8edc454bc202d6c140a6ce873678e78e2daf3649361a680459714773efdc5d73fff6e666767a9832eb0a263e58941fd4695dc9f575bdaeaa0f2ecec95916794092641796afa1fbb946a3a67485869b57425d3dae8c912103c146394c97b5ccc426357247fdf87c5114ceb9629d3ddc1d7cc08e85b3c7fddb9dce1369dc5a701cd0c5f2111c1175019155801dffd5b4503c418090df144aba5e1291a5f5a000a4bf8f4788345ea670d28813de4758e93183a1eba717af5fceb67dbba7cbae9008755ec04878b84c298c2a59b4b0a1e5b2e636e001f4bb82292c32370dd017ab7af59d8f3f70b01990e80280174d976482407a7999aceb4d56e54c210f51ffd07812e282d16a7a0022e576138e1690cbb58bd3c8934241098c7ae0f32a39839b5a20b0dda02e562129612d824601183936225dd1143e9aba96ea3487f4e67c177919b15f54a6b3d26491ee29810a69a86a50a983e373e33a8093cde6ee6a7d95a861f3ece3625de403dd03c003d29284e5191f471ace9b02afe9a27fca7c25210a48766e7265f5d1dfc498d1ea0c16a7d2be80da8c1af87cb31f7ce8e761bebcbe02d54fed94a7bced6d55e420173077d7d874553dbd5c5f40026047a70d354755883a3c5908c023da0e940798c5eb4496a8fdd34821f3a72bb6289ca8d0d376fac76f77f7dffde33f404ebffce4739a13308d3db629e655959545331ef6b7234cc9c3fdf6f9cbd75fbf7d816fcf438f934b0b05f5e49d15fbddb2a8a2704f0d886c08d2f9be03ed42561b24f0c88ab355b0b34f69603c0cadca9c9fe37ca0093fb669602a6e6f765de410c1fd8143a8d545cd790733cae9125113fb0c50c9924097394d6384179793efc088898822cc4d92709d56b0ee327ae368390488ec312039b8e8015847587e87530a4552edf3056cf7b3b029aeaedf2f3c8cfab16d2738d77d07c13a352fdebaed3ddf35747dfc6eebe96a0dcbfd4cda2347c555510f659d77c7b97dfbaaa4ce7cb970d3ddf62d2450aac763b31dbae9073ffdf4c5db9b7dfb708710cd3857ecdc094867a55ebfb87bebf9a869322062415120c982089e7426d5227909d41cf0056fc16c9cfcfb69a30e36841cc13e0dffe26d12a89c1d8f10f9ea786c9bf6786c60259a9996ea9dfb1112b48fd6c92ac58e20f82eafd6d757cfb42697f9eaf5abd1590e6bd81ed8f9d3699aea7c09e38722142a820a96a2ce3a5e6aae2f1ed5d9a5aa6ab470c2c01cd6ee8783dbbeee0f5fdf7cfef2e1f51dbe250a05f1509df14d0952b34e9137c717ca32a4051bde128a6d69e5526927a808611f948ea8b4e8dfc41e90423deb813af1a06f24fea50a549c9668a14be2cb78bbe302070535b158a489a874c6c3713f1e03dff55978efbccfd050bba6837cf16f7b7d3377f72fbeeceeb63e3420a1c80d9b839c5b75dc25a8487df6de2acd2e2e4295a2e6817d59010a2ee2e4ee6e5b6b69ec43259a56ec9f1ccd9eea67dff787ddb6197bbbdfbdfc62875f1c3c1a9ff40ae2f0ae1cdff583feeac149b5e009422bffd1fff23f227a3c6d801bc4ec9d28c547f117c5394d4da2f42f3efb34a2f1482ccf484b3e07f88a04a89797931da1af261f4a95232166a4879b131ac4e4759dd16aa28c97ed502bd6d25a2383003bf661b592b54b938b1c87381c0eef2e89838285d219ddf1e6e5db9bfbceace4346a68b9195e1d5a3d35d5e513cd0a08695f54a36fd8e07996a41b34100dc327fbad283533510c8964c2d1b2d8992ad1fc23b20632dd4159b282cb813328a6598e28cbceccc2aa63b082d3f8b01653157225dc2416269a4d6a47596c9034d354cd999ba7d88edb1d107212138c316b855f9ba971b4829be15dc2509407f8d7661f26c8f0f1ee808c6b8ce9f6a3edc39cd11c1053570105318c8f36abddf1582770e05048340639cf0e92e737befd1d5a9b46f2d36c0b223f2a28fc43c1039482f4a8c068a40f51a352a51188d36a7e1cc123ff880df1c35beeb40e86e166a44527d5fe7eab459625f5e84002a6da9c178b749567533349fa8d69bbddda795e2f1770146a4641805d7d1cb7319df7c7db7e0ed6a60a2e12596e995e19de46d0058716edb6d023477fefa6ddcd97af77fb6eb487f62ebceaf65f02a3dbf9f52c5e7f71fbfa275f366a67a17a539df37a96759615812fb9ec74917bc3edc1cbe4c093792e205e90179089db6152e0299d0b05994056cd4d20f26636dd5d50d51850bc9266c65b13f25af91bdd0e8215cb8b6f17abc536cb6e86e9c5f6cd5776f7f0e6fecbaf5eb48db97b75449aeac2765bfeeaf68bae45e19f26a517b11133906556621d4a3b0ee9fa6262e5aabc128a1d9cfdc6f5e33e5868c5ebcb2ba0d95d3340ddeda0fb53e5fb597a535d3cbe79f14537f6f8bc023f9efa5f50715021546427450a94044c12693b9a4d28ffc17ff88ff00f458fc63f2972efe2870d9fdbbebe79f9e62d58f7b35f7c6eb8442c61c6ef0ff72e8a42b2dec7fded833409e2bbccf3dea235d40a00d976dcfb725db03a2df33c853a1a9acea9627d0e7f0e20456a17195bad2fd0ee11bf051594f8e9619ac676fb7cf7c64fb76df7f2c5ee863137ba3a5b7eb23db43380ac1de6a9edc67d773c7ff20cd23ba59b4d481e879814fcd849802a406ace3cf37e36c96ae36654e3a0d61b9e545a7491d68b5669707a950988a7d286d689c5666e1a3529fea41674c1f2d2ce62582730456f6fb79fdcdf7cf5f2e5977787edc3e1eebe99a378e3c7fb37af9bd9828af73d68f7a1198605f8681c18eceb76da8b68d362e8279e085a5d23f2de0fe3e8b85248e8a6a5f487ca1b86c9189669ba0074a08152965faf8e8723f3ea37ffc6bf05cb614e234cc474a7be182ab6132fa2f288e308605189d48b8df8c16190e0a1977fbd1124cef6e59bbb44d9fde1e1edddcd04f104e67021332b23e2101c8c21c23c7b9f57c5c3ee6eb2112ed04d30d4c4a80504a405bc79a9125164d922cd42c7c7268378a03d197fa0dfa3cb2c741e628d575f7fb5dda67994e5cdadabceafde7bff6921932f760fd3306c776f5f77db165adb9845527ef1c39f74773722ce36f634a1dbd9a80b47f3594418d2c84a5618c80ce6ac0288d84183821aa8c78ceb8646f22103a41a865400d3b62f9daae32a67b371078b068b8b28a3787ef7f68b17cfdb16ca028cd8ef87362036325c57ab74513df4bbaf8edb97773f6b678d537ca03191fdb03d50336e749d644efb5916f3b8d7f5a8e6a17d38d0fd2c4c914a92b1fb712eca6cb55ced872e08077caf173a95262f4c00ba031de13920d34fc311004c44043ffc97d585a704ab1c07448b69413452939ea88f2287ed14447c079f6b1ad0dea1ab3717c29897376f3d8a2878111344c9cef6d1e5859bc77ea2cbde13ec23f271768606ebcd9bdbbb380c6505c5d8a769b25c9edb9e34383c3b6c074df0ce721ee6d0778bcdb34d71c6a867ae4c3ab77d7e53d5e9871f3d866b786be781b917db9b57b70fafee6f9ebffafaa1e9eacb67737f78b8fdf9d63671a6596e5e9f9fe88116be87948f13ea3065bb41a6094cbbc8809d90c000a3987420a325ef66a4adec6d189849f9e22c01ab47ec4ba4645ee7f1a6b1fdcde1f6e6f6c5973ffbf9179f7efde5f39ffdf2cbd774cba861797df6dbbffddb9bfae261f70aaa0a9a4e16c9cc463da5def109d57bd8cd87db654c20483717214c0866a1413fbac03b45b5c88ae5cbe7cfe34cab3b6d2e2f79d0f9922610dc3c801f69d32031c485c68689e940b4284354194e11513c71e2693bc94f9a6d4a688b4f1055521c1103fa28e7062281a6e2f0fd6d3bcfe174d570f4d310263b4cbe325a65e6e1e66674b36b0e4f3ffca85e2e0fc766b15e55ebd547dffad6fa62bd5e2c6c37c62ce4ba9ac646424120c3bc87b3441ce936705c33a7dab7772d5aedf63592f5c5ab37a228bff9ec837273f5939ffff0975f7c7ee85a9b84a7df79bfd9b6dd347df6e26b270f4f7ef3dbfb836a6ebfde35637047062ea391b910b556c596cd20b73b0e133adc7a277d9707e6225c0e1f4525c26e6be32a96410220c63b3f34f178804a47fed115bb6171f3f6617ff3095b16ebabe56d98be7af5f66ffcdbdf514adfdcdcbcbeddfde8a79f2caf1eff5b7ffdb7a07fee8e5da9454bf725c9dcb8f3acedbb9d4a8c4d0d808165218999f25ad4f959b584246bbabd567a9ec6e5b21aa7e6b87fd8edba8985b5c882cca511790ea9217da46989707428262a41a4279520d4eda95fe62436694490c604dff5969e640ca81f5fc05fa324824f78eb43925d05e82e581726dbe188ca59d6f5aaae9f5e2e10679c30ad1d407309e5eefeeee17004f581e733a19e7ff675959a6116533b16a9b68d4dfaa360b6e6537e14293bcd3a1296c9a87219dd7cdcdf6b03250d1d3f56497af1fea334cb4609538fc677f6e8bf71757ebeae3c5dd7ef9014cbc71f9c9bc57daf1f6edf1cc686e64c24c086707f003245c18eb22334e2e5050e8f96d19b3bc65b1e142d1d7396fae97e1a78cc20b59c091a698bf8d188f7b8db1fbf7ad14dc5a3abe53300f204b7644cf9f8c9c7459e36adedf6767b77f3f6e62bd0fa5ffbcee3b3e2ecb679d8366d21275d9610492a3fa3dbfff0b611b10eeca1733aa3cbd4ad4e0ce3578fcf80eb8d8558d580adedcd3122c58c7ab3bfeb0efdf1b85fae177461033c2ad0f9e41cb0a11011b4d3438a11caef1443a81a9aa30def7baa4feabea10db611c0e348a682e9465804ede6b77777769e2091746554a26637b8a96ff687edf600650810ee1cd0189e00451ad31472e6ee78bc193ae832715d1532c8344e6aa12a95aebc91f998c929a50b07a13580a5719af77d7f9ce05fc6f1d9e6eaec7c19d5c4d97851add72b70c300cff287fff88f95c9f9e8cab36599d4b0628b6ffcc6c56f7ef8f437feca61dbf8f95e66de9e6f922a015838809434d494c34d3c38ee7a587760cc682a58133f95dc8f094c12ace0baf4be47a9b020809f9d787890dde2d9e6d9d9792597e029196359a47ff447ff1c42630102a06b25432913ddb032af9e7c4c2d32f607994398e4aace2bee952a57ed5849ad11fc150217b32a39f66f5cb3dbbe7dfb70680aee84f6bad2e775aa4f03d659922bed60b51ff6c748261fb505ce893846d41c85e4d44703e5f12b5e7c4779246be8021ee425ada6850d9fc367e93df826c69a43fba3cf7fa1bcb0c3407c860ca02b637bf8957ab55a57cbbe69caa2c88bd2149a874e26dcc5a11d0e47b88720a67e942a80ed95cac0735ddb2377a0fb22cfd4a2303585167a2e6473f1e8094c7d7573d4837d52a94d5189de6c8cbebaba582499a7ab54bce713d4d03ae7bffdfefbeb6b95957e7166ae16e7c2546c73f5faeb9b66ff60529974fda86998006ed2ef1b4197316768921e54d238ea5afbd5247c8807cd379c1d076f6b8001abcda89a708cdfbefef81bcfde93000193fed6c7bff51b8f2f9e5e9be6d50d6273be2e57d2fdb50fbe735d2f4d16976cf37479f9886ed0159ab7bd4b8a625ec9ecacf6a3afd2b48c735ec87e80d0107d2721f212bac281e61f87f9f5ddfd168003093e0fab0c8e4ca7abf2830fbe895098100e927ae8c165382e8ad4697b47805479a75700a3bf1af2fdbd7ff47b245df1f9d367f03e428cf75086db87ed4f3ff9d1fdeed01c4748bffd3ce4f962b92ced34be78fd5064068ae0d1d327dd8eae6490d23c7dfaecf6e55b644faa5595a8ded92c95559e9a04a6c7977039994fcecb851bd2d4886c63ed1835a2638096dbf66b3179bd58b62d1cbc839e5e54f979be3a5b9e9de5e93284c78f361f2ed71fffd637ffcafbdfce98965d13f7f7fbc35efaa190e33026c52a6a55fb7eeb67c1d0fe760aec742b0b6693bc3499522c4a60869dd8040786322e039c158b8dbd55651d9968f87ea2d518d263b8c51998fd2dc0eff6cdf3b53cbbaccf9e3c4a4523bff5eddf78f6ad0f37b498fa619efaeee1859ba6ac582c8c3256148b28ea7a4671c8529bcc0ebe5ad43bb87758fdc39c2ed6af51e410c4a9c90cdaa369da117a976e7959c01f45d022dd62ecb6fd8dbff937eb22cb69b890ece0bbbf8816fe227ea8423ca6423b6917f9bbffe01fe01f62bed3dc0b0b93705abad206ff6a777bfbfce6e1fe1e47a012ddb703dcd6035d4a0817e298d6a8d53d11415314cbae6f0e4d83aca15b46b160a4ca97705f05f03c65c32aa5abb1e019fd3027799614cbc85414a89a9e57a57db14f1c9462992caaf1f89a65177eb2da0fc0fc24b38fb3726dcc7bdfbcfee8a3c797d22c915efb87f1f625ada7ec10a5842dd2b45865030a2de7cddef6bc5880de4e3dfda846a3a2ed382dc1a028436718e039c49e4f008052f7c7ae49a6f92045915c3c3d22cc6130dda89b9d9f702eead16505f3f6cdd56a59ca6f5e5efce66f7dab666a787838de356adc72dbdb767abcb9d83c82d0eec5048957ea35c251e9e1015461c21007b6f59352f676c73b18504d0b5bbaa1b1d05e49b22eebc5f9257083960a037ccd0e4ae23b1f7ffcf86203314277dfa2313baa480ad2297878f0ee2ffec11feab021474f178d12ece21ffa2062193c8322e85b8884b43250fb50e4fbb681de79381c86799cd1ca743940b92a1620b12a2982e74a93e55006221b5e952f12b5d2465a3dd135b2e0678962f0313a012692acd21159388fba0ee6f25a9749b2cc2067ab7957f5e37c7be86ebf52530f13552cce3e585c9c0128a73eea74b0235bacadc91688d5f563b45961386a1ca2454a5b165a8ca94a0e381a887ee97296b2d081ca8df583cc73082646d227a8edc08b5870c3521b4b393b767975515f7f58bfffd16c96e6ec4af8acca961f7ffc9bd74f8b6f5f3cfd68f9288b90ce6fc6ed8d6e5e74029e73b17e7491adcfb97c6f2cafda556d8b2c1e5956a47391d745e564117499337ddf00f7e667ef6d06d7d304025a92c4165a25a9f1101d4d8f8f5765b142333ad11d07117d9ed06d4a7e557608c9bb9916bf1ebba0470818bd488cf8aba8a20c11c68c6e9320a1168b44af2e9f3ddcdef8f67409bd41b917be6df1fed3cbabe3e1e0ad7bd86e1f0e9d733445a348a44cd2c3be0332cef3aca519262e358f6529979982a7857c493395e7a25ec6f4742508d37c8e3e2de228d462c19529eb6ab9ae574f5667454a7782f57eedc5e66201dd851c9367d7109fe5d5b3aca6e5a254ae210269f9de79c2ef84db36a6a5585feb4dc5ca6b3dcdc8780653ef5510336804e7e7f6b30d332f99315a4e0737af7866e56c8ec7211eefe2086b21254f17c5dad81ef28d4de6fc3db8ba8584815cd671b75faa69bdcc8329e18173d55713cd08c0b362d2ac7be8fde0149a3ee6d93528b0767b3975591a55c76491cf8d03c9dedf6fbda53bb5f61e304eabec6779ba7bf9b23aab567519f8f840632027643cc505fc47fd94a7d2facb10fe2ab400cf77b1454a60c30b88a2f42c134921d5cdab5733f38bd5dae29f080037b39b21edf1cdbb5d8726189dbdbeba860daa73ba53d5fd5bec7a9f2ccfeb242e17d5beeb1dc204e337efc7ddf6e0063e8c9913c025ea9b0fa94884ccd3100dcf2a36e15f9dfab9cc61c796940cab62e543cd759e57da1ee9168c4ce7013a514bbee3b4800c722291fd6ddc5bba82a99b388abf9719c2d5e3d0842a2ce789709d82ea0e22ba5ec55ae6496e66b16da4767e1c10fec470bad9fb9ca5c015960a36733ff072210b93245e2db287cfef58ec42597b9a365443cb65d562bd79fcfef945a5af92ab73033982145d64e5ea1bd91c84d0a1df653c64ad82b04ab2daadeb3c1334a76fee7debab324fd739042b5332952aa90a1a788119dab53ab247ab7a1ef634bc024d887000bec8219e663dfdda5a9c6664d01c60fa0c428842d4128d4d1215a175038d090ec378dff4f3f1c17bb95cf2b61f27e74a534d8385e1b3902a483d2d69eea99d22a721e06ab3a015542129af2ef6872e0172490baad6938258ad39ab95f475ca8a326646fa36b6d497423798f763ac165c4fcc0af678c14c229305ab127f7e01c07402aa73c979c98b9caf0ac9a6212b438d0a566c456b848b6a62732a408a82c851ae215a668324e925dbcefc4a8b2daca8a2ae23317835f099c1ffbbdbd33a5f4ef064a5ec084ccbbb41036346c621a7e41bf8c139bf14551a57d2666bb560d2647a0daed752a6ab854dd3b3ea83ebe20a86bce0a204aec88c0844f354a599eddab00ca01a11e7e51d7f7c7999b2a958941f3cbdd2d8bfd3a99115dd3e71b4746b235f88d88f2d1b0f63b747c0330655461b4d467c373386d1a530346de0b4c13cd03f34f2842870ead17ec785c01128c4d9dbd76f5fef0f0f3814ba89e7a105b768a02cb747ba28db7949dda05aab79b6554eeb85092f60c99d1b5f3dbff9e26dc375564a334add367362612574b12c89ff0eb3e0798c473e2b480c195a1dac620060a63dcdd008fb59585ad410682495f178657de9b2945552e8542dc045596295e2893a2fd876ef6cedee7b7e38f2143fee0dad471a936c15ac77a078c985a3f549c4805753ef75a0f9f29603a1131175496403f871a92f015b2a4c5678081f2f64ed7902f5c8a3965ef2eaac5b567e9922fc1cec5e0b0749024f5dc1e6d67291b91067135899ca5ab9f9e8e292ae3b94b2073d551ea83a045ee173c2c85465f05373db363d04c27b174fdb874396261f7df054a1a1f4c2a211bb03b20b514368c8e09d080e11a30b454f5da1e4e839a7391274f70a9abc4817d79fb037267453e2dc015d359067a04b7a7bea41e07ea219e5f85204e7a97938f6d3b4bd7f18c6fed1c575f490e753f4e1488a0b10271c91a1757348e1b5cf6a2440408e63af492eec0eaa17ce3d20879061108a687588459d851c762de5daf31577d99a50df14b15c409b863c8f191c02442cbeb5c0b1c741b16994a463a28c2dad7891e3e30dc4ea609be86769ef593c5828f5c632d4069a6070325bb0b960c716f08b9f8a7e7f5adb0bda52c465ae1f0e2e09bdf53205bfa4e3d0a072931aa9da94c0479e05546b868a96f02d5ecc16893667327a6926e54b7ff4623b099a7d7c544c1799ae3dcdfc1f1964fcd485593a7fdc3dd01ad142942a69885e06a1991fdd8bdb7b34c3ebed43dfb9dbe6d831881e9a2c43936020144f2b5aa2415084c013e0291ea3f0a0bac9489c7adb68fc9726d0907d0f6ca2491e52431fd6595eaccf2fbad9c162234ec10d8e8565bd7c7479595605b4c9ddfdedb1dd2335f1913ccf9b63ab5c78fae87a98a7bc00ceafb5872c74f8b9966e0e1164017de8615ca8f3af208a6324bd5850795473c853b65a7291cb59c0848842a7b0ccc54a9834f67092f7224d68894ed4ccdc4fa812703b2fa5aa019a4ee4b468a510caee58ef8d34681b483e5e0ad441dc23118772e814197f27ea10cbd1d3256b9a9f2d441142835794be9d53fb30b55ecd1dda8ff30ed96d94e7343e3fc05ab265e2d2a5232966151c33a7717bb42d139e6ee99a6990212d4ee5268393000448f8d27c717d9957fcf6ee4da9d2b2cca7795cd50b1cfb3477578fcf808f5059e5a3ab711e001ddd0ebb361433587b122b1073b4ae0ee127be43713c291a341abdcb6035e9251a0e448d91a5c071ca8606d6c49b9bbde5e1667b6b2d5d11086db75c2d4d525d9c3fcef3f237bff39d1cf4667bef830d807497a61a39f9cb5f7ef2f2e655029eea07bf6b52ad354c0570763ff1d0f276145ab3008d64112a18720f741b3d50be2a505cb42e2187c9333e6a24136787ad1a6197479de612beb5974e36b603e22506366f6c35d761b962bc5249361d40a70ef94933d88e5e679b707845376446a6f05698ba1729505529a39a5dd8268c21211b911a761cbdcff04c54528db27ffbc0e516b58b8498fb801c6429e0c545b58450c20793a4487d12ab73a8b0e0141808b8a139aa1c15ea652c0127ae9bfb2ca52c73ce0cfbebb4b87e72e1c1e5c370b939bb9ff6cb1268991e5a97e7baaad368c366b12852737f7373b83fe088819c82eefa4d1be28272a4d90d780c0003ee9f140d9d1a8952a855d232a751a7c98edd70dfde423b39d623673e787ca563b8be387bffd1a648b1c5e3fdeb4d99b6c726656253d668f9ca28ce4737f65cb31c7204a5d776ac9fe4b0e3017a4e0c7d3bc3e84798b39cfc28cfbc5930def0a9132dada4418bcdcc56ca59123c0ede176ee702f8088466fb701c67607517e4d8e87e9480b8d011ef39e8ce198a8d49d8e718a162c634f09ca1a5f38a9ef784738a23764ad6262d56922120c06f4d8b97f76d0c767cb5732ef095f2a660ce405e56d1737d2ee5e0c71ce4745af20350a26209cd057b0ad530874515584303e6b6c52f414cd1e5e7387f407350b4c2ac298a7eeafb21ab685af0cbfd0375e564c9fafc6c0fe90e085409c08d4bdb7753bbef64220ef7f721337638dcbefe4a4abac20938898069c2505232081745545074098af090ccc5c9275290ad8bd6e90c2e9e6e9a0e1dffb0dbf7bbc3fe30e4467df5cb2f5ebeb8d9372dbc85c9b2572f5f4ec303fc52e0f6b25a25dc27ce219c5725ec4d55448e52962209abe29e4d3131c0c8b48f6e6e7cb7a775946104517af796a78cd5040c8a1ff9916e972128df2b138f422548bc98d1d5f1b2e3d361a7a0ef9a0e140fc686dbeb788d9cb79de77ec7fc0a10a4d520861bfee239187feee7582c6529c5cd2ed225ecd0021d5416f581f3590a5a335101f1f8329ca12172d5bc9134973585ade0cb820d8d38eca47bc84c6d59cee38dec5a39b5229d01f32c961e121a0441177dac59f4806fa561da079ecf603da5070b554a43daa9e023ce64da8fb3e4a70bf4ba8bf32287f79e5d33b47a482608f755c54307bb7abeaee6b9fff4679f2ba188e04e1d69b4d1137a0a2cc51b0830fc22f940bc8e93a30bbaf139493d509e561a8d6d37dd1e1ba3d20f1f3d62625e5e3e3a5b2d9e3c7952e8a4e927ee9be6fecd42658f39fbd6c5260d07e5dd25dc06b7cb0455dd41102eed942271c72eeb399a6dd6fea046611366e04347a87a5af01d80066e6ab319e5dc42dfacd9d021c107b7639d9361ef01b15b6893bd8f930919721176cd4d3aba07b7bdcf605fab1ee6c6a3a6c5364c93dc43df8c4c661699b1283ca8bdd8cc00fb9a05f128ce74f13c088b0db9abce7d91c6faac1d1c0432383186056b0e521c23ad989130bba3b593002026d863e726484da86ce8325a578c4ac816502a2277a28a380fe7d280c3f567a239cad2fb399fc711ad4e77fbba67a14c4a833d8b5efab364d93bab4d86f3bfa8cb6ca9ce36099b5dbb9fceaf17f7db030bba69b7d6cf4a433921645478049b2844a2ba5f0ddf23b4a030ea28457c4f6fd390d9880a5472ee1e3ef9f4eb6e9a4b9db49efa8503dd6b97bf79fb6618fad5a2385fad40fc67c5fc8d47d473f2cdcbf2bda79b678fcebe7df5e811f87cf2ab55067aefdd50a510a663a5800ee9942f2dd4230a80a5b4a2cf30428d06015bb935b204a9b83024ab7317d399904932b3a2d1ba2051199026387abaef8e745cf54ee1b911f0cf5d29d6696019d78bb03ffa0ca9994062c04a495a40c3eaaed1d7d750d86c6ee001c6ee15cd4ba66ba836f57a358fd61c3bba9fc17eaf56a93261eea6b0aae91aa879c342152b3e7496a33901c90509bdd83501b60e4785562c6b3627a76965e02950890a1af2b99edbde69e8a9448c4377b847b18fdb7bfcd8528a2bbdf4a25fa74591d368c364a19beceed8d3fdf310ec763fc439b8314d15ddc01b100a1238756ad308e069eada69342d9c96d5a3e0d1a8221ee08d771236a3e9fdf67e6c5e7ff5e9795ef3ba7ef1fc659e2feb38005c379bf5e63207da5f57752c998c3237e2f1e5fa6c535c2fcf7ee35bdf7cba48e9de0071dedd3f0855f6fdfc70188a62d17119324fb7739e666024f3b3d016c9e23d844a066a0e037cbe122b03bf0e5d579f5ff3858c9ad549a733454b3ac72096c0f9e85f09c0739067e662e906c04922fb01d04717a38c232d6db0a0657c52a8eecd926422adf136c9d64811a59b019c519641f3e1ed5733d07536d975e1632f80ba772efadc2ce88220388210e1281c2499f1499964904e264e636774157c33d9654adf8a559686d0d3423989995036c24e2e32fc82b487118a83eeb91d0bc71765c1845aac8b3a4fce371b685d1b0da40bcc7ac8f218e4fbabe5e6c926cc6a05ef944a6d907ea781684533e84fde9d181905865a84a641c921894edd34b0db944ea44fc187d2b3ddeddd0fbef7a3478fd6579797b63b5445351ee0b7ab8b8b8b24d1a94eafab473435fbfcc96dd749e87d159f6d1e3f4afbda1ece37eee9d5e2f1a6867b1db84b60224cdac096418d8f294738d33434d60e90dc38096a78a56c9ca0370b4eebea4cb699595105e78529516f788bc98a6e2b1c8d84044d22a365451ed3c2cd72e22912140edbb0d8c7e3766cfbd0b7fca1f1c30ea9424bb095c05e34421651950a866866742f2fe1bb6656e5713798621cdb5bf3f5dde47b944b28515168164db77fd31b9e4706912f0ed4d525a498d32c0777a2f64b20a40a85e880c20706a36c97cc807fe88ce97eccba7473dbd9a3839486dc139d7a3be5525ec220e5c5998ea39bf34c3be9c7185649b6ced5abc3d6df1c41523d285b9bcf3e7db1bfbb036a06e7c014243a29445466a837ec091143f1a15d70c46846bc4edda5680f1bfcedebbbcf7ef2f300817eec9066499ea7f91a022d40c7d16062f6aa39ae8bc5f9e546c0deca393bbf0ac22d0cbccf72bdb95e5c2cab9c196b57da6c77fbfdae99c478c4610d2ec159dfd1e2f334630eeacd3047b7f0b6ac83b4f2a7b167e9351065a05bf6e0d0f901641303845212548085a225f16ac9bb4ea4c8d18cb399899ef3246c8fa02b81824de16e1ab1d023e234ee029ccdc600d06d9542eef26a05e2421142600564d1bc9fedf12807b75a817307be8dfb3ba62e99cf380df20ff85fd4e76cee64ef4c9ad30d1b9179d861ee8c6d74b4d237515e30ba7ebf83bda5351ee13881f4b484f0464e46a8693f0c47b6e94bf14cab6cb1baaa7851d59b27ebd34c5bb75c16fd301dfc58641c0af2d993c74854ad93cf5fddbe6c068a207cc569121bca0e0142e80857a9979ba015ee9e68f15d30dfd5e2d0eebac37684eeb4f381b5ecb601754f7e78fbf239f8767956a20a71c4779e6ec774fbfce6a7bff86c9c68ae03cf6429e86eba8bb44e34338becf6701475ce14a82eba7162461c527183545533188ccfb49026ddbb59e6ba841511aedb4b85763f7a5a6a69a6fc558937170040133ba9233c1193f3b087fdc40ea1c94dcc511d29a455ebdec483d770952d19299d576a93b38cb10e5e963a7da2f073b5b6734fcbceba2640d12991ad9711197184176932908aa97d62593bd0aac20944af8f76c9cd0ed0ac162af44c55999c235dc6062d1953bad95aef7887fde622408f58394ef0a862164724acce73e5f7c3e892248886d6265a5760ce7cb30e73d4affbae1b5514e3348edd71b33e57cb55acc5aedf9f2d16bd0dfd347243d70a21621098349f499ef40aa247da141441a294a40e827ca243fc41ba877d333c743bbd39bf5c5f2155a738e337a6d02fceea0991dccf4368cb52f73bbabd5c9a17871eda8556054ff34cd54b5d549b3c595675912ca056165215ab4b3bd2bd95846b8508cb09bafa349009330c55a669bd2c1feb196c06f069bdb4b4f48780e137927a9c6999adc1a7d53c65d09d531be6ba0673c03c47d06397834bc7f93e01f5044816a02a08222009c7298be9d2c9c2a93c42316a2814e8fe759cf7803b59158c4de0dc69e8c41e9175a25c25fddeddb5ac87c08fb0f813dbd0d50f338d1cc146d24c62c075d05049fe18a179833a589b0a0d881949dbd3d522d018da19997a5d0c8346a16bdd37766ab870d32a4dc56ac5936c777fe7ca32595faeea4d2dcdcc58db423d0d4552343ede03b722d936328ed809dcae0fce924d397565d32d76114d80a64c1205ce2490457992ab478e3be820ba8b0a0b69186d3b14e7ebfa7c51e5355dcb17e3fde101a853529f17da333d3f831a159fbfdedf1ce67d80bdcf91bf90501f3e7b824aace07c524f6b8840614dfc10d34aa8a6e2c7e007eadad3b43e3ad004da0e161428275aa52d0c5f5ae6661c20fca2ac5cb06c0b8ce8e7fbd7ddb0f5cc1b1c3badd0841074aeeb69356f9b8cac4a1ead50d1d057eef23a4d8c9128f0c04a0882188b855ae7265d516fa4bf121be1cd9268727828b285b8d0e4098253493a4cae1774cd53ac644410a56590e8b20ac30811f46ee5286756e0413e427833574bb6e7614c3cf51ada8117744dca343b4435516f5571ce120f9b0f39524127ebb43038f78710de3edcb4bb37a8fe3b8b92c8bafe680f286db65c2ca6792ad19442430383d74e9c03db19a80a8d26443548a353b728aa51d33d38689d583c269e74f1d52fbf7cf3f2eb7555bae3e05c34966542ed0ec7a6ddd52687f46da731d1e6acdaccfbf6a11d5e43748efba74f9faeea655a81d2f1f1c299cb27256ddd38876e04e71fbb2d5dda0e949b8b6e6ae21804b3f0f94cd5f5e59581100e20ed049185f177c331b804f583f0cbe4748746882123c687461968502b9884ae0208fb3c712f6fbc99173d640f723167e5c2c873baab4fdb183ec20cc4db1da0261e0ec2b45ead448168c1a7363c24a628550605828ab86088d4d5daf8a2b58d9f53146254e7345d5e406337344f350ba1855604f520d89a8d927a2413c5af4c840b06fac2da22c840bb381f7b08d3095279720ebc6ef9f4ac5e55211a05f4e9ee5ebc01b52259e95ec2b43e6acaa0c900126578fdf2ad106933a0a53b459dd8d48b8da8e1ecec4c97dc9ad3d5bbd29824c1a1d0581f8e94c62828a0914dd3f107cfbf7ff3b0efa65626d9a8ec6168df6cef0cb2da0dfbe3169a0889ac1329536deac559591edbf1a73ff9f9279ffce8f6e1a6dfbe8cb303066dd671fdf4d2d0bdfb6295d05aa23d0f2d1befa6610e530a4ea22ef1708439707db73fb2daa4f5a5c189040e4fedba592ccdd48f38ded32a6c591479b95c9f258961192c1c9b06613b0d0bc4800548be78d0a80f25f3990d48da9e2f570020a02737095f16bcf57e1844087a7cd07ee422671d1009b431ede1069a60910a7c435dca72087b190b1ae780da12b4da4229f8247c4a8a5d937a0fb68bd41538b0b4a69b4e1f3c5d4b9556901db05911ce749cf2a4f0c2a64ca1b8f2442a38b6baaa2ed7fd5c411440759da567e027959a783fc29b66b010895c64e6f27c2db3943439b11d59068f209d380fb69056c83fddbc82b810e1a57b7e838ff0eb34841fe611f27a6ffbe4748b4471d342a33704fcd39c9a64bdba405a2d97e9d9a333ab637b4fa370887d5a24ed18be7efea062a2c619b9c78709023c5dbfb77a748dc7afef1e92d280fdb5aa74d7c107071d5d9a2111b27ee0930bcd8d8594deddfa39c0b27824810c013ca04a07a6056420d9e97ecd39bfba809ef7c7202b435714c32cf4831bbc7f7828f28d181a6834966460b13834707cd4457eb7a3d547a7bb7934ace7685c888db8f5326161d7a3368b29cd3997dcc36d49bbec51e3489e40b33444bfa3fb34b9cef6d5e9167850d5a4ea6960b9733c51cced1de207d11a8b5439e600394cfa09092ee7bd9ad2ddd83d1cc7c3f1b8c88a0e7ec7cfc634bb37bb4fbe7ad1b60d72292deb0a9e7a69a4d69e42c2121cfd0870c9b549a54188935f1908c410ea45c2bd58d4e6344d284ae71c0d1ca200dfc99e3ef887dd3c355d55819f18dd4ca58bedb19f86e9eee6f6d53d54d36a1c7cb39d15335ddc1dc70e3bf31375d103e3bb791cf677eded6100a5499517fcfdf3a7556ee6c493ec84b83b8280566a8cd3db9db907c40c0aa70d530f4903194317c5e3a76691c2b629378cb478670ee3a8796efd9141f4f1f434b80808326344fbcb860d0728fe614c69390453b0554ee36593b1fb07ba48faad0d89d4b3164bc18e47115a395abe071c11a65b37bcde8dc175bc3210c8426deda1577ca1ba0773a485a498822d95314c00cc58c0eb2d606ef4a2a2bb5ec0ded3fd308daaa967dd31362202f838ea9d56211b25922934c885a78bd20a8ddc52493644d336f60ffffccff707fbaa6d03a4b69b503033aa364d1317079ba59b0d1ba6ddee8125c5f2fc02402212eaa51089463c39be721aab207771da485450d79a20a9dadcef7ffefd3fdbb62d148c3174ff261862baa58ff797302fabbcebbbf630f403ddd06cc4f18961c0d1ab120602a8b57f7dbf1b94f707ff36b1b7931add22e7f5a3aaccd64de3ec68e62c79807375c14144d1dab6236c056370f12278508365e902be0bc0e1b7341b9b2ee1e0f07969e83caff37936407110a637e3693c5587464479292fbea9a44ec31149e25fcd73d33587dd276fefb777b773eee7ed1127c28e53ae06754c457a40cec843cbb0f7cf7ee90fdb97cf7f7677fb296feffc9e2789a79b78eb3ad0c57e0f9c5696f5d149cde1ac13ba67372cfc0162115606720a5846e384aa2802e4228eb6efbc03de1abaa6d27353ebb8744d8b503ea0d96a55c1d65aa7eabc881a141a4661a640cc21b83e4239014b99071ed1720551d8fdae7fb8872da475134e8e8f966b863ea75b758da84720e9c9c973614f6105967ef6e9a77ffc173f9843d86f0f60a0a96b68968a1d37eb4d331f8bb49ada71092c6cc79bed3e84547413b0f9ac2eaeabe2f6f5ab57fb3763b383e53d187ebffbfae693cf0f739b46b58861f4d0457cf4c2576956c353a9af34cdbe97a313fbe7b4c213da084a8537c843e713719100fde20c26637e7f6f45257a2fe7596434c54da8ab99410fe3140634828a2db29bc1e34c4e0d836b6e9e7ffef54fbf78f3077ffafdf9673fd6da86edcc5cc2f899b321bcee5c1cfbed70ffe2d317dbbb1ffee4177ff2a3e7edeeae6f392f7494da349d3c4e49a273b78840985b0d8d19f35eb2c28c37b432075d860e169ed8ce8543177ac3b623ef673177218cf12c03c8f67461b4dd6fdbb4b37a0019c5fac959d7769ab1fb8776dfcd488d8a247536b54e004cebb228cd93ab0f2f374f1f2ff3b5cc21cc804dd3781c871eff07442363c068f07ee41bf018b9804f40944626ffdeeffc0e5e1dedf8d31f7fefcddb1dd45a9a65cbaaa269a4ce9559d94e736972607751c33a1533adb807a318b29996efef27b728d2a6390891a7ab72bd297526ef5e3d8476049fdc3ef4a09243061accb7e3ada2de7294c10c810fec4ba194e592a532e0ecbcf530ae0a965fc40c490aaab1dc8b51e760aa18877cbdf263e751e77d0f8e472306517968ee28bbfdbe60ad7065180e922e6c908f3ef84023b066763b6f2e564a8cf1b80b30b6b38a0c21dc1ffa2d5d277afe8dabf7aecb74b9a803a558230f539f9de7ac3a475325f0d4d20b9dd3dc78d77b13682ace44fd6bb105fcc2fca781d1c0f81c7a91d3ed19747f986d3e7773b4607dede6b4df8d6fe946ad11ac93e5e5a76f1f7efccbcfd76757c5f90a88b32e0b9a9ca6b9825e2b6407809f875b6471564075fef65fff1b97171bf27f9c9fae44a6cb0d019ee47cc1c964ece9920b016281701efaee07ffe6dfdcdcde7563635cd86eef0740cdc46959f43dc2e3fbb17fb8bbbbd9ef9302adc0939c375a9ba23069f17afb061c0b13dc1d662adba62968b26086f47a72fd41ba3903b244525725e4b29fbccf52c5cb63e01d75b8b4b6c76140d40d7c74bed77c5388874ee05520d770a0db55ce23ad5bd10e5c90e0e47c883e8d0727bd9505322766e108cb2b932ecd1395d7f5f5a3abeae25bfff66fd69b2b61e6e9f34fe72f5eb9791bba414e03db1dc3fe2d4b164f9e7df0fe6f7ffcfe373eb85ce4263f83e8058bf2f681169f985a5030a2a36060741f471ca7e10304cde0b364deb948f76ff06ce869124bef95ad7080d0495c14ec783722e1a346b6c06e4dd2fbdd310e819653bfbcbc7b7b9cad3bba69d71c85a379d55eb46f5fdfdedebfdace826e79abcfd37a6967bab34e80eda0091d7441f60ce5f9ee120ac8271c1a632008a496822f04ac07c18fdbc3d8fb24d52a91f7737ffee83ca5ae813ed349bd5e7ebddb2b9a523be84ab330e545757b0fde1edbd3e8473322a4c59caa20e5b6d90ae72c9026317575992e13391e54d75998656e5074348fc3cf9685f2510535694b0580607e666125b39ec9b3b887a3873a0c6e8e6cf388d6def25e69e322f6564213f09d1720781a48a33e5f3584d5e30bea089e8e163e528642e37dbba9f3d5e5792a4592b0ce3f8cdbbeefbf9c4604f2659fb12b23d322cfe0aef67752adb947a21cd8e16d7d06cebad059c1e7d6b38674de006b560665c214b95f45d609632009458944843af5a167dacc6184402e6ebbedc47be5530fa29f955a6c7a3b14ab73787b7db1f9f2eb87bb873b281731cd454c6d8094391248f24171b9bfbd19ba7665b7f2eecd707f9f72c569521914ef695e0c8cc4694c890844d042ff342f91d1ea331045beebbaeffde99f6dbb5646511b5a41f7d5cbbb7e86f49880545769b1f27aec4752ba5c0b5d8cc7aec86bd47a8ecf025c54525f5daf3767409e6097b6874c51ebc50ad852a894ee8255d44ad45a4ce03608bc929587c1b1de17e555d7d818475639c0676852964ed075e03e8865ea8397004cc749ddc1051921f671d2ea62198ffb785ab609e5081c093c61e74fc2f935cdb0b65b067d79f3451c7a94fee2e937cc455e94e7d2807ace864d0d42bd7cefafe6c519c046bf7e4edd0dcd9ef7473b8eecea5c94eb755ec5ae4539f83c67743376ae4dafc3bd58642835d50d49d6716f64bf6786c30dc8b485ea8a7ef4872e9d66af56ccd1aaeabeebef8fcd2c9301c2ecfc891be6c3f357499a165925949a25bb3f745fbcba35551115e4672a5d3b3cecf8dc2158ce5b0e83099d438507b549ae3dc035d38004cf325affb52c61b901704efedeeffffedd9bdbffea3ffb7fd27db7d3442f16bbb63332eedb81d1008b72e33829bbaad69b8bd538396824ee6442b3a96ddf4f19d7d3dc5c6c36db9bdbc946f896f57a9d2c3301139b2f265341146fa7ce0b6e4e23990937a8d2f4ccdb23cb13d44ec8d9081b7abab06380c1e0652e0029b4e874127c160aa49d631a9958300b0175d2ee34973345f671248257b193fcc29c66341ab5b860f73bf6648d42e755eab6657cbcd6f945b9ca3dac78b9881b403aaa144eb9c32fcb7a39cf23ddba67b59417cfc4e2528c4d301b5e64710c72e84d9d72ea2d9a80235103346090140dadb24afa8656d1073e0120e6aa1b76348d4f66bb66d83316f20ad2f7f5dd4165e5468963605fbebd6bec54419182dfd0fc34e4e7a60eae081abf9d223871e4f562dc37fd38213fffd6dffa6f2f17e5a9ea88f8a07305dd745b1b004b88d039741b3cf8d761187efe83ef1d7c604536c1a0ddec1e3dbe1651bd77fd14b5dcb77655d63a4bdbb1fffcabd773f0b9d4501e8bcb8bdd30b733ffeceddb6e966fdf3ec0907b2d3393d0d52fd4272b217574e816d0b5a0f263d75b07353b3030c0047d95a80908bb8d7dc3d9b86f25d0a95aaab917137072060be84acae4c87b09e38204144d2b9954851576105960cdec9d4595a0119066627f1fb273bf3aeb8f10900b412b136df85ca8b2817297d03d53ac4bc3161bb97ac4242ddda5978ff9c58a6e245296faf2b27af6119232ce0f3e0373f7666ac019da0ff1be392d3d9ff1003dcce3b80bb01850f13a8825073747bf841d617e275569cb0a1e56178b52a5fa38bc703ecb838966eec3a72ff79e866cd8448bb5eb7c512eaa8a16c7e15279b64cc4ca982a59429307e973707c9cbaae87d224150ad1468f085261f6f1cf38a0216995356cf26ffd0ffedd4f7efc172983871de51ceb6525209d33fffa35ad759faff345b1a41b8f49ba97f6595d4e4220fe4d73745e6b1516571bddce13f55d5017f945b15e5fa859bbddfd61ea0e6b91be98eecac5b90f03a4292f4d94f3ca643a4d6ceb525d9879c88a64a7586e4ae90796811472817df92c66736832b19cf9b11725aa97f323144dcec1b41064f0d38a468c035a99a76ca3d5b6e5963af269c99f22f1c042a1640e9d88d04327947c95b17ca279cf7d95ac61e79d5c272c96f01230cad02b60649e812c24cdb819739e03d5a5ca10b121c2d78f885b2e7807b8e6964888f5747bb730006d69c5e2368c6e06f2e721c0b7fb7dd73dbcd975d3905dbcef79f8eaf9ab711a78965634d999edbae1f9ed8d9bc2e34767533fd58b9a8e82a79a8da9a994b1af6f1fbefdcdefbcffde530626aaa816e1e271beda189c7ed37720463c4550e47fe7affdf57ffd177f9e267c1a514e4812489df1d8d8457d16a23a1cfb87c301629fbac9e9ce991363a62a2b8061f41ac1689a4617b26d08fbae5675ba5ed26287230cc174685b54256cacdbf7cd611a839aa7b6ca5491142322f7a8746a4ce066e9ae11696626d168d426ad7f9300302197a92569f29033be9da9bf10bc495dd9b348525a6613ed3e945c771cea0355e132c68facaa221032bde0a7796a3c2d02ce4de257259c132b0dd40310315984b86bed9c0845972872700631b8d6398a56f15c8ae3d64bc5e6512c57d11d22e4a6ac40dbda4c1289a2738fbcd545c0d111e7da43b3a2fa5b5ef06e9c68e932f5f200db5a7df5b05596dd75ee70b4d9126a417be7bebedd3dbd7a7c757db6eb8e81969a27895982ea0a562ecbbcccf7dbddd48cdff8f65ffbd6b73f5e96256081ae150449c2519095a0dbf8c105903e45087ff33bdfda77c7b395f9f4cb97d0bdabf5eaf66ebf282bd003ac70a6b3b34b94f872ea8f51d0ad2625578ecfb07787e3b103947907e83652a11001daafb7f74f2fae5f7cfdaa5e2e9eae9f8434f3132f1e9db3fe80665ad7723f04368c45969e9fae62cf5208622b95a2458dcb9c965d5de62ccb3ddd1415b9eeb8a2a93a42d0b44fa6051bf1524f37aeb5506853ec77315cf282ba05d0a66c2d512432cf6200ce0ca2ca68c98ed3c4291c09aa8c46bf631bf382dfc399604768bf8925a51d12302bc05c2c7cb460ed4e9184a009570cc1b359d492cd4ca6a8e0e04c065f884665b4f8c7c4cc82eedfe5b643b5620f4327fb96574d7383744f64b685232ab2b19fc7d06fdb96fa1eba0354e4d40df3d0fb99ae4cc89599909c092dd35895cbcdf955effa6f7dfc57a4e2dffaf043425f47770b91d032c896931b44b251118287f1ec6ffccd7f4ba5c5f1d0eebbe1eac9a354469d6bd7f99b879d4e8abcd46f6fefc23c9679e62cf22498144229a0082563e7f56a44e45047a741c7a11fb6fb4e0b4313aadd307538a0955dc4f5c5b3176feeb687bd0faa9d0e9b8b8bd3941051942df55a0155213092d15147e55a948c81630b38bdd32176639ce8da29383c36475a783b246a7b67d8ecc0b23ecf4a201a69ef3019532c844db8e8ad87e8132c4b6328058d0521e8dad4900bb0af60e2924d332d38542284b9d719b3469e6eece5bb010da6bd779b0d3bbe4493b2a8420e176f146f4248bc75344cce6aa19b88a60829b011d2c2da38c035cef161f2dcf2eee05a476b4ebfb93bdcbcdcc1e4ee77bb7ef0a94a4c026ca64bd1e7d1690483ee6504c05049922d56953b1e824abffce4b3eb478fbbc3f1fd8fbe911729d8334b5263e8767d68f7e04fabca0224e0092990d532d11e9477b658486f46a8c25edfee7640ecc3b15bd4e7611ceff7dbbbfb07afd9f5c5d5a2c8ba432b68aa293746d9116a1282894617968b33a1cc7db33bf4dd672f8e9f3e6c1b3e27741f50304a8ebae874d8acae9bbec10b28a7a15728bfa2eb05a2e1005e10ce4d688fb08f509c284b9a9ea8125fe41a108412029664461f3b512c03ad64599a32a7d50f3ce8cbc98ad6e0558b062a844f068de2464980af14cf4aba08cfd33c4f268a60a7b03234832f2d81a5a1b50c76b32ca29ca8c7320752d7617860cbc7029a058e5fb5023fe852ba7c0eca709e50d0c11a01d958283fedad9214f9895beb320d94925b61773bf770bf1ff6c3a13bf4e398a5b549753fb4c763df778300bc9405248a91f91a62aa4a11fed7af6e202a5fdfbe3eec9bddf6e1934f3e6dda4396e53c49d118f3885a8dd845e048ecc15a98fb791c26f9dffb5bffce6467186570549929c8a06047ae1653db0241bc8baba20464b534236e46361e9bce4e1d50ae19fade82879740306c8f569b3d44e23c810b8edbb61b691d71c87a68b34eda5f7cf1457f70d46936635f90862aa6326b7d4e971b56dedb24adc57c10cb05e7090dea5a4b925bc879bc37f0e71dca842e99172a227bd86a1d9ba3604ac26257daf94ae951203aba9750621db44508c146e4adc617a4f40afa8d03601c042bd20d60044331095ab5275534ea50c9edded71547a4b76dcc7c069de812d16f21bfd3a2623d296e4879181c6823e06b486b090f409dd29d3d1e210ce96a04269264b17387edfef8f5dbd72f5fbffee2f3af60cc8ae2ac5e42d3d2325b4a2610be733f791a5c55811662a7eeaba5492e16153067086effe6f6c9d3274ca9dffcabef21e9958471e8e92a19542d200b6ce040a9f30c450a807df2e46a1cbb87fbbb0681650ec66ba67bdcf9c36e9717395cd8edcd7d5664de86f71e5fda63d7cde00401e43c5b94f3301bc51e1e8edd38ea6a418bc91f6949f31647d875682b3edbc364f7af6fbff8ea39d286b9606af8aca44c0a61d8e61c6e7908072673a8cc289252ea345fae5cd73123b8d4c21e05723fb1263b0bcd781a8a324ca7bcb73c4594106bce17f024bd29561c9236e4311681fab9222c54787ba49bf9989af5db3026ce1ff4d9196a3fd814ea97a07c52ba346a7dc1edbd3fd285e334f8c7064884a8a73808991a9506d90450af8838aaa5a11bc13ac6739c1b92007cce8fdbbd4dc2b214fd84e4d80d37afefc6d777fb710a5fbd780dd894dad0fd09a5bcb9db47c8990856a0bbc22559b5b9bcc8b2646a3a5d2679518f962ef169c779fff67679fdfe07dffab0ae2f1eadce4d0257c3150827c5cfd16aebb305a9704fc3d6517ef4d1b3ae9dfc34a4659ad59ce6f9d1ed237ac4bb8599a3ae16ea2bacea1cf96ba49c606bbd5bad37404b28a36dd33be792aabebcbce8267f75f1a8aa51979e661c20d9e27c7fdbbcbeb97bbbdd0e33db9c2dc6c331cfa1b900ef7441acb123f44322f864c12a700ba4cf101cd8041c0a2f516d0fa034a43ba3b14f1961ab9222ce47ba78202f29a8db78724a1ce9122d2ca4f50712978c0d8934c248906b3705d1eea7a5f7033e09434088064fa26269db5b076eea0eb452704cf5d48778748cee110403fcff69e9bfba6d4baef4402cecf26ebbe3afbfe990000a55b4cdc19644aaf5d48ffda827fdd1964653e42007c912ab0a040a40ba6b8fd96e791b465f5c76668d2c5c73f65e2b62cecf849993c53e9903624e6e6d48c4ee4c1b3cfebcb0f40a1a5da6bb19c61c460ecc3fd81a1646b7dd51341a943d7c6e1b6e3503414b049458f077d470fbfcc657a4b8dcc0274451564e080bbfc8f24b8fbefbf0985f26aec014c0c6d0572fdeb6e38106d1ab67b75ee05bb71a6bdcfd40e85de74a41ea903feebe16ff977ffdcf1ebbd330cdd0b5704f9a849040c01ae4037400125578f2eef6c2c7ec49df18fd79ff202d3b9dcf699157cd691ec601f1c6297434c6ed783a3c7cfca4b587afa2829f4f678cad66cc0ba2200ae1fa3c23e2c87a3247fa2ecc407e401ff966f6ac8fc403d90b0062b85a68ef6a5478306978a6842cb51591bbf661a82d179b47566b73ea2834aa4a591c2cd360913faec6beb5c324d80c776e9922cbc2c2352d4fba6b3cb1f142084c18634b9b9325d222150d02a62541acfade95340012c324d133262f4937630db282c149256d58b8020a8240cc1cba5df2d95dc90343832741d91098cc4c7b1d906a395256297daceaa69f29c8d4edfc649d9d77d9c6ad51c4d074aebb809358006487e9947bfeac90eb3a72376c599627b737cf2b3cb3efbf7ef98a43b1e10f17c76b98343022d43262e28ba7a0fcc5b337c535544fd1945555754878b7592d2412904857d73d8416f33cfc3289a36ee8a3002e70246080ba6cfb091e314d33b085176490f9a7b20c85d7350de03d8e5324fad5f5e502633f205ea78cc76ed330c98a886780c781c28800aad8380c428602d2198e3e27d03aeea88876bb4c40678cb3ed986b8cd5eb4ed31dd7951b50bc0d4da02325d5152c2c68162e73be3fba591c67fad4e88f9f4da939c8e5300a2974e7d3fec4cbc91e9ee8301beab1f61387a3c9808a31f1014d5792437e2fcc5f13327e59d481d53e3135413aea0a40a549296d066e656482cbf2e14cc5d84dc0106b2b60c9489a7efcf974eec665fff810c491ef4514b8075510e73737d7f889cdeab67e3c827adaba8da310bfef479ef429d28b68d6f62522e3f3fdc760959ac144bbcd376fdf3818053a61e69cf207d8bbb3330b84f6e4bac6f27ffd3fff4be19a000b081ece03b7e8e041373491178e4b1f85910353ad425772442eb3021a83b309d2d31ac0943b4165d8e43abb222467e82801f3c2dda250378f026e6a2252b8521931949eb1711ce67e4c841f2ec68f0afc05bcbe9fba12782efa8b1b0a318589b3d0138e8a905224f3e812baf3210be31e082b745210afb1547e7ca9ab29bacceda7857498b37bf67914dd67fb73493edf9b79728707cf933b8ed2cc84f8e61ffe8194a3bdaf783b90f3c9d6bda97bb09b6a26ad06d751cacf2dccae3fea4ecc204384065576194de283d901c26ea5864640278e3feb5a3b2cb51ec0608b9f857e5896ed324ebfec1feff747a0dc382a8c4cd5ebed4501ea5defd6cd301f0f87fdc3230c52705574552343ea2e50532f646c18cb3859c761b870ea65c5edae80767afbeca51f045f369ddc8927b724e356dc0cf7a4833acaf8ffebfff9bf7d7e38baa292060ace83bb63eea82e1cbcdf2f90ceea8bac13b0670d92b4adf164591e5510c755e3ca6ab84adc6e47e466bd8eb7695f96ae70b23b25308cae9c2b5d65c5145238484e29b4f5aac8d4d8ac36512ce03fb9976830bd474892603031a792551a46c32a00aed5ad762501dc55d6592f301ec8b00866083eca8c0d6b8eb6259e26c96a6dfef8077dffc8ea9622302166ca3d5da5b6c3884754a6402d5bbbaa2bd45450d2c6750d26cca4e25cf3ab5bfbee600ff50451d2399ca2b9679081022901fed1d21526cc68db580f5ad7b8b501a6e8e2b912989e30780609a5188ff33c1d667f65a765f8e1b1834a0fc2958afc22c92146107d87c7731a45848ac3d2c6416c3661e405ccf50821af9fdf8c4b43e238504c4541284448ed2a8c0f4f1f9edd7e7f75b1729c2ee0b2908a80188caea37e64895b75c35cfe5ffed5fffcf9fec3b88cfbf6984a5709acaf87c5136110f6633b8c1d8072d4cb455e8464f6bce2e2eab2721d47c679ec202992245fe872b1beece7015137b51d222589e2691ee1beb2a848e2106c73595c2b6809eb4ee89775b729766e37666145ec01725d0d8665f6628f4e2400ebc8b55d065831373fd24d9f9e01ea257893c4d2c21eb5edd2ec9727aa0f07b59cdd66df62b2249d1e9f2cacff78240613b4824302c8daae5320bf04aec3f0ba965719d542e699bbfa5564662e99c207d3a11ef804c3adc9d33bd80d01b09410475cf7230c31725e1890ccf8a56e416ad9d975c766c100d6675d65e7a77ef063fd3888eaf3e94f9f9e341733de36f2a88c78ea2f6e0d0a768b5c5d14f0c950e4d013b769eeaed88fc75f3eec91a350889aabaeac3ce876c2b4e7ada24c4ff6e5db9749e2521c4c8801c73f5f0c93abcf22022866ceb757895bfc1074eb475a4070ea22cdf17503cc405d43bb8edd6004cba3ecd3d31e41d48dede95cce633bb98540d74c384b92308a040568b9fa18599a21945749062bf3fced2bb7b61e87fd022d480221de7dfc345bbd916192c97cb54eba16985804cbd0494820edc9c84f18e612ac0e278fb4a923e261027dd788c6cbf4e344bbe3f4b9ee4e7d37b70a0c7bec874f3f38dfb77765f67507efe87a1dd11134989399b8b5310789336901d1dc9c46e22bd00c5803aec01e2abb4c12f4e7fbdea8faaa7a8221ee471fb646052454b6814bd2b09c484db68e5844548dc89fcd9ce9f9ac20e5cfbae59cd4cad274e98ec7c63cc1e4c73edc76c1bd53578161a048c765a8ab01e612e3a0fd504ee3fbfb472f2a7697977ddb42abb83af1fd0ccf51b97b3706993aaae19787c7e2e226dd6480c22f3a06ee06a6896b771ec59dc072cd377ef7abeff1bfdc19f8d097a93cedc7d3e1c8025b83452c83233d8c5d60e511f3d9b79359ba4185eefc9dbdd86c01e5bbdd0eccec79be074fc2d8e1e938742367769e7af08b6431cc1d38e0d5ebbba7fb87719a7d2e38dc2c9962fc6e1cd67a92100d2a44fc295f6106814a90b0f83b0cea0fbefb92e9fd59baaaa7091e5f1d3fb8c3636d3b155b10565a8fa1316171c58d0c5e5c8fed8c57e149c867f8e686b0c4ce158f143191bb5daf1777cf269590c2a2572074f3746206ae2642cc3177b2dab0a6b3da1ceb26970c16ae3b1b9b526e4713142c6ae05c11234bedb69e3493edd423684eb4e15c5b2f6890fe8ff3efdfffe4a7f9b96caafbbd2b1d0615d02b283638a92d92c6e7ad22be08e1dd022f926198a67e5fd579148541fc501e97a537d312c9e45cee659cdffffc6768ab57b757ee20bedbfa75f00ef96adc668ef65c7d1ecd7ffbebdf05820e7a0803d8af014218113f4d74975f023fd96415c4d76c5a3bbb8ab75e3ab52d9774c4df0008307599af219d933ccd83b06d47ed78910c1075824906910271ab3f7db89f3ad87dd0c57c3e9f9d8d13629d661bcf860b14611c06eeda2ee12c9b4c0407018c82880095c7885fc380211e7732a4e9447722b01651ec0b049d3bf4cbdd429ac503b9f26e17dbe13442745910e73ab513315ec46f6e88ef4b0fa27e47c796ce962799ab7301bdef41885ac3230845d31e55e216848464d9e5c6a6eb192fae67ee6ae7f87ca4b06f6e693b84dc8b1d8271dd9c5bb080978565d5457e76ae6723bdbffdfd0f521019a6bd5ac6058f0c9d09d813575bb05b561dcfc3a2a15c6b050d313655f3fefd2f98660e6e9696cff46215d6e3727175e5ca264dc3c5e5f3e370ff973ffdf0edd7df22f891c2bd2b70ee5697a0635c5d23e0f2bffcbffe538875b772071ecae269346d53fa3284263e22d831259c1561da34b5715d66298fbcb64680bb7a9630020019c417e469752aa927ebf3b958af9220a99a331c0b0f299cea0459d6f54c7238531072ddb620c8b588d38dd7347db60b85f97233d6d540a51922cd15bab470b5ee4c3784031c134c54d9b8bb51aeda17d8dc22cedc0e6d5c98c0d5e31359aeca9a4307840185eb5a6fc8acec266389175fde20054cc0dc1e77ab787cc936780f4c3fc55f703dd65cdfe1c0b55af68484f6b8da04bb545edd406ef3d0e8c08a5942d458f057049bcf2092c145d3c3c1b3b496406805ee1c3df1f454fee1c71ffffcd327cc868ce2055ccbc324cdf056907e00b96e8467777e408dbd1ee754caee547a0ab0e32a2ac8283f3c7c1ef161e3786e4be02a21332810c3f18f7ff7776aa62f5fbcd252b802fe0a5a4582ae434fe2fff83ffd57bf3afefc31ca9361d0b1bf391c0f6b2860a45820422fb654bb3637d28f4318098ca532446dd7c81f523555942550c490acab640563da763524b5e4c1304feef4bfe440268c11941828755a9cd2855c95be5814bd7bf52c8b65b492b9098107862b498ddf0ec2e7711119204414b244989e127f8020745b7771a4bc702ed6ce59805107253699949e2e5b3395bc2874598922770e6f31ae6485818fe690cd6a9869c2e860008e32b45f6a87f55440b2562220e458d1ad5d9a566c131a4afa6cadc194f120b7c07917ec88a2988153f181338289b068d04806d5a5a6e5c6f313774456ebfda8fff8cbc7ae1d018f553f0411dc768caff48d09d2304f93b2aafbb333706a1cf2203a77ee381eac8abb911344c3d03dbfc837dbe797d75b8eb19e10337390653777cf90077ffecb2fdfbdfd86c2410a0b80c30f31586ad74cc6f297cfae8cf19230ed7a3df5d5eaa21827f670ff38418d0ceec26d53b7c0bdb9efe334c258205ca5c7e1646047a32018479d6f56f3d02f6681899cdd76088d427f70ee7e5ea5097c39a49bf023d83c58bd6554f3a47cc69e3dbf00a08626d050c1788b1934a9349c22280a1c8a7f0086a107c050c69520b21c0a83fb612ee06a87567dd91c766ddb309b1192c53339069283e110a4745320474d9ed8c4436a5a8c3199ec7a4b7dd03a88cbda72215920137f2931f7118d3d45a87c7d2bee6e28b4729ae894e29d884e19d4de52c121d8a627cc33a6271c2ee58424eb17061f060767b38ccde6a7f7c73ffff203040364683f4cb2c8264c2cd0c5e3c56605327ffcf4a1aa3bbc1b0fe4dc77ee74297ca7e7a59e7779b1516666dcaf9afeeee6a23f1ee185a08f87655ae7d1e5e6b6aeaae3d4a6515cc41bea8ee06330dc991ab715f0fad95dcc53c6d9a49bb299316103fc1cf07b81cc5d194ed7ab82833608cdd22292def3eb0bf1c59784819716f9767d75b129caea54b535f2789d64bb5536cf63b12aea692480774382384f5c22b26717bb18862349ae56ebdb67175e102b3810e13ba920965066168045228fc925740b724a26980f3df41a4914b93b2a5098a6ae91e47055d4d5ff82cd95f829d85a7fb3d1d324dc8d4029a4d63e23ab548439ed7de30fd64b210160300c532a17d05b7498c8dd8eaeac0d2fe475cad6b13b41ed741452d89bc2f53237eee03d17012d90d43ce014b643c40bf7c63129bb3d714715671dbbfaef4fddf9bffdfe1ffffccb271fa00da409d2aeebbc205a184b7c7fee9bee708e98044381c7db43e9ea7833108beea62192b21a972ccf288b5e5eaffef2c37b9037dc145fd4e6e6e2fd5f7eb0694c86feefffe187676fde5c5ebf941e940da80c1308ffcaf9b3d7cf916826f22c0b61e262e6f56af6b8f774d823d3a1cff32262865c5ede58359cfbaa9d876359ed56dbc00fa7c1643c6e86e6e71f7f1624f2a121a97568518fcc871f1709b413b077ea2a773366391c4a684ea46cb78c9ef4c6f2907948c4a125d56a97d4a729046005cc9e8e112403b4b81f713daa36611b8fef0f2e7566a8101500e93bcd3c0e36b72c6706ca892ca701c688739fc29e80b389e7d6ab9f3ecfc7f76ebdcd1dd7330cd27371f703441af067cf543f986247d3c8a6ae1035518d5d47301ac4f3c10a72b1f03b7c681904a8eb8e747467cc985acad1f3e1b7803708a0b0ec288ce7fbc7e3bfff2f7f12b1bbc5de75033c803b75009aec9b88f0c3a7f7c24b5e7ee5be1128680c6987598d53ea07bbf5a66a979777b753334f43e765719626eb9deba8bd5a6d20569601e4cf3697095bd4bbcf4f57f9f3d855eaff9281c4dd3ee4df7cf7228992ae8167d2557d14be3fce0b81b1cbd2c949c8c9b52835eafde7cfee8a290d62c1ce55bfceb27db94fb3b55b68d343d3b731a2cf5d56d4f066eee900c296ec564535f65e900284b7598a6074cbec0b107aa8aa13feeef67683f1f6c350bacdbd518fe01d3fa0b4347372f5da1d7658380da9cf46ea0e686166206c3815de807703b78e0398898bd1403c2740c88c4269063eb2c006039509d3ccdef173eb0517175c5726de922b5f5b69d3d084c84eccdc429398270915aee50626cf95b8edcf345fd36174b78c01de51000f6b96017f0c534935cce7ac7cbf27a9c8360fed87ead4fee9f3fdd0b520044ab9e4ae14a7c05312539eab1737cf8c247ddf367d3fcd90998b1707d7dbd5300deda2db7e1082c05a4364f238027f4dd3d41fcbc3b1d442fb86f6538de92e92500459f5548ee3f0e2edcb388606732b6e14a2f1cd8b5bcd7d17eed3d80cae897bdbc1dc428fe8d0f7cf55b5ce8ae3fd933b8d6b759e67b07f51e0c1084661bcdbe4a7e3fbcff707eb4acb4ea76e8c7c6fbbddb50b807d723b108b69db36006242de2dd45d904ae3a66fe09dc7455f6e0b4954e4e5dbeb42d58b2b721358c352c83eee6f0a00cb3c009438c2042e4d4f94196f385b3f57507c6d0fcdc5f2049f005ae2bb5b100b9d0098b93132ba0e1475d718d915d214de944a84d8ea994ea8b113f7015da32e36aed4f3a2bd22d77d29d4ac2847902c0bf56f9e115d0a822fb7d24c9e06704d80170d3fe405b6aa0c1b4bc16d3775aecd9fbf3f347ffcd37bb8d66158dcc348d1966757636899f3bc307a663e04590b27e796c339c9a2e05896ae10cab484b16be77cb3be9cd40cfb8fc19fda3188fdaaaf753b4cda0471b4afaa0cf2f9e2659ae5c7e3d357df7e7f05c9f965d55b0048bffdf63bc265df8ef5a8408da3659ba268bbae695ba0a853f8b187cc1750c6783e350761b886f62336c98bfde1e987779fbc2f55c029e0090f28585555ccb2b11fa5efe56966b5067be759c42c05087f7ef80c8522938bc08f6edebe598625a772b66afbf2922f50e846c93921a45655e80a7582e2663a2eac3176848ea99c4ba5293c9e0d0219034b72637b70a1e6851e6b0ff957b566437dcf57636ba5708517ea46ef76cc1c91006ec5b3a1de2535337557c104f1b96b020ad07597adf11521e4932ba36aaa23a17a99b885be85fa1d4777802ecd54b758bf01f4316fa5b91dda535f8d7ffbe32f7ff9f9c3edd50d52ca1257fb0c5c25bc80b94d9b9a5b0bb5f9a5b438f3030fe40e7e9d20dd2302570d6d50f790ddbd04974d6cb3dd42c82e13c58743cb798278ab588db54c56c25f6f7717d3504751b1dda497db1ddc39c73fdf7fff1b773a1ae00afad0e4faf2ee787afa6271bdeb8b02f302917375b95b17abebed0e615bac7688b40e200b726b5aa5ed047cc067212addf25be34e2d014d2cd45fd08fb3f4986bf40ed21082ca007e779a685a5c6437d72b0f83517673ff4d9e1557af86e5982e2d1eaae5708a236440e08e7a29e217405170116fce63929969742dfb23cf3427c6619e8c9e2cdd4430adee6410e35466aa6e25d30851354bed110a0b322c3c5bb9f63e798e873194eb3c2153ed2afe062bb23f5a093f1e029cb81c5c427a89ee1a1a32e64a91208e0d8d13dda88ea8e9b89f3b32c701087b046308fed3a787b61dea71cad6ab8bcd0e9ed90ba3719a4757c4025488f05e7c4f4cd32ca48f64c3f0a451d08ed3fa7a773c9c21cb98d53dc6dadd0627219e289420274541d3b2a94efd68133f3e1d9f2eaf9fed9f7e3c97fd6fbe7b2ba998d4973a65b7cfae5b35a75ea086e9d0b5769ecaa68b9262b150f2f3b3db3bbcf0d0f55537f5631d40efc4719a02b2bba11b0fa7131e17da08fad52d80fa4268e379f1ff3825b01863a1fb9dece57621ab75012bb24c6e7920dc14af9ebf3e1e0e91d0a1b0ae2844b21afafb557169c3413eb56920c3894281c28d5178eab0a0f691b48d4f339e7a04f25ecf3c0d815cee888d087477d4d6c120f426bfdcb8e3053070be86aab2080284289eaaab45325161e6412b57c05dbab2ffbe96b4a4538e3f82d665416416d7485e0f333e98a89e256b91280a6898164296d1888607ae128622076d6b36fdddeffffc8f7f7a6f11c10ad63fb7eea6fa529e9e98e4511c8150c0791e4c5500a32d1580407ca95743cded7a3bea096324b98f446cbb2100780026caba9ffb2c8ee497059bae34daaa5eb5be6259ee1ab0edef8f57dbb5085d5951aa0dffed57af942618322476d395a3a1db345ff47caecb3408bcc8dd75999a3659175f1604fc0ef846dc099cfde111b8392fcbf3bb3bc4575a14304a6e1d8f21aa16383fc86764368420be2bcd3248a7d3f9e01a886ed6772fdfacefaed4346cb7dba78743374d37b7a13f491fa34406b8658c61ea85021e0ee34d63d157045a2edb7147df0b254ad7e3ec4532082d237ae8cc3a83da742752a10a42a0ad369038484fcc541c28e5535b9b6ce78069c2dc5fbb8d9a5148329288d823a25dba0e2b31334d1facb7ae9589ab5a2c49e2099b18e107c946770f9a84908da6d134f27b4167aed5e3f89f7efca9e9161ea7cf8b677191f4d3b0bab85e210be7c162e8dbc10f3d81ef757d433cb89460950396a15a422f54e348c032615884113218e3bbce332f8addcdb024198616982c64042283d754a1bb2087347d7afa5c14dbebeb1d13ee5a2bdf7ef55af7000e77999b5bed0a6308605854e40962e4fee30352587becc5f5ab9b8bfc507590335d5735f08fa72acff279ea87b6979c9565039934f65318240b457a4c123e4a1b96e7df7df5ba2fcbd00b80ef0bc696042f5ebf21b55b3c00d58b6589adeaf872b5f374cf80e692889e8d69b1c29faa987bf0345d03287137a7c968fa0e3c03abb400465c2b206019635e218a9c37079a449655a4352c825be73493d0179871be49297e9d279cc6ee90a3a76d3f7a61ac1b57af12284f3cb9b4069a50c1df465bd1f63449ed50b148d07ec4508e4e1cebd213947be5a24119350ffbb97b28678b387518e021bef3240586bb26467e305627cb64dbcf1881bffaedaf4f4ffbba6d81e148cdae1ee03d36e96abb4aa3d0dbb7cdd0bbb65cebd536cab37502dd98bd7fff612522a0840f39e899cccb173b433d48e9fff9873f7dfdfd6f8b4d8119e4cfee2e11d00c2a4ac8d3e9e89a0925f9340fd2694e5f2b5224c56c9620e0a7b27e737597c0aa30fae1e33d1c983b430554702756983bc5c2f8c5fa228c52b73913441326601ee1debefff69b0f1f3e9e5aa0f190e6dbecf937773777d0bf0610d3b419e8a2e00450db992012dc9dbaeeb8975925c4b670eb3270f65e64a3948d5a83247b303fb5026f079d35d92071029e037317ed6e1c0c740909a03b949dce49b850b1c3a7333f12315cab8f9185bc30536f16df0496b98e6aa19be7c267a733434854caf825c3ac66239d0380b06e3aedbb4dfc85c971b2f300ac5ce6c47ffca9fadffff33f426c0561dc3590a641ba597d78f8209907702adb16334f5d8103babdb91cc73e0ac2d9955670e72ca3ffb1bd3ece791af70b841cfed14831ba7048f0c3c3e3340e7dd3f67a462c64d21b74f73f2a0985491867974357dedc3ddf6e5db77dbed96c21f02d3c83d13500334b90161d44ff3c01101dbd419840ba4a0f4ef1bc3ffcf1e7bf3c3c3d0d933b6003050a650565ce799864ebf56687688040b97bfebc585ff89ca6592c08df3f7cee4650ef5c766a7df5fc9f7dffcfcf878331ed54cd612ce25de875aa69a6d50a04a53b8da07692325bedccb41f102f67ce814083627471b7f1dc0150eb4af00d034f200a27a37cab3b024b1e41f5459400692793af58b388c8501b68d232b226e39ed04889276333e4baa51de98e1029a21cf8c6c79792b12521525f3180ad502cf1e643d3733e0ad292bda6be99dd7568b9088f7bef9ecee579fcf9d321d9deb483eae7f8eee61228ea8af36a08115d2ebd3bad095fa0ece3fe01d4fbf4f404f41ae6210a5d11392ee4d5f516e0546c2f8ffbe3a93a46597691aff6c73dac3906174638ca936757db795213c685136696b84821b2c751c3dfbc7afd32f203fef6cd1bb752e3ca12ba432461101dcfe5ec900144cbe07b86de352730024fb06f063033a67886199f5d053c9e6db7203f8c9c0b0500170faf76eb5e932c8fd671c87d58da86b8007327282c8fef5ebcccd3000eefe1f1690389300d579117c0570491ede158941858b84be5c04a3daa1e0c9fb80605bee57da72134dcc524e4fb42ceb34811761c446ffd9045104e42bb457fd70d8026be6d031ee9798152fd28a039dda97b63523eaa98551de1ee30399185694bbef5cd019a8ce075dd72c700f8e5a423806842a4855159d872ea06a5bbfa4b93db887cec4cfb58bf1fdbbad36fbffbd5c7c3594a0f4e5d59b22ef24d119e1ad7316a9e104e489de972b59ed4d2759dbbab09bef264e00745562c0aaa9179928e4d076d98c645d955e330adb35d1a46fd325b46031a4235c751ac955eafc3651a2216bd2fcf94b0dffcd56f7cdfe7bffdf5371c94306bc517c8458ffb986c9024324fc6024602e8ca93689b2587f29caed671b119bac69d0876eec9cf2fae5f3fbfd5636f8c2e9b01f65a4659d5548a503c3460ab2a1bb031dcc5c5ee2ac9566f5e7f5369ce38e2c3d0200ab55a49ebf60e8497862981ea77e49320f982381de7468fdc0bb311bac3a7509f04c6c5c36f129e797c1144c1c7af8887e1a75a78b0ddf868d03ac90c9d898e236b7ceaaa9bc2ad699104ac6ea074b8f16125c5143131420b839cc8ec41f50856e291c17c56fa66e01c38e7cba1addbc7f3b8f2405d06a40ca9ba20d8c29faaf6e3d3e743d5bffce66beae79f3ebdf319f743796c8ff8aeba1fa8e5db74ebf6c5b878fde22e2bf230f2268c9902fb88dbdd2593d4dd8ce1dc30d8543d0d63df7581bb356616051b6a1fcfa7dbbbeb7cc521d4cab2d5f394c42922d82fb6410ae1b1fafebb6f7c5ff29bb7b7cc42d8b0dd7a3db7bd17bb1a8deed4fb6cf1e6944b180c64d3fde3135293844509e3465c2724bd8c300983325c66eb2c85df730536ddb9670da7d6ba56c56d10450b00a469ec38560bc96edfdeddbd5e6dd68fef7fb0635d3d1e6065aaa17fb52962b1c0367e7e387ffeb4bf58ad80d3dc74e27192ab70dcb7e0827981fa0485683e8d0b647e82ffa90ccd20be406d16263e0e40cfae8b17c8c6bb74556b0c85b227b626aed65ecbaca75cb956389e81442bf73bcb647b433782018479c96deaae4475105d564949e0234fc3301f6613d75dc375d271e545c9c3b1fee3bbf7a399fff2eee1d58b37e1f5d57ab57af8f49317c4aee6fb4cefae774fe77391a66ea9acc7ab90fba73d72b0acab759a0d8bbe586d8779dca4398180a4ac3f1cc6650edc0d79e037595fed2ed39565fc783c2e8c5c5d5cba33e9c68fb2e80035b4344832c4eb66bb79fbf54b643307fe8ecb02c30f7a852a3a0d2429b6991f34e773354d1696cb5b3df67a95f1b66b819de06e45c44591a9090eb26666809c05c97a3e393f3d31832049b8ef8fa7476aa19fcc62a3cbe7afa106373737bffaebbfe9da01d3fce1dd27880fd5ec379745e42bc408f753e6b2623c97a78eb7c0f094858bf61e170822e85ad168162ff5140a91177e39f2a5e64825b805d913579e3fe1a62724c363cc8d349039428d44d2c0752a75c7d1bb7459021255ba721bb17c9981bfaee452b8a54b8749b7f0b0e5a4049f0e677d9b8cb0bc5cd453f5b4444fe311741bcedd9cd3f3ccfef08fbfef2678bef85c75b04e5e8a2f5f1d7ef9f4e9f37d9665d7d757cbd82cb3d8ac571eacccb2b4a0832f5768e12baa7355b71dbcf86fdebec1770522de24abc7a707c9823b3f5b4276b5bd5afafa746a5a48f7b62ac2649d153baff8603a42c257ab64184b3d037b03138baf7efd9deb20f4afffedff4216c89fd6730a410106b7d7b75da7a7b9cf13e07b67d5e4479197ae9f5dadabf2200ce14116c5c5450a347425a77357ba3b0dfcf0c5ed4e8d7516ca2c2b6414cf7dd977f05700fb5813f9f5f317cf5f3f9ffb462ad87fdf9d9cd7d36d1e5d64093bd55f9c7318622497e973ddfb1e57308a63ab3199ae1a2f1cf8a4066813a902392f23dc2527a10d420318201d0b2e005f542248fd7e6938060f2ce37357f08d80f21d5043e34803ebb9b0c4109b7009a8f52ced4dd5c34612244b7f7457005433413901af8ff57eaa447c936c56d67afb7ef6ccf8d49ab631419680684ecd524ddde6ee5518e4ab303b8f5d7dda635ab466e3547a4158d555116d23ae9b6946bcd4750b6e7327220e4f719c16590e5bd554a7a7c3be6cbafbe600d996c7c5acfaba6a5d333aad8ecdb8a49b38ce1733dae6b119a163e0fcc8c7c78fb7cfdefeeeed8b24cdf96f7ff7af2c8c895260fbb2a92006faaa47e4fb9e9cfaa6471ee9c99d2d80840f630243d35663bf8c960d33a6bec79c69eba59babed7afbf34f1fabf331f0bdd158004e3fc04cf5c2833daa618fd657af4ec3b8b95afffcae5ca6a39ec1db4d94787c6cbc248ad38049b9a667b8bfce9840eb0732c7a33ce385ec64b8216049788742440f7d1427935cecb870af352317514e69c5d8dab5951c4b1871a242b6e5a699e82445063a20aee90458a7c277058a86d0ed10fbca35a20ca125482cd9dcb9e3410ad0a5795dd70183f1ed8100e77ee8f7d08f23c708b17a50db6c8b0f113a8a76d74d59d5e745e6c976b7fef8eef3a93e79a1383f558caa57cf5ec3dcd565bd5ba7f97aedbbd21374bddbb8c536218c525ddff743d3b495106218c1bd107de45cd63e2015d62e4a5d5f4311adb7ab44f0616a5d9b054f46ae3f0d9b5a5814f6bbdffdf33008f9bffcabbf31be27bc085a66b10bfc4a557722f677ab0b38ca2c12f3300033e320843c5ba5d961ff09d3e68a6384903869beda61ba111aae182757d5e9a8b491c2221adcbe8b8092ca87bab978fef2abef7ecdbd4d5bcd548dcd38247e242d1c198b4516465a14813c1e8220209bb4320c2e0f6cfb34943b5f36b0f056c2452dba4d69b0e48c7a560c104591abd27cec74cce42c3c51b8556ca3251ec5c79768c17c080557bf36e6ac857c1d89dbce5e3489e097f432e3afab19c9b767d287a3871473ce99166aa5ef9b06983fb935c8e9dc8c877a5cdddcca7805fb2d09b466df9af0f1f8c078f4e3bb77189ce4f26a78ffc3a7c70777b224e07708e9241f87f154b65116aed7495fd6e7bec1f0124bae6f9e2791fc7838c03783aff438af762b6059e8417bc5411c494f8cfd8c7fbbbe12e90abc0c7bc6f36b3f11d2b88d84870fbf7cfde6abb7df7c0b7bc9ffe69ffdf5e1d3271de7f9bac808fffcf963dbf46d0b7dec1bc64efbcf66713b93ee4405f3ce6def7aefa8b9ad1b848cf47dc204feabdd717ccc07a278a4942df3e4cc1b0b5c39e0618a92cbcdd5f3f5cdddf5cdae2fdb4e5b4b469ff981ee2e565940eaabd190907ab349ba7089bd6cb78e24ab3f9e8cbb714bd691707b78f360bc854f4c60ea3907680e1abe4104ee82ec421533fda453271645164909b1ea4ac1b88e7acc101250677ce0a9296f073c25f3b6b081e674a47e62282ca19da749f97ce17e332ddd544f233703fdf0f8640236d7f3e1f8d49ef77005409e34f4218dc1279f1e1e47119fdc2dceddab67b9f5bc8f4f4788e2eb8bb5c769590d8f0ff7511c2e66381ceabaea37ebe2f8749081f7b47f7cd8971461e96a52ea30cf0825699cd6e7365b6f59ec2fc68fb30260368dba00621f0edb6db1bad8f26e387cfec0a6eee1a9fcab7ff12fdfbc7ce50bc97ffbaffe1f171cf03f9fea110e6c19674514c60c00c6c3348862b0ebb1eaf1c461b601480257c7be07ec2732d89f1fe6694e020f7356d787696e2c85f61c88b5cff2cb7ed6220acf75f7d7bffda72f5edf3df6b53f478f6d6d5c1741e593e9f0f103e4f245624518484daf5711c504b12048a38cd1f4ea16df4610040b905457e5995b564e7a1b06b0933c91c268d6189ec5e6cc81fb70844658ca08eb464dd714bf6be174cfd444a2f0695773c541698cb8834f94ce7aa4b01a241e4db9685f40b5c2fc42e82ef5d845fce1a93e1c1e58ec7dfcf1a7dacec3794c4371e58acc5d506fe84aaa167da815e458739e81d42f5e7d055caacb41e2179e5f9dcee776f03da6a71e90d8cc8b9745905e4118407654ed020b00be66808e249791bfc992244937dbd5e4c7ab2c73fb53c45e6c2ffc349d87d15d4e73cb014c590f83bf480cd3f6fff6bffeaf97698260e5fff77ff36fa517566e45b53b370b096277660bef310e7e14fb7e0ae7257c7f7d75c3e126161dc0b62d0ba417313af4f83036101dc893d3f1c1700a1469eb3344fd40347439d2cd1272f5f2d9eefae6fa7af7cbbb77c20b112756eb0184ab87ba3adcdedcc65624b1ea4f3659614427dfc7588e70d0db68e52f4eabc822031fb44f2d4c42c3e6842650446e459bbb1d3f572fc77646a6ba1aa807cb135105250beb830846905012276e431866789998afdc76c4f14461ee47e71ebccd48d4b61e4f16365bdbc6ea4fd5befed8f5aaa2349830629ef7f2eaf2b7dfbc19c5bcc6b0f6a0f105cad2388720f795db7bc97637996f3efff8d31cc9b717bbea54edb609bedb953d7207b59864f2541eba45d105006f4377157440c2b80538c1d568ae5fde5d6fb7c4e34fef3fb4e7331cdad8f5f530edb697d79b8b056903880f0be2d90ede88ca6f5f7f757bbd7167679effeafb09a93eeb6e585c8d4b8c9f16f97a33946733a96cb51101842b2429c20bb679ac8f8f503a61964123f4ee58062638f484ef85fe384c42d9285e53616135867e81a2b9fefabb676f7ed576e3ac13350cde65dadfd7e01eb0d4723aaf9fdf64637995c441040d39816674c46265e6904e368999b7da247211eda8e7e3343032f9d69f6112ac7497dfb9bf34ae0e8bd74ef08d1d8cc240055071d1fde0d6fbb72bd25200bb8100e7332ca0c6f38e30dd231c8475156d4f7a848cf246064b32065e5a77c713e8b0e2e5e934200817b003798b4cf1534d68e1c7d4eafb6e565c97a77e6244c5eba66a1f1f7e06555fbf785ded4fd217a10f007417eaade559beea3b44deaa6d9fb43b77ab8042a1c060227f5c7f3119069e145120d7e1051e7926f67838cf5dc72c8293f9d2e671348ff5f9f4f4581e64b20999fafcd3cf5f3dbbfbcdd7dfaec2d80b3cfeabdffc4dd9b57b57e2a0a56edfa184c5264996c799d0137493a4c2873e3160c136b20ba3aced7bcc3dac09757b3f6c93a6096694684c1b720ff61abf5660b7249a67faecd5eb9beb17cfae6ef64d7771b13bdc3fb4827b96076488e370d87fda7026af5339aa14c16860a3b9140aff0ab71a3c227be666e069bc4c5d2a7ceed63668594e17a9a07ea63d523d4c935ee2509e19ab998bedd1d7d4b5afe4e6a82c8202d670e47ae8e8e48aba73868065d374647d083a26413690913ca98eda8a4d7357df7f28dba17f688679562f9e17d785bf595f076b77a5be2fb4d9f782f6dde277202c1bffeeb7bfdd6cae4e65fdcd5ffdd68fe5effffeef7ef9e31f46e20d6af63d0d654208534be3cae10eaeb72440d62cf3cdeece9dc995ee8aa80c56af6fb27cfdfa2a225ab2cbd5734bd5ddf5d5a7fb8fe7ee341b57f0b8ac5b301d352038aac7e65495ffe46ffec9dbafde84ee662465ee76e0a2d34026b65fa616291d1877d6385817fe6a3374c3a97c18da53ee39f7f8b03ff54a05b075d2bfbdbd4da230f421ebe6a6aa9228c1c36941e087e23484122f0f878b4d2e847ce82b680ba9e05120193cbe84ee88122996b927107c9402b92c2208763ea49122c9b8b06e888649ca56d4bd0c609d93e7699827766a065d8dc5c5ee8f8f8fe5f0a4176f12b419e7c796f98bddcc6cf423b340b5e13127ddc3c5439c48bbdc936e5034e505b5e70ec68aea1478ddb483d68fdd3c1e5bcc69bbfff85095f6b4fff4f9710f6bf3ed9b6fb328bb8a981f0acaa458f9c51422dbd50ca681b764cdf9814fdd7615ec9ebfa16a4a60e79fdd8571144608357088bf709e649e5e206b65205db33a29e5c56ec743d9eb81cecbe67ac7a48a8be2e6eb1790d475cb7efff37f2fcf8773791a914ebdca5c9976e63c8ed23e93c7e6e987bffc2549c09705c2019ac32d137ff7fdf7e5b9f1a3c497bc9d7ae04e3777a084b63e01d97c1ffab9e986090e5d2d165337cfd6f7bc719921ba01ad5d5bbb1bc6cc1d67861406e25f6f2f3b984fcbaab2bdfbedf7dfbef9dacf2e9f3e96c12efdfcf4782c55e08ad6d28fd5e71599dcb63ad0722bd6d23391e2849bd8678908e65930ebaa5d29090c10203001261e6912ce7624e7ea978ff7aaab88d62d671c3accb5d5873be7c3a2fa72303e575de7275b05af4fc671ee174796dee3c70f348a67edb543532a42dbb18dc379ec21305c8bc84379ff74aca8067bfd26596d13b9e28c84ae3b00125c46740e65e85fba255f0bbd8f841cdf7db83fd4335ccecd4d1ec47973eceff74f1ee7ab847b3c8c5d3daeeae44e3f778242db585738c3f37d46f765154aa91664e972f9ec995e9a8def8e0ebfffe14fa7668c8bd5a1ebb37c13ac36d0748f1f3ec469040d36f205bcf6db5ffffa5ffcf37f9626318788b39a5fecb6e01016f9655dc156038afce04bc3756b5cf159776a059616a081df72c76120cb9ba1f5fdc0f7f96ab38369c03f30270a78d1761e8341a7fbb6afca6ab5dddebc781b65797179d934f3cd2abdef96d49dc9c8a25873bde48192664e329aa8f062e5d6d14c9066ce39746ab0c9f56a3c9442c2ab9da954fee44a13859b3062320bfc111a259233f3f68f27e883dc95df05b66a2b96c974b2ec953bc440157c3bc4f65883cec7d6edd844708446b81ecd3e514d73d6c13268f8b9eed8fff4fe138902b8fc429aaf6f5e402ea968f15848e699f8802c42dd3e286bdbbaefa641faf5b9d997fda9ed41fbc9f3cbc8b00fef7e360693326a5791ce7f3a3f429f322bc094f8e16337bcdeac26aa5fdc5d2b67643062f56a956da3f86ffff6ef5911465cfefb7fffff2584184c8fe7460e6c7ff8cb4fb0bfe7a631860fed9814f9bffd5ffe4d5ca498824123362abebdbbf66029dd2a72b0b8bbe5502610e69e5ac6284f031b3463edfbf106fe661a3ba822ea8e4a112bd669d4b5ce4550887bca26685f095d6ecee554ac77b083bbe7afbffbf56fe00ecfe78e0bf1e9f1e0ee622b1a804c86c54cc6f51c1b9780cf59088d38c7a9eb541d4877e548ac6e81e75233e3e30b74821f31aef724af15a449591e21a998ef3a5a74d3a83aaf9bf190ee8e8ec584371314e399754b397c7ed8cba0f08ceb2bbbb47a0a8c6df8498d2d1f9b591f8e70edc3d387eac7e3d368bd79ee92c25f4bf10cb10ff08c9848d7c4d3c9d32223d704cc5f96ce749ce5ad219f0edde46ab791162a8999ebaf9e872cdc9fdafffee7bf931a2cb3addb337203c205925d1993c51913b4b30e821e1f9f4e551d1601721020e27a4311f3e9c36700cfd3fe9ca7b1a150ee89e89b0f0fefcbf3d9677cd21679e54bb2daae93745528e3af0a4ca1aa357ff3d57799ef6a882c100ebdab7cb15bc3bbcca32b89498054e334314f7a5cc26d0dd340240ba8875c78288f3dac2ea1633f0096235f6e8a5451b2cad6e3682f5e7cbdb9b9dc5ddc66457aeae657af9e7da8ba50d17eb29a8da117a5bacc5d95ad4598f1ca23dca39bc06b8493f9419a871466de9bf05f8f68c2c526e4d5c2b25de705e230615256629d130be5e231f1d89fe8a81febe348a1bdfb51d99ebbfef3cb7e9c22398276108608b07a6c42f670a8c5dc3d7c7c3c3d1d3fce4778decff553ee8ea8f24dc4ee76e1b51fad8ab52ff159ad6b1ca2427e6df539a2ded1f27cbe2f952fce96cd149e39842e6db97fb1bbfcf5f7ff2ca4f40ffffdcf208b24cab6bbb0edbb2c4add619e2f6b20b351f3d041f8385f6d6ceefa40483bdb3c8f992b672936455e9e2ab98e1219e3afb9c332f5c1e108c2c4fa6910fa51b0db5d3f7ffde6c5b75f235f591cacd322c863fef2db5f611aa669d4d36cf0c4d2ff5c35109c40353ff20de0689e82601d656efb3e0d817cc60a7ebd5b2d6ee3422bb0b627c17cd4adfb51d88c385a0f4a0191773777831fce0bb9da64c7870ad430b8bbea0a9a2730a36483abd4571d041b93d073a5725d99bb2120bee57e68cf9aba03e2bc858217b29133974a0d118c69922c70cc935b2fca92c0951208dc922ebc906acf32c91ebb33ccd1508d9c4aa6d9302d5007eda846469e4cfdf0d3fe978f1f9536ce08b753e6079bdb8487516ae7622762565c14d229537f81d18967150abed0c88b3da07a1b12e3c58d7a9a8e5007a6ed5947831a9e61bd7b76fde2e1e9f8384c53fd8434982c23aea413b9b9dc9efa9a32c5acbfb8e65576b52d408782793690bbd5f6e58b174fa7c3a969a2246cea8907c25bcc6359c2b36ab3602838dcc7a894a557cfb7bffbe6afbff9cdafbe7ffda2586d20f82d02444a7e71758b090f221f9032cea317c4e0b66255e449706e5aa1a82bc61f7b43d7782144eccaf3a0ae44d7544a4966149ec915a80aa0ee1a033a73672749bfe8f5d5ddd7bffe1e7979ae0f2f5edc540b55ddd0bbfb916ed10bdeb39d07a9072e75c0f86cba5b4ff6a7b32abc6296d63734499d13edc4e8767111c0dccf8b60ee79c8962477b76ec5122eae75586a5512ad6e57eef27c00b9b50449c00bb8430c130dfab13d750d1c16acdae753ab970968ed2f029978fdeaf626a471fc0c0f90c573ba76750db6709e0a6e6ff66b1aafd472968bd7c8d8b303c2522c81ab82da9dda8eb06ad6fde4ce7c00a26f2e6e7c16491eddffb26fa7731c46c8071228b8ba7516edab52f73a8f7c4fe065b4752d5ea19860adc8ee722b8d0838427f46e6213b10977dd9ced273c74dad550413ba704bc37cf5abaf5e5daeb297dfbc4ad2d49db284af7535bd04bf7df9dcba65b165867099e7288dbf79fdcaccaa72870df9ae58431fc342c01d2e5defb8795a30f569e084232839856a0c20976257ca52588f79dda47994e4172b3f4a0b06fbafcb06e9a61e9f6a5025a11e0556aa61b35dcfcd9ef67dc46d92169c4f01d511f1cc2a11432b4ea30f87212d3ff7562f76e5eeb82c769c5b16206a2ee018413044cc7d625514e42355d779b185cbf1e535867ab5b94cb7c030917aa9d6bbcb2c967257c486a937609257db751cbdbedc50e6afb77e9ac5854164cde1bc5976949a8cf1da23891da9ccac2b86d953a58e0d1984f6eb1e80be56d06363fd508dca8b3442f862f337dfbce8c9f2fea7a7730ff1d45b55afd719b7aedc54b33f4532ab96ce1df5176298c6309070f971e4bffbe9832be834431f3744391f29a08615591770c7eec464b20a6fb7eb699eaf56574991bdfdf66d86104d2362c9028de0eeb018fe37bffdab735db93df7244c9364b7ddcccb1887e1b12e1763e6b2c727350d5484d95c5f017ba0dccba69a983d2e33689548d973d7b9dcc956e62a56ddde5d331ebdfdfe3749967eaa9abffaed6fdefdf209fcafcce203e5bb811b77d96de9cf0983e41da39843195f668672b5869c1d96186229bb74a5df1ff62a0d28c46ba75c81ad8553ba34511f20cd3d8f16aedebabcbeb08665ed62621d681214dc803afcc48b6812c5f4cede857e9ea59797d722e777c526ca582c836d9a6849cca4a290cf15406ecafd749f0eb7fb618c6cc6b6d073361041cf2131e826ed6ca0d532fb3119ba69f2c7a13c575cc6e97d3fecaefffaf9aee09b8b76188fc75ed83e76d51f977c93e4e94a7523e2be852ec61b4892271977e56dbcb0c8baba1194b7fd386bd39c6b0ac9d68f599cce3e4be36c3877715e6c36abf78f8f891fd63089adf9f4f43ece331e47eebc92e04a13a50c5f5f5f277e90af0a370fd6544d6bc59772875d9b25b93412c0b6d9ad86be1d86069c07379020585c394786b177e5f8a691cec6edff02c8d2b43db7629d5cdede45171b1fc96ae76d7e793eb698e373df0a6f05d2b390607a48e3689e5b32572ff2b0986cb049e948c03ddaf3bbf2c9ca39606272cddd3dd718619a43ebe9b0551334ad07f504c211a06acaa05461b0ac513cd1eca481d3ccf6e93a8315c8a93b43c2164d33b65ac634886cf568d737811a861998310701198746042915205abfeb74b8d1a1f1240822742771ce5ad8e568a68035c7018361029b466dd98c2cd4610465926ec3f516caed1a89604cf7fed35379f874b95b19a5aeaf5e3e7fbea9abd28c601fb898b96c7b2f44a4f1a6affab2c29c2505b8d72d9302531c416a775a75aa4759f8a0d42f1b07925013a6ab20e1d5f1fcf4f8f9e71f3ec1b5407d3bdca38cc7999bbc79988e5034c682e47d77225409e1754377b5bd0e053b9ccf3c0eb745324eaa6d87b68182671e1250060935ddb90a3ddf423c39dd3ec3675fbd78e30711174111fbf73dd1e3d09bbe6e471b02bfa59a6ac27c6f9a38ed565c98a5413a593ae454fb71a4a856ddb2ce04fc2f9160482d4408ffbab833a934f546b1874af35d21494561fee663631056a681b944fa0ccb10c42bfc1cd0c286c7a84b6438725f7a8d116442ec62d075eec08ff7e02a7ff0d7045646d894d76d57f0046fe5b3d0836e74cdeb52ed8171251dc719aa168e9677ac0e753b853deb8786d6b37cf1fd2b2e57a0820f7ffed84cbd3e3e4dcb3c2d63e8ca7eb4fd044e739df3a228c9e2f8f3b1beb9d920e420b866b2a4e97a821805b1f44b902512de1349c3255461af4cea6e7d30152abcfa6e759b04ac2b8f1fdedf97d5f18f7ffccbf1a92edb4f6976c5bf7dfb5d988760c5de6d6a8888b906659a18dd9b3c5b816aa56b81ed2efd3a562bcfa35d6296787e320f348ae1b3e8ecba0eb06a19aab261d644d737dfbcfc5594b873f3b288463a79926f56f943bb244b00c9b472059cc9323e4218d9b98b3154b9db56bff003040eb773c8c56c313f59b0864af560f31029ae60369fe9e0cde08ba563b771638398f4b9a04be401c78919e7040acbca6443524ff926187bb2767d1f7d031f65a07cf8001960da59a773ef02d6dbe51b09e266beb26d5f5b0bf3962c9dc78310105b84125e3ef6e7f64ce6884474b45b6b4e3ce0e706ba01589d02acfdfcc6cca4ecc8fe74783a7ef602793a3d6144042cfe32b74b3fb4ad75d6cb747449b3884f70acd3a91ab77162c1845d277d91a60931fdfb437591a446222663338d41101549c8d448991709dee83e94a1145e11b86a06fbcf9faa117362f8eef9332addd258d70f7918c255512f1e9a16893d8079c77a5fb58cf1240ca178dcd944069e09a2dcdf6ef3fdb9b4aefe3cac8b19c78e18128409bcc4767bb18ab2cbabeb9fdf3df56db7c09f43bfc1832cb3ab8bcd8c2bca34b9231d091b1caa2fea6d2e4f83bebcbc247dc7cd92c6317cacbfb4604bfcffce2a7f7321a06c366b5701166ae16c42c4f14a8ac92766f0b3cc08e5bb1530d9c31692013a4b2ef825f0c8809a24f742489338a5cd39a3ec98c6140079a88beb97c6cec3c3bbc509ecc18fe1d2a250acdc98c541ef0e0c8289ede20ef36f206cdd42be825f4875263fde3fd125f4d267ab6d523683f483f6d8bcfff90f18d6dde6f278bcdfe589ebf83e9a99b108829641c30231c041163c16a6a15b2f72456d5db10dd5a922f0ee9e3ffff8f1330872b7cedd11de055ebd83d1845980236fe7d95d0df53d16a6b7bbab691c3efffc137ff5f5b78e67603ce6052f4a43c8d75c13d7a39928800869ab3659154a50db8cae7e83178a3054fd786e6aa2069094859563b05f8373933ebbb97d9b0302a22c4eb8db489779336a775fe0e9118f9eadb2a604482c7920ddd293efcba98bdca530ba4a25dc2ff1444e9534ee34aba919f12222b428a9b75951a8302446ab808064323606670e034912d73a28cb5609eb0356109ffac1d89068c53533650fcdea79c02a09c946c3454d1c1f10cac463e073b93cbd1b750d9b8a09cf34c04fa7985d9330a89741e3af104ceaa02b6009a41a352d275525d438ece184947df3ea6517e60924c6dcde1f2b8f8fe78707ca6c4239d2f1f6ea7a1abb433f409ab9f21fae4c1983d63c8edd26958733ccaa426eb8b5ad59fbd0f1717868cf5cd054fa5648c8cd789be724e4457173bd0380acc382ae83b99d5312596f264c427ff26fbefd6d81d1ce314008b0c501a9d08a4b3bcc603e4644e844e2f4a57629537dcfb8249c44828c445b24b2a26b57da6106968eae2e45f8e6577ffdfabb6f58e8cf8f4f88d8ecf90d8c571cc78301382fc8e2199ca92d321b2f94311047e7e10d53bf08fd0854d7f014f44bb49694f5d4dd3c6280d7c50670af2bd7a2b44875596334597f668b25b6f782e7eefc2785fa813e83c2818041a4e133105a06c2d19a79668390293df614760de0e31a7113dfb6ae9e66124486690f514718f344788dd9665419801f267ae2d5d046693e2d6d37ccaee061dbec591ef2b89be7d7dfbcf5afaeabd3f46edfcd80c2f3e1786831b990d7b14f891187c77bd76d974c5d3bc4a120f3d2f40384b5056209c80235330a38a290e3cb345a529df76466c4067e2a20130e0f4fc53a717b238282bdaaa609b3540a3b2b5730d712e38e1b3c7bfdf6eef6ea7cae8ceb1c3379b12790b4aebaa558c5a9db8e72f7e7e7c08f1123a39a432147b75c6c41575118e44502e6d7c253ccd5d3de5cbdfae7ffe2b79404ffe5bffeed7ffcafffe1bffce7ff787c2a3fdcbfc3cf2925fd828f7daf3550c406cab088f0e12c885174b9dda4099d23466998297316dc9df9c10bab247135ec309e798ce7805a23ae5aaa2f3aa47c8759f3930226798af0006e5525005cba4ee1391900b0a725caf8d28bb870b74adcbdebd9c601e42105098712619c546378f782752cdc3056cbe0e69a824418903364c1343e9145f45920465b9bdeb71ed5b2385510421920be1bb9583f07e769198c8a8c7a1cc7c90b3d3396a1136c7c9e173df7599e47987177f147aef37818753bf6719a49e000feb52073cbb7be6ea67375a2d24ff39471a87017ba00b9c71398089ebcc5b047abb87d28232fec35e084d2e14b59b97ffabbdfe18b605b962f556c40af8d3ba42793ed6a97afeaa674d7b3215d9709ca0c1e87026f992dd65bfc72b27a5714f6cbc6af9abaf0f2f9d75ffdeac3fde9c3c75f4ea77a9af91a94d02e33b545be46b4f92164c4ecf99223c9882b426c9525f3803c7999c7ba99b5d541e04918434525645be853d7bcc592f4d255e576c01ec144baa664dc18cf23f8634fea659ce711d9c5176df2dc7a968d0c66c32d22939ec72b8da49867e8618c2390c48b6e485d4135e6891469182d2c7dfd0283e41ac34c19f53bea4ac0649683a30fd642d98f8d6251a03a2abadedd013bcf98cb48ec5edc3edf3e0d8bf2ccc3bb63e0cd7a98aba7a7a9af43ccfae4ca4712cf5edf5e9ebb96cfcc776211a345e3d53a5d85ddf9c4bcd8aa059e8d28fb549d19e1df7ff3b66a6be947e7f3416b25c2200e18d2ff328349bc500b90ae839da5507d8baaa6c5f3527ef5fc6e82e6c7a0624061f3ba3e8c632860e30ad524a331bb3c5fda7673b19e670dd443caaff2551a0570112b77d1cb5ad7a80273c15e7ef557ca4fdb1902477aabe75797175f7dfbddeee665bcbd6e8f75ab270c38fc91ab302054d3d6b984476f87f3e7cd2abbbabed46d1b823f139ef60016290dfe419c7856058a3400701912d7fb0af3e04a761921e265bb5e94f17bcf830bf213787f57ba5937ae72184405921da015ba2a620036361d806c32bda1d3a355dc9a65042065176e6b8627428cc635ed2b49b7e8786d9e1e2858189866967e721ddf6a508cf1e7aaa745d813bf87fff0f3cdeda6ecbca787277c5bdb34ae7f83b55d7bb4c032d833df9fa7f270dfb95b6d43ef5ad505ae0205bcfff9f133a151d3b7aedeee32474132aa81121e46919dc0477052fed8e958e6d9a5dbca5d17e1633375e72ecc62572a77e141e40f5397c405df5cdd2288db614c5c414a2a5d6b137769fdb03fbabad1aec8921af1f16a116eeb3580ba3b0d7dd59c3dcea8c79ab6c758aa79ba7efeed6ebd7efff08808901797d7aed283dd3edf603a5ca70718478c1f62398f7828834974f83133fa8e133b4bbdef6fafeafeac750bb104a0951dbc6d02382152db7e62ebccf572b29df662366b774582073664b2b51e992441140992004a278edf7547c88d519e88318b8ba0b305c99846936489314fdda4b860914c8d3f702f4666703ad4185f227ca0892501b5b9f0e7c5352bf60557edd8428e31e3d6d29007e592826f1a848a9526872d89fa53bb8bf0566ebde7f8f8b02c7d1a67b4ad9b7abf0801cc41e051332ecaf508f1400fc05c4b832cc2107de9038a98069bcfcd32c259b7ca959274379882080e75587a322e83a55d37e6be07bbe7aeacf400248876539d4afee2cd8b5963b6bd20f43c3007e369b11ebafae2e242cffad4d63c9008aea91d25ec9ad26e957d1c8c1aa1d9f061c2e713b16dd5bdfafab79debc9dac7096409433e1b29eaf3c9e3a1253ccba3beecf69f7e8957a00528d5392df2ba6ddcc7f913ebcddd8b1b0e1d6fdc7c43bb247271e58030683020ddcce054a98488127d09c1a168ec6e4ce059317310cd4144a8a19e58300790277e60444cf444a8a6303d1b017ca35e422914512423ce20aa8bad76d54530a411096691ac0d1be9b8703ed059b020b00a0678ec00dae3003cc010852a183d1627ab9aae9ec631dbbe7afbfaee344cc58a3f9debfdf9c0dd597943edf2e9c3e7b1ada1289f6fb66112359d2bb4b70d53481290257cbfb2eae5d76fce9f0f01681cfc4a8c5966d769d968d7d5c8f722644a20aa81aa666fa85c5f5cc202001a9709100125a203701754a7855e372c8edc156fc8967556b065be58ad98ea3098e3347553affb7198e67cb5b9bcd88ecaf45d07cbe807c166b55dadd7ee30110bdce273d361685c53bc752672ffb2b88200bbbdcec0695962afae92bedb336a27d51ef77b0ca4f45da11267232309b55a9a1ed498477e3f8fae9d49189868e55a2e8f068cad738e9777ad9046e9e88a21c57a3db444050008882157e02e9034259e93fd4ab3d4848678b1e199dc787a8c0912c107bc2f14ff2e018db89a9897af658a771f4c7c07856a664fecf2b99a581c90a571b5bf134955678dc047b1cbb081d61f4dc90ae8ba62fbf5e87b7ee0b5e7f6f0fe185a6e78dc13658250245912c7d02a81650f53fdf070528b3bc9d10e4d91ee4084c6082f0afff2fb7f2cc14cd29cca659addf11558a44d14e8c8d75d3934fd64ddce4ea587b4089ab214ca566de98980523f4b2e422f6cb4b0439f6c56ac3c550240e6479f3e3c486e3efcf2b3136e94b6ed97f1845374256e58b6da625291c591845227eeda53e74a54eef727bb20e72cdc110b93242fd641006d187a32823e0f65d7d4e7aa14860629ffcd5fffd3344d9f0e0fae903f633906ab6daa3dc899c2be44c1056ceb3040e7b1c102ee27d816e0da32592213884f32b6fa0cc3dac16d2b131bb557c4356e247d67ece0fa00338204fd5223a68027775db23ac6d294e7178bab0c42998f0ce4a41ee1c4941aa669b649ceda035e5016291e465ebf840e3620dbee6c80670ce008f731a643619999967138e39bcef93697e1eed3c926d7570fc793a66e615b86398c5fcc449c06dca32c96633940238a244d31a1d496201d438a2ca7da521e6c57b184b3f21748466d8dbbf2e531c4710e93364ca1d95cace228cfeb4fa7c7871348beaa2a8fca01587d3ec2b4e7820c75a960519edd5dbb4a77be57d6f5f978e2c0d34886121e58710e3e0aae375ba80b78b9a99f02419665767001be75da2008c210168628956f7f75fdfaab5fde7d5c26753a9fa4270fa72a4c7765e9da16acf355557545986b35dcdfefb3d56a26481ae583e2b2f8782effeacdede632000d4ba65335f98e97600fa8394cee8e70e4dab6383107690c2ddacc2022d769001e0a6c8200f17db008f08388c40a0d5b2d62e8a686741ad989946223a16b664f1d718d50b92503e6532f90e18cfaa53d39405ec0cf39378712946663b8f4412510a76107d508cba4b3a7249b87b16df9b04d9eadd7e765f19cc6a15d5d9daa66984cd51ff150ede1bcf44dd7e9dbeb2d335078bea74d9605fb7ecea49c96615834e478042ef118f2c313aeca320b85c29fc17943ae717f1886598fbc857c73458ed4d243d8cfda1da72af2e4348110bb613417ab885fdebc00d77bae928a46104363232920c3ba413dbbb84b36b1f0c26e1ee350823917c224f1f11f48f908d4aacd190a0d1fad8c289217bff97a84504bc3a65eaeaf76ed30bd7a715bd50d35b04773558da7b1dfadae9ef665f5f400ebed85f166eb1b5d4d6a78f9f2f5dddd35dee4fcf967840724a0e7e657524c521cb42ea6775fee43cd90d25684d4dd581b5914e3992d720fa4988ab9912c1e01ae0ab4d64e9282b399194eee18601830aacd80f1c130cc78721e2f7a902cc2e3afe151d872907d40e0718399768b4dd74b7986c26b0fee662e5ebc91d97992651fcab7d77ae9a3381f9945663c7d6a9f7a83c9b5a5f5f1035df7f4f0e82e8b1a5b1d4e3ce4755d8ac03b3cf649162709d71e5bc39b4e733db4dd79bababc82430b3c5e569d1d109b4911058b60103080b734719515dcad2668479a2ec31cc511d045d723e3f8537812ce2fde3e8768eaa6055426c3ece6d5cb751ac1741ceff730f2dbeb9bfdf16344bd53554eb3da8431a66f5f3ea4b94795a88060ae1d332c9ce19ebd7cfe4a75c3e74f3f80fc791668b745e68711d3840d237d7bb38d632a3d2fe1f2b83f988545bb800a4ff5f3fed39faf57eb9bbbad67fab93fcaaecbe10b37018739d4c85550fbe4d6b19b9e6419f88efa0183e1f013e296d83d6363d87022f128119c9bd5a1a53d3d6800bb89143951c83d73c16ca39192969e4804df1c02c328896401809be45aea8e2b35bb7ed01083da870f60a3520884953736e960061a17ede863445e7dfd7535ebcf2552a32f27df4cd3fa02d6b3d0a6178b29bbae7c7a57b5035802d2e1faaed093abb28f71308c4e663633c58ff871d0344396ac5a753a802fa70e8a66506e4fb89d96ccea96f5448631c49f2bbe63052689d1ade7ddf75d3f4098d9ddf50ece5e214bdfbcf9eefa620b28d79e27301d9e7dbabf87316e7b5081571dcffbf3a38016ed0788a9384adaae856b4921693cd1f7caf721481888bd3e95891f7df5e6eed3fd61bdb9b6946d77178f87aad8a571200e7dbbbd5a7f78773f4b8fc27a73519f3e9dcba35ee6ebdb156bdbf43a7b7eb19298fcaa5aaf525025f01c8fe7cefd4137cebd190609ad4462e6876c69a0a430899e0ffc83798085b02c486404805aabe10c9dcc5dad0be62a96e26761d61c80f86e47c220f8c0ad21fc13a5d06b5a5c48754c5c0fd2cc23a79e46623e9f6900d5135aa059add41a365f968b8f0f1b8cab8ee69aeb74a5e0c92eb5258b44d31cf7d504eadb1f9ee6463433b8308ae3951777f0260c8a58bb9bb0f0ea6e6511e4e17b9686903589ecea49f89119273fe09617b0c1c017194455a3dedcde965df5509eb8889da40b303baa3977ab6de227a9e1c24e23e889bf7df36d3f4ccb023d4d0657987cc15c81e37c098e37e0404259dbb44114827304f366354209cf44f932802ea7500d8cc3df50b2cc63fffd6fbe1b4cc098294fe76777574d5781d3dc12c14cda690aa20081c3dd325710c4e2f38fefeae3070ffca6f5d5abbbb7b7b718f5b93b857ac4c4409d3348493dbbee1ecb62c1c018fe3843ba6bb7f10fe398c34ebbd69f4849eb560d08fec73c9205f64d7c29ef05cd645d97ac2876ed0df4e26edf23f460b2a82b444da11459c6e7de15089b267707a06d67e7c20cf77b53e936486ba74c787bb2158be76c75fdecf92cc300768472db0f9093c3e354f77dc255a3d92a4f733a3d7cfa2c545704c1d12db8b8ba873042c00ebccfdc2fcf2f2ededf3f2ccabeb85abffbbc07bdf90cb8afba497b91ab22a7956a8d52c0806650963e5baf0e65131541799ebfe0072d8a10eaae3a9e824d3834237ffdf6ab695ccc0270064449034f162775dd46f0aa9cc1501559dcf553d5d4499248cf1f077c979a9c65965acf1e14c5bcf4eefdbda9afe1ba6f6e9e2977c51029d4df5c6f9a615ef941b1ceeddc5f5c16ddb9deeeb2c7f3191a5a7555fdf47e6a2b20dd375f7d77137b4826c0bce044cc904c5a8c9aaf03ed3a38b965778bcf00d1bbce6920396d802c61621784404088a1c4b3fd045487b657aed924642fa73e9275413ed1118a4633afa12ae5213c2d302b946c5ca8a0aec94f2f85d4c3447dd7a6597bc4157de0a322c9aca6d27295a46da36ab17efde6666ac923f48df4ea611c4a221dc48d3de12b1e8705ef0ea7fdfe1151b9cef3e7dbedb38bdd4835b420861456eafe7c9ec7b18862c2f9e7fb8f699244101f786b8f65693af40d14669c04f569d85d5f258179ec1bc84532f4736761c0969e72df09f3c3be8a7c5f01b428e55ffdeafbe65c87913f2d90f07860152711d436827aecf177c83035161a8eb18bab5bc4c8e0b6df27d7669b1957b7ce92b26ab6ab2ddccdb13e8cfd92edd617cf6f37db02f277f7fc851acac6a89b75e61abbc21eb93dd0e1dc4ed1bc1ceeff42dc5a518fb0fe27bffad652130b1ae13b9ba798738fc3df7a64066bcb7e9eb9af845c4377e9bab79c303fb576e2b0b6a3b561c292158327f7dde11d22ce862750ae0025ab084b3c49bfec22432c8509873f95bda5ee128ec8a82911b982284f2474318122edd25470d1167c35065524479130914c80b88b97b074b3948002d70a25972930c95abc1d540d8247957d6b5b3dd7c7f2e83a7e2f6a995a77d6b646268b05b1d90c0481c6493b908bed06b686686fbdcd63df3bb5fd3af2473de3735db5a53812f0fcccdd91ed38e496ecb44134de5daecf0033f88140146156cecd260ef9e5ddad3bf43e424d41f90c017e18aacd72cf5d5568211ae1e6f334ccd2e272b3aaca33e590013a2bd6e0bf80d869d25dd76a439e3fbf4d636fff74d28cbff8f66b9f2333228151d4fad3d30911716c1649c7c80f16f82eaaf3c0fef2e73fdc5c5e733540e07ef7ebafbd4462e65c7f47757286cc4fb986ed233ce5b49eb9ee7908156bc8a889852ee6665cc42c14cc55e0335dc3b52db017ca9941a2533ad5d011780ba4094b85ab33d74d324d699492e32476aedf10811d92c0945420709ec6310897e930c3872ae878cc17818b2313edc5fac3e72acd6451dc84816a2795af8bf7fb53c4c88f0fef483f4811b57db3bdba956a76bd004f35487c9a141c580fe070465b2862722fb44ac71801bb74d579d614523fc47c782083b03aef01ce445ad0fce22cdc68cc44ac0f27956d6fe6a141b047ae4fa06bfe0b04ec3bd0a7648ab3b16e6127678007e557bb8d9e47c0a336f0bd704ed413b408bdba6d4ea7a7a7b32bb890f99898c0ea65fff0c479a025298aecf2667d3e1e4ee79667d1e17cff5fffe3bf530a2cadf4dc5e5d6e8023094f204c02cfdbac5773ddab010ee3b0db6e0532c4f7cbfb8ff7e72616720628931ed8375b773ed94a1fe46e25e7456234b3f5696a16c388812dc4ecf24913425808f2828b5d5c01df914f07d5e3373da246eeeec835b49908320dc917ae15c0b43d439ba8dee273f4804877fd6b20044966fca576376c2c904f89bab6413ec2570649dd8d69118d2af3d6acb6f94335d5d354dd9f0ea7391157114f82cc8b82300ea115103e92d2b9ede6d4675d5fdfedae8b8b6d4fe6d7cf9f432a62902554bae7275998416f50dbf74bddd656e099757d6edcad51b8464a02b3f85e146505194c599dd7499c06719017842820abc7e297cf5ec49ea7338f7ffdddefa83bca063bc541164af79bec02de6e523a4a020521c7c96e9535c3b04e73a278d99c60f81698f00598acc9a2a23854e3d44cadbbe18490b3e4f1e38728f45ebdb8610662963d7c703a9e68db349a12fb587519d77ffb7ffceffd62a6a1e1ae44bc7dfeeacdb65823d6a498a7d1ee0023046c8b189bccc08d5c163d910ebe1f829a695fc8106e10e9952c63ed6e5df41d043be8ce8a44b5150f32c015dd246c8008f2ad07f402a32e84e30d2391057ca9bd6c636da717b802d7f0801e8ee04833d5f1d02e74e9f50da8a5e7415d0ec62b36dbbbd29070b5432e5049da6a4e633930ef527a93e4dd84f7ef308dedb11aba06823688e1c1c7eb3c6d872ef7bd58c4d1b6b83f9edd5d233839c80c2af017667c1106a16b2920c497707c20f1533f06815ba62bfb4606ae0e460a3c9f14de024c142ea297b63d9ce3dc9b1b73ac4efcdb6fbe1b8625ca422f0cab6a3f42e6833bdb2ecad3b2ec3c11ad56e976bb85177e7cda03a9a03d055426611798d76646bcf841782eeb344fd745be0aa251bb2a36c7fdfed7df7e8f899fb84f07db74fdb37c05d9c3b94cb348b7e53ffca7ff74757d991835b5aed87c7479fde6e5159c0ae6781aca98b893335093da7e5943517a5a10998c9c4f265f437bda7ab239fcb884186521dcbd3bfd45829c995a64cc2ad7a9d400f397c500cc4d6d96182ca4213ea96bf103b08266715d8bed229345d50b671db460efd61603daaa320a5b2da7f0fa34843d2226dfdad03c024e127f7b11b453074b5b9660f2f6d3e1d1ba53bededdc56a97cb419f3ffef8938f648bfdbaa98b5d3ef4407efdf9f189bb3bdfd290799c3091aa1ce675925e15ab89d361eae1e16157aca5805977f04a59cca9f1600a085e1212db22f71675aa6b01a5e9d355987e7cf8b4ce627efbf2053c1ca043e1bd1d7511a51dd6c711cc4bace6e9787e2acb66ece16d141330fda3d24b0ecfb4a881d2cbcd451aad5b33005acb53d5bbaa1f03847efdb46fc6e9fae66511794916edf74fcf5e5d0756360bacb7fee5effe715eba4804766ec16b66d1ad9e9e5f5fdf5eece82287e984d88b3c77f2c5f53d831398274d8547f11fc32074bcc50803fde82e1ae3cf5de7576a8053dc3280ababb2e0ee447969604757600812dd8e42241168dc4cf3ac671e2a2033040f6c885b4d85ee19895595ee8cc15422d9a3cdfe543740d8fc62f1f8d887c5b30c0e61910a72b9dcd36a9ec7f301aeb8efe94dbea60ce64128ad8f4ffbd3c7cfa0104e26b0ba3be5e5ee2e4f0c4fb1d8b65ffc3884bf48c2f8e6ea1674d181a2bbde6892812cc6a93576b7c924be088a082e88d03cdbd5ede04b09b280c1d76e53942dd0207a44e47849c277eb4b1e2473df2a359f4fcdcd6e47dc2dd1e1782aada6f81438fe3c4f877129f2b46f473f88f1cb3c8e18c4922b55ad933c83a872658494499322754b59ae60d550f7c2e3db9bab44c8b2ad6980b79dabea9493eefff71ffe3f32f087795ead22c8278c46733cbffdeed5c68f1557592c04d7a4779d548ceb9b0c5de1f425855df4b5862bf47c7856f851aa3805c3ab81e8002967454ae023bdc84126a619a39df8a03db840c633381d0bd9364b11c275191151a1e0a40817a1510d6257431b8feece40cdfd1350b4e3555c7453ffecf59bc7b9e3614e42efe1a17767a83b26323f17de2a9588b90a3032b5e74363c4d23e9debe371eccf5717998822900d24077cf30aa6214dc75979545ee409e1604f591eeb002f018cfc52d701f01a050814ea4dcb143284161d15c61f4fe90e50797c594677305a5b57d877a056b02849f9f3972fabc61d33849b2f9b2ec87dd7f36281aecea769ca8bd4183a0e4aa60984c7026562799ea6eebaefe223f3080f110f5feaf338dd05573f0cc30a801a877d3bbcfff30f5e91af2ff0361299bcb92828251ffff48f3ffff8f3edf54d2c453334f0158ff78fbbabddcdf3673317b9ab0305b5122bdde13ba89474d20cd2795c78c48cb763bab1fe9a0108b93093a5193c1f41329ab9357e4cbd4578b0d04c84b03c6e258479133539a307c37300abbb0806570ebd195a7c8308208e942040506838a3fac64c4145fdc3e255c9852b73ce3379b1819b9ada45847e1ed1aa1a762b56b5b510cb8787ae43bc9fef751a171e71b77a86fadd8f3f86a1dbfea1ce84cd772f2e42219bc6ad9b247186dc3f0f8824d32d25d7160e5b6bb346924cfda9ef7d0cb22b6de62a786ab54878a9690c63a1e625f083a6e9e224046a868c2fe3d8ce2062c1d7d73752cad4f7ba09c2249e1624de8cf0e7143a8602933585873682eaaa397840643d1aaec7a93b544f018c9199d224824c82c39d30bf1663a9c7e14b6f73ee6a45bf7bf814c7f15f7df5b637cbab9bac7d3afcd7ffe3df29e96e34dd8471b6c99037009a7e9a369b8bfdc363946f36085e7cf9b19274c65043b58472710580c44c44f8a5f033c884d8c8ad0b318422c503182b5df12d8330ec461ea7984644a9691b12ee04eb95757d65e1f2a1c181a6e4cb797bf038a1c030e4c900416b1733f869558ea39754fd52122fbbfbaa3e3d7581cc8beddd65f443d35e25decf9f3e4306571f4e15e343af626edc7542167a20ab409d7f79f7eef3fb8851c030b246084c926dab5630b959f9c753ed6afb4e3de106c4dfbacb90dc4f315b2a0e5dc3260a97e0cabd04cc2d35b82d8ad9dda419d22800db034bf35d8629ec3bb0b78d3d112f863f7bf1ca33cc55a770a53d24e2141a2904822de00a32a9195ce6c15a217be19a091fdd1e309cb0d05c606ed6aba2eb9a8bed8db10896c8ed0c281d404809e92e3ce0bde6e1f1b0bf7bf1220882a19fef7ffcf12f7ffffb2482a99e20e1ee6e2edafaffbc2a9cc6db53d940ed179737be058b1b369ca051bc60e4878105c8134e92103ec60439996a268062f09f9886914d94c58a0e98c629e0b1eb17aba49d100090a841b1dbcd9dbb120b4815914f9b9ae681b629e35f7c0b14949f9372503d102fb0a1fc68c47e00edc522d95ede3d6f158b20df67fb707f00fc309a95dda1f0e2c44f88a52334abd266d206fab73c4f7dfbe1ddbbd5a630530b5b871fecdbc6b83f47f68b6a76fd8dd5d84b1601a2430825996a08f151ad7717e069cff798e7ea194e8600f8fabe978250c41f51268420f5165741d5c2b8f4740158cd10b8df7ef79b78bb8328f58214bfccd24844c5dddd3586107908517093157eb086f0e30a09386190577112fb3e8624cbf20014c58c2b95a2356832965e5382575cc794594d491202c7bbb2ee87f6f2f6860cfdbb3ffdf9e3d313b27ce8ca3c09ebd3715ff6c08daeae82348a2e2f1f3f3ce53cccaeb6c9a4caa98dfa81ab5640451a4958e04ebec9018943f86c3d28544095d4c21defa19e67a748861387ea6b1660ba86fe0549cfa383c705c4de42e6b8d2532b696bd80f26bc543d1c18f0d5dde573f5a09e02def5de8f4f7b7ffb62f66292739945aee7797b7aaabbe2323a9fc63b3cf6b0049157eea78e340b3cc9043c982f5c0b14fee9c31fc7b211ee86895a25919aa6244ab91f16c5451840641bd840c8f8f3500b1a8f132ced0025ecf63a17abe786869156530cb968eca9713da4c779f6997da8ce6ab67090502166c2a0420588a66b8b3ce457d7cf4117e5f1c158084e379413f2bc6fabf37170e754c968c7f3dc8355a4855873d5c15d2d5b3b17eb9d05425be3da57367ddf404ce945cfd04eb01294d2ed6e8b80681ac865be0cc3d8d69f7f7effcbcfef5ca91357b6d220b9a7a60587ea69f2fdace94ef1761344d19ffff11ff0bccf7617a1245dddb5d2fa01ebc0c790eeb3e7d211d41dfab4ef9062c227ee20ab2bd531236ebc109406d40f2872d06d67b4ae05cf307224cf6c883b3dfb65357ce4aea125f574bfd81892842ae3db669aa5f70be6078970b90b42ef7345162891550ac2a47df0fc7a757e7a6aed4c165a632a1ac03289fcd53ac78482febcc78f3ffeb23f95fb0798033f62641ce3c0cf36572f6e6e8609a839a8494761848ccd03273e1464902b6544e1da216b34e51bb7cc46ee1ff78040a4442a7933430ce948461a4f1227101348699f0be5be22029cc204e7be9f6ab7a9e90eae8f886a23803a406a777951d95594e09b21818090a7d3492328c23c8abdbe6c5c0776ebf633c8a820d53125da2a2ebcc1e02766dff7096c8aabd6baccc3c2d5f2f9f1516a0ba6d7cb20f19735b4b782a9ed6194601064fc74aa8a9b57fbd3783c1d4ce449bf5815ab76999b49796e1e218fa99e19036ec20a300a4283198726e4f89a20d09847d76b4701c428f4c4a4e0f93109944a502c32d5e6192d2b0ab190a4aec62bc68184b3ab9e29a08a8f8a9693111757d3c87e718bd174b359b7edb42250d6c1611226244ddb56a50a639ec5572c08a645839618698f4f0f5e201e3fdc8fa793abf702d8cbe49bdb8bd3a996d12a0afded26dd1fce0a84349bba3eb23891f03e93a1961cfbbec06450d296f53c0c41125c27dbb1ef98e4891f1dabda17eeb8063469b7b4e04435745ab8ea516ead5f297efdecf9c5ee1acfa4fb9e89dc4fd297b7cfa330e8fba5480bd88f3840dc38cc168c3795bb031e46855adcf68170d2cea9710ca632364d52e14e7ff97094c6d9a065eca6244b6131c76972c5f62135d5cce137e388bb5e2db32bb1e39a81b89300102884fb575757220313f73ffcdd1f9b53f5f657df0788054824478e9e2cdc79252b53fba5fe9ab74e55bbf0b123825ab7200af115bb864cae538fa2bcb74348389119273d9b8792b8e5ef818411b0832071e39490519ffa65bb558bfff1f4f44bddcdc165b40525145d356f6fb3876337d3e53abf402034aabfc87306771ae48fe5490fa43d97b070ee94a19a8b58bcffe99766ff80009fca93b0eed247b1d97dfbf5dbfbfdc75ff6e7be3cf32f772b20688e75eb32580808fe5930e8c3d4759a99217a8d9dabba538067ea8a1703962e2f5618ea4ecd9e8408a1f3a245b68a3c77f00483c2bf7afba66e26585c9801778f7119baba2ccbc3e5457aa8aad81d51ed21fb0c86645ec0a51ef042bb6be6f85500c96b4c9224f85ce6096b4839b6c045f819354e9e90f8fbdb6235b9b3f8c2cc0b7e4678507785c704a46f10f9ae5f2c72725ec6664ae300901c6e521021274869f2eeddcf0bb5d75fbd8ea5f4ac734872c2d46957039f524e626876571d06e40e6f0537ed65ccd3a079a4299883d0d8ce566401acc374aa299f882f1109a002330f56e6d009aec369b4997a7797fcbe9e3f7dae0f3303047de970bd52135b5d6ecdcc8fd5c3ed5568612c490068dd1f5a08df0698ca74ba1281dc3edbe4a6ec7fffe7bf3f7efcb88ef36c1540960c5a957535f6cdfde1a8054fa187397ea7b9bd7ed1b976519e17f3304d3ad75c88e0c1564504865ec585520cf81f1104a9d349ae88d5d810b7a821f1dad3d0420b744d079e72454fbef9d577dd4812619ba61d945886a6ac8f5f7dfbadab5428a84f3dd774cf4205e96e1c1004407426dc25354816e003881330dd8c8327805b867b9e1720ddf830691984e5e9e80b0f7424439fb4a3eb4144e06482ea70349016406f6bc33876d6c11921026a8529b87af5cd2a8da9ebda447efcef7f3c37ed77dfffd6462bb2e00bf0885614a1ee14fc2db7a0bdc1c0d143ad266b4f4162432b0c880ca998550115a3969c0ca5759ce90aa14a9198be143224141e3fd08f8d09d3e53cb178f3e9bedc0fb61e783b36a79323119dc4cf56f80ec120ca5aa726cfc78974e324f86695c8f04b0d02dd1d1e9bca9cfffca7dffff28f3f5f6c6f03df747d75b7de2601c2c94291e6c1765173d91f6c24190ba6b6d966e1b1ab4c6f1eca725b64d2771db720e4d79bdbb6ac1883fc2240ab6c1bcde37cb1c9c070473376e76ad2ae8b2fc56b49010270c8b5bd7dbde8f1743e3a71b1f0998ea0ca79195af87dcf9be7c92e6ec50206c68f3075d0ffcccdaeebe514b8828b56a73e7072741b1f141ad6247e0cc9049c84e283ca6b97c9edefbb3d51fcca8488efd49f86522be336cf841f855e57561cd3ee45224cdaf2506c3340f16ee39aa5c331fcfce3cff9dddb9babed2a70b5fb8db29027729d88092245eaded0b0b3a5b65e0f9aa47ce43e5e4cd881713158d76a02aac5222d5d4947203e062e173c52ba8d45011b8d49b03a4b6867fef2a7a649b40ce1d0d6e74fbffcf0e9211141b2da212c173056355fc6e238d58917ad37bba51a9ac387118007590a8698f474ac9ef6bf2865f0f8816f87696cc7b16a4ae98769ba65b69e340fc31426d80cbdcc5671104e6a809f147846e3e17f879221b0eafa04db0b17d1599573f2ec6a77ac1a1079c4a1c68350520664f7f99732310146907ff3dddf8079dcd204c48b1550b370915ddb0ae1df3ebb29cf270ac70c01cb5cd1df0190a794176d6440d3d435d2355487ab55d7437000a1dc6d8a90bac5694b74edfc2c713532dd715a3baa2fa796212e3499c62fa516e083d4dc77ae1d2575353c28d0a3ec8734489ebd7c81dcb75c3e7f7ef7fee95c1dceb074eb780dfe9da85b14f385622937dd001604145a3779844eae08a95b95ea243494f12bab7c9684f8461e71d7291e40642392fa6e41071a058eda15374e78b84c27fec3e1348c5d43367737af836d7effb1bedf435f4ca2273777db745c6631a7c2db9ff4a1abaac3d3acc23ccce2ad0e00f7ba397ede9f4fe5364940723ec40a40a8afdd09442f5b87f4d3e31ef202910a527295df8dec540f1f25671347a1a2769578508420a3ba6e56499afa3cb9d87efa7cfff0f8106db68b3bceafb9cd09997ce85f7721567efbdd578920fcf6f656ba4e248afaaefea5360315b4ebc738cb9661aeab13fc6110066dd5d6bd2b2de6240c08dd92a6a9e22c193abc4d6dc10f16a4e6ce082ab090a57deb8a8b52824959a490711c0317ec3c01575deb436483d1880fb02320c3081a41b38441b70cccf7f1b837d72f664867e1af6e2fdd8e747bfe87fff6df649603fd7399fbb9718f00cf0026f4a0d046e859580db7c087686e0cf5a4ab1d37faeea0ba0f0be20ef56aba65bc5e6c402ca71eb0a6222284e9700b61359f3cefe3a75f5aea6d572f0c9f85c80d613e0b7ffffb1ffef2ee0feb3c0baeb7ddbc3c9643ef856499689a6f3cb18e3ab89d1e12e5f8eee73ffe2201bde09588cf6e198802be3649be2caa832f1e41d9cc420d535b44e1c5f506e2c3d90940ddb4c0e14db3ebad5cd5e5c57a7dae6b77511d130c6fc47842030ccea99bc2784d58370d43a786dd667bf76c0b4ae65797d72cf081312378c4dd9f126db340f7a4690ea29afb2f579956052c3566478f161817727604272caebcd2dc0f213263ecd3340103554da3e7a56f5bd7cac6a8def512856af126082f302bb857f2b66b22e90fe330405a41fbb80687ae4da5f4993b5424a37379da5ebfb8bbbde8baa59b6d5ac4976978ffa1fcf8e93ecb562fbf7ae96ab51282fcc50f7a490a59e61a2e07be1b22bb10a43b9c05726170f792f82681af20303dc94ae89e25849e464c90f9d283c9422d30b7c1cec378b672500b0d388fa269584e3d03e87b3236d4fce9efffe887f2ebd72f7a45c344c0e6f89a9efafaf8f9082435d5e1bfffc7ff0283063627c2745573b3ca7ad5697c922f273c9a00d0f6427aaf2f36e752df5de4d063553bd5750d986f1622a00c85f457524ff0b26a803513ac3a20c4551282c0601cd36fdf7e63e91880c53df03bc68a7cf8f87838556e2741d3609a0678777059c4bd1ed0ec87d0ca61bc8a0537ccaf8100886a36dd6517a386f6a0c8eac00bb7d9ea703e112ff0fc6001cc00a98cf17c99c13370e7a413802d4c7be44dee28a1e9d5227d1f9907c9380e3da60d3f625cea2e3c8448a68b65f5d9b5633486bffef6ab00ca1046789e29d271b5cd7cf6e3cfff78717977b52974d7b9d3f6781f1eb86399aea2911f254835625a651458cf89302e03cc36d75c4f92f92d837fe70b66d4c81c186f27770199f38ce2e5acbb4e6d69f870bfafc0163d6f0055c213f90aa379f8f8878f1f3efdfa77df0649e22dcb5fdefd4426392d934de86d9c8032fefccb0faed4db32c7ae0a8fbb387928db0afa5cb0572f5fc13340142ec61dd2aadb738f29e2aa774596080c95655ccde66677a521f5cb264ce3d0f33089ae04b121dbeb2bc4d5d4b57553429cba05e57980cb83c868eb73e033fe57dfff4621922dd83e13cab517d153cf9609cc9264aebb3a24a8511d17e18461d2f30097aef4abb7af8b249dfa11043ae1817c56a4d1324c4048f0799c85138cb3a559910441661030ca5d4474a8e8aed025105cc5e55ac3b0033b849c95d9a5f14094ea9662bb4d39ddd7ed8be7afb6175b4cf6be5c98f02f6e6fb3347cf8e52fa7a6b97e76e9bc846a058604ca5b2b0e9b4c6285b9571377c50c3195816bceef851cc0d9c3f0733bf43632b672670b20cf2d8de8d4d23432bdf642e68e1c78a073fbf1a9f41701090f74c6af7be8f0b8b8caaf4fc777c7d361b3befd7066a46fe2cb4b6fa6bb5bcf0ef3f1c3c7a7875f56c1dacbe3be3c64ccddbcd156de5c5ec00c9c3e3d211086a1821469aaeafafa6aea30ce61086cac7ba617f72c201babf7631d9110c80102c67bc57992af93b187104506fb51e035c06333b992e7ca9ccf27fc9070770f6f6e004bf3d419e2c4d9b9ed532ff5122189370ef5ec0eb1cfbbdd96823184dde5d9797f5ea5d9e3d35ed911413debc9dd01f0b81a5cc7eb384c7ccf77755780531835223ad79c286b4750ac5c656b983f08d36eecf5e856e3fa1e46c543be20dcd23cb34a83c25cb92f63fc6df1e66af7b04c77bb8b404360ba8d84d5f545168a3ffcc31fc22cf3f2487891ee0fc266d69b00743093e6a9868e479219d222f3b90db85c8c819d3ac3c2b148687727c69553710df47b45a4bbdd0afb856f145013beb71fdad3b1f5fd841b6fcedd86ba1723d7bd7518fefee3210d76af5f5fac563b68de71fff178fff9743cfff8c7bf403fb8a37763b74b8b992d082190bc034f77a34f05522267f01d4c225a3835f34f9f9e30260001665d012430aa9e2628bbe7b77775db829a90183209f5acfaa9abebf67878621e7f3a9ddd6d7a351a26fa6988f8aa1e7afee6abaf254d949eeab222d02d51944421f41aa47a1084741146cab173874b9a16fed78c6ac2d835e7d6d5251514839ee77912c7208fd665a9ab018801032c16695ef743e2ee60c2e3eb8bf5aeef1a64cdd3c3a3759980192781ef77138c26700ff2d89d3e158ca7db9dbb8fdc8ec44bb697970b5d008da32ac5a8c2ddea22bbda374d4479b17a9edb39a4c120163a483b74308436cc191b8854e05e03e48a859d10e413a0d572e85e81e9356148acabc3e8ce07a799e97b2a275df6184a091701de3da89981f4d6d293c3e8d219794bb2ebe757f97ffedbffe21739a8e1871fde95a38e029347c9e3fb9faaa7c7382bb609e2d0bfbf7ff2c36ce1cbe81ab55145f9368d7b6656b16bbbaf11f5c076b0f508e498cbae25e02a90321c9f31f78f8f462b30cbb02c750755501b488a794600c1bab88d31df83aae48b61711260a485e52f7ef31d5215ca177c9ac66b9f4318b90f3664a200250239a3dbb672c71ff51cc5b1068fb843d74b9e65b08300cc2f420b7c1bc7818cbc10800ee90f1a9ba729cb63881a380db0a35b0c5d26e9f1fa7c52b32b5c25381fdb6e0d35ed04be68aa0682284957088e659edba1fcea777fbdbb49cfa76a5ec8e5559aef7607442e64c36aa7ca7e6134cb6260c5976aea319f350b667713df4826674b22d7891666d44c10f244c79820bb0466e968e2aa81baed60f83d06b3b8b8929f10b406a66ba2617a3ad1b2390d32e47e344f4626a9a1f328fc64b5da9747aac86697b3c144292393aac7beddd71ea350927e1e71ab3d0f314c5df314866f845491aec3a9c55b69e17955dbc343076908f78389604286d0ea66715d08e0acdd3aa66b231c27f1aed8c66edf5a6cf3a46504e8082d09b05cc0b4ae58a60de208229dfffa5ffc4f9188cbf3de47d6b89b66bc9f4ce8e1bf5f7aa6c300829e61a191709620df413cce9cc397696806297d828cbad86ee1fb2c9896484c121eda1d64b474b5cae779869058e03490e97a72b5696605510022ecba1ef93718903ab1c6cd0762d3d9d30961e84e415ebeb94e923be1cf9c0457eb68a6ac2b4984b0d22a4ed3f3e170b88767da797c822815eccc598667009c12ed96900316313b523f65cc451534a7653de203c10a5d416109bd4562d2f16e32966e4728d56e81d080cf3f4fee0c2470ce8f8a11dc668cb52560770020d0f25956806b58795063bffffc69192a68b5a19f8efb87cb8b4dd575d0d910eaae0e3df45814545def568d16fba5d64580d45cc04c16746ec33469db21f4fd4b88033c15f4601e13e6ad2f03dd5a78fe619c215781e4d0ef97d797cfefaeea93cad75120c274174368f3ffe9dffc6b29e37c975fdced18cb2e2e33c8304cef6e7713c470fa69beca606e30350938308b6f6f9e8145f17d78d3f56a15f93ccbd79450e9bb82cff96acb25020b731b22d088b659be8d5d91589031e85fa7a15b22d96d7798c834495c1368e98ed3c77e7273b9bbbc7a8610840927142a874dfdf2f2dbefae762b64f36359d56313f3e5d96ef7b0df6ff22df8ebd3fee9f96a95adb6a6edb83fbb7bce13676b9fb87545666568a6c18800b3477caa3bc3b29565331484c51c42aac63ed04a6c62a567364470258b72a7bf8230ba1fc6a6c124aca8e7b93236a98bad4933a2db4dba8664d3443f7d7a9f64db9f7ff953f3f8e433989a08cfde7567835c93003dfde5ca1ff07281ce7715cf23691861da033c8cf3bc4952846b92ac907c8bb4f001898f2751db22c14cbb22a1cc0ffd60d688769d0aafebfb24f2cbb2326e8367103eadf7dd6a93d0fff77ff8771390884c599c5a778adc5938e2741e5fe611f1825484e8ecdd9239ecb0901cd4d839b434c878984624bf500b0605910e3c72cd434164103222f0e7a67757f7840d930c0fcda518ca123f80276b1ac4d8ff18afc06ac0bf53375fbffaea61ffd47593976570214d33dcbd791df8027f73d17498bb3470a152773a894358c0e654ae2d4bb6d162667f6a2d108c72f01ca409e42d9319ec20751691cb582fc741455b6ea0c226b7942a18ec0c0b423c95319da95d5f5b3861383bcad33f7ff8583ab597ce8d68e1cc94aa87f3610a0ec7fa2e170b9bdf6e560ffb8f8c7a7ff7efffbd5503de424e2d62230858371be9d1b66db79bf454d586f075bed1135cae3bd6b25aafa70ee2cc8cd30444c08b6fb3cd10a9a74fe79517746a818c7097cf03c430dfed2e99efae1eee3f7fa430f601bf7fd84f3cd96dbce3b15b496f8982ff3f3fa528a677f115750000000049454e44ae426082, 'AMDIN', '0000-00-00 00:00:00', 'ADMIN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PreguntasFrecuentes`
--

CREATE TABLE `PreguntasFrecuentes` (
  `Id_pregunta` int(11) NOT NULL COMMENT ' Identificador unico pregunta ',
  `Id_pais` int(11) NOT NULL COMMENT ' Identificador unico del Pais ej. EEUU  , Ecuador ',
  `Codigo_idioma` int(11) NOT NULL COMMENT ' Identificador unico del idioma',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de la pregunta ej. 1= activo   0= inactivo ',
  `contenido_Pregunta` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Contenido de la pregunta',
  `respuesta_pregunta` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Respuesta default de la pregunta',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Provincia`
--

CREATE TABLE `Provincia` (
  `Codigo_pais` int(11) NOT NULL COMMENT ' Identificador unico de pais',
  `Codigo_estado` int(11) NOT NULL COMMENT ' Identificador unico de estado',
  `Codigo_provincia` int(11) NOT NULL COMMENT ' Identificador unico de provincia',
  `Nombre_provincia` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre de Provincia',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RatingDoctor`
--

CREATE TABLE `RatingDoctor` (
  `Codigo_rating` int(11) NOT NULL COMMENT ' Identificador unico del rating',
  `Codigo_personaDoctor` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `id_UsuarioDoctor` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Codigo_personaPaciente` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `id_UsuarioPaciente` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Rating` int(11) NOT NULL COMMENT ' Calificación del doctor',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RatingProducto`
--

CREATE TABLE `RatingProducto` (
  `Codigo_rating` int(11) NOT NULL COMMENT ' Identificador unico del rating',
  `Id_medicamento` int(11) NOT NULL COMMENT ' Identificador unico medicamento ',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `id_Usuario` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Rating` int(11) NOT NULL COMMENT ' Calificación del producto',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ReseniaDoctor`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ReseniaProducto`
--

CREATE TABLE `ReseniaProducto` (
  `Codigo_resenia` int(11) NOT NULL COMMENT ' Identificador unico de la reseña',
  `Id_medicamento` int(11) NOT NULL COMMENT ' Identificador unico medicamento ',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico del medico al que va dirigida la reseña',
  `id_Usuario` int(11) NOT NULL COMMENT ' Identificador unico del usuario medico ',
  `Resenia` varchar(50) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Reseña del producto realizada por el usuario',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ServiciosMedico`
--

CREATE TABLE `ServiciosMedico` (
  `id_servicios` int(11) NOT NULL COMMENT ' Identificador unico de la especializacion del medico',
  `Codigo_persona` int(11) NOT NULL COMMENT ' Identificador unico de la persona medico',
  `id_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del usuario medico ',
  `descripcion_servicios` varchar(150) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Descripcion del servicio que presta el medico',
  `id_estado_servicio` int(11) NOT NULL COMMENT 'Estado del mensaje ej. 0= no activo   1= activo  ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Soporte`
--

CREATE TABLE `Soporte` (
  `id` int(11) NOT NULL COMMENT 'Identificador Unico del mensaje ',
  `fecha` datetime NOT NULL COMMENT ' Fecha Mensaje',
  `contenido` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Contenido el mensaje',
  `id_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del usuario ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TerminosCondiciones`
--

CREATE TABLE `TerminosCondiciones` (
  `Id_terminoscondi` int(11) NOT NULL COMMENT ' Identificador unico de los terminos y condiciones ',
  `Id_pais` int(11) NOT NULL COMMENT ' Identificador unico del Pais ej. EEUU  , Ecuador ',
  `Codigo_idioma` int(11) NOT NULL COMMENT ' Identificador unico del idioma',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de los terminos y condiciones ej. 0= activo   2= inactivo ',
  `contenido_TerminosCond` varchar(255) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Contenido de terminos y condiciones',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipoIdentificacion`
--

CREATE TABLE `TipoIdentificacion` (
  `Codigo_tipo_identificacion` int(11) NOT NULL COMMENT ' Identificador unico del tipo',
  `Descripcion_tipo_identificacion` varchar(30) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Descripcion tipo de identicicacion RUC, Cedula, Pasaporte'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `TipoIdentificacion`
--

INSERT INTO `TipoIdentificacion` (`Codigo_tipo_identificacion`, `Descripcion_tipo_identificacion`) VALUES
(1, 'CEDULA ECUATORIANA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TiposDireccion`
--

CREATE TABLE `TiposDireccion` (
  `Tipo_direccion` int(11) NOT NULL,
  `Descripcion_Tipo` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Descripcion del tipo de Direccion',
  `Estado_Tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipoUsuario`
--

CREATE TABLE `TipoUsuario` (
  `Codigo_tipo_Usuario` int(11) NOT NULL COMMENT 'Identificador Unico del tipo usuario ',
  `Descripcion_tipo_usuario` varchar(30) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Descripcion tipo usuario ej. Administrador, usuario medico, usuario doctorWeb, usuario delivery '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `TipoUsuario`
--

INSERT INTO `TipoUsuario` (`Codigo_tipo_Usuario`, `Descripcion_tipo_usuario`) VALUES
(1, 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UbicacionHospital`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UnidadesMedida`
--

CREATE TABLE `UnidadesMedida` (
  `Unidad_medida` int(11) NOT NULL COMMENT ' Identificador unico unidad de medida medicamento ',
  `Descripcion_medida` varchar(150) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Nombre o descripcion de la categoria de medicamentos',
  `id_estado` int(11) NOT NULL COMMENT 'Estado de la pregunta ej. 1= activa   0= inactiva ',
  `Usuario_creacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria',
  `Fecha_ult_modif` datetime NOT NULL COMMENT ' Para registro de Auditoria',
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UsuarioDoctorWeb`
--

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
  `Usuario_ult_modif` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT ' Para registro de Auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `UsuarioDoctorWeb`
--

INSERT INTO `UsuarioDoctorWeb` (`id_Usuario`, `Login_usuario`, `Correo_electronico`, `Numero_celular`, `Clave_usuario`, `Estado_usuario`, `Fecha_caducidad`, `Codigo_persona`, `Codigo_tipo_Usuario`, `Telefono_validado`, `Correo_validado`, `Usuario_creacion`, `Fecha_ult_modif`, `Usuario_ult_modif`) VALUES
(1, 'CTACURI', 'tacurijuanita@hotmail.com', '593978831315', '202cb962ac59075b964b07152d234b70', 1, '0000-00-00 00:00:00', 1, 1, 127, 1, 'ADMIN', '0000-00-00 00:00:00', 'ADMIN');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CalendarioDisponibleMedico`
--
ALTER TABLE `CalendarioDisponibleMedico`
  ADD PRIMARY KEY (`Id_calendariodisp`);

--
-- Indices de la tabla `CategoriasMedicamentos`
--
ALTER TABLE `CategoriasMedicamentos`
  ADD PRIMARY KEY (`Id_categoria`);

--
-- Indices de la tabla `Ciudad`
--
ALTER TABLE `Ciudad`
  ADD PRIMARY KEY (`Codigo_pais`,`Codigo_estado`);

--
-- Indices de la tabla `DetalleCitasMedicas`
--
ALTER TABLE `DetalleCitasMedicas`
  ADD PRIMARY KEY (`Id_cita`);

--
-- Indices de la tabla `DireccionesPersonas`
--
ALTER TABLE `DireccionesPersonas`
  ADD PRIMARY KEY (`Codigo_persona`,`Id_Direccion`);

--
-- Indices de la tabla `Especializaciones`
--
ALTER TABLE `Especializaciones`
  ADD PRIMARY KEY (`id_especializacion`);

--
-- Indices de la tabla `EspecializacionesMedico`
--
ALTER TABLE `EspecializacionesMedico`
  ADD PRIMARY KEY (`Codigo_persona`,`id_especializacion`);

--
-- Indices de la tabla `Estado`
--
ALTER TABLE `Estado`
  ADD PRIMARY KEY (`Codigo_pais`,`Codigo_estado`);

--
-- Indices de la tabla `Hospital`
--
ALTER TABLE `Hospital`
  ADD PRIMARY KEY (`Codigo_hospital`);

--
-- Indices de la tabla `HospitalDisponibilidad`
--
ALTER TABLE `HospitalDisponibilidad`
  ADD PRIMARY KEY (`id_Sec`,`Id_hospital`);

--
-- Indices de la tabla `HospitalesDepartamentos`
--
ALTER TABLE `HospitalesDepartamentos`
  ADD PRIMARY KEY (`Id_hospital`,`Id_depatamento`);

--
-- Indices de la tabla `Idioma`
--
ALTER TABLE `Idioma`
  ADD PRIMARY KEY (`Codigo_idioma`);

--
-- Indices de la tabla `Medicamentos`
--
ALTER TABLE `Medicamentos`
  ADD PRIMARY KEY (`Id_categoria`,`Id_medicamento`);

--
-- Indices de la tabla `MedicoDisponibilidad`
--
ALTER TABLE `MedicoDisponibilidad`
  ADD PRIMARY KEY (`id_Sec`,`id_Usuario`);

--
-- Indices de la tabla `MetodoDePago`
--
ALTER TABLE `MetodoDePago`
  ADD PRIMARY KEY (`Codigo_metodo_de_pago`);

--
-- Indices de la tabla `OrdenCabecera`
--
ALTER TABLE `OrdenCabecera`
  ADD PRIMARY KEY (`Codigo_orden`);

--
-- Indices de la tabla `OrdenDetalle`
--
ALTER TABLE `OrdenDetalle`
  ADD PRIMARY KEY (`Codigo_orden`,`Id_medicamento`);

--
-- Indices de la tabla `Pais`
--
ALTER TABLE `Pais`
  ADD PRIMARY KEY (`Codigo_pais`);

--
-- Indices de la tabla `Parroquia`
--
ALTER TABLE `Parroquia`
  ADD PRIMARY KEY (`Codigo_pais`,`Codigo_estado`);

--
-- Indices de la tabla `PerfilMedico`
--
ALTER TABLE `PerfilMedico`
  ADD PRIMARY KEY (`Codigo_persona`,`id_Usuario`);

--
-- Indices de la tabla `Persona`
--
ALTER TABLE `Persona`
  ADD PRIMARY KEY (`Codigo_persona`);

--
-- Indices de la tabla `PreguntasFrecuentes`
--
ALTER TABLE `PreguntasFrecuentes`
  ADD PRIMARY KEY (`Id_pregunta`);

--
-- Indices de la tabla `Provincia`
--
ALTER TABLE `Provincia`
  ADD PRIMARY KEY (`Codigo_pais`,`Codigo_estado`,`Codigo_provincia`);

--
-- Indices de la tabla `RatingDoctor`
--
ALTER TABLE `RatingDoctor`
  ADD PRIMARY KEY (`Codigo_rating`);

--
-- Indices de la tabla `RatingProducto`
--
ALTER TABLE `RatingProducto`
  ADD PRIMARY KEY (`Codigo_rating`);

--
-- Indices de la tabla `ReseniaDoctor`
--
ALTER TABLE `ReseniaDoctor`
  ADD PRIMARY KEY (`Codigo_resenia`);

--
-- Indices de la tabla `ReseniaProducto`
--
ALTER TABLE `ReseniaProducto`
  ADD PRIMARY KEY (`Codigo_resenia`);

--
-- Indices de la tabla `ServiciosMedico`
--
ALTER TABLE `ServiciosMedico`
  ADD PRIMARY KEY (`Codigo_persona`,`id_servicios`);

--
-- Indices de la tabla `Soporte`
--
ALTER TABLE `Soporte`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `TerminosCondiciones`
--
ALTER TABLE `TerminosCondiciones`
  ADD PRIMARY KEY (`Id_terminoscondi`);

--
-- Indices de la tabla `TipoIdentificacion`
--
ALTER TABLE `TipoIdentificacion`
  ADD PRIMARY KEY (`Codigo_tipo_identificacion`);

--
-- Indices de la tabla `TiposDireccion`
--
ALTER TABLE `TiposDireccion`
  ADD PRIMARY KEY (`Tipo_direccion`);

--
-- Indices de la tabla `TipoUsuario`
--
ALTER TABLE `TipoUsuario`
  ADD PRIMARY KEY (`Codigo_tipo_Usuario`);

--
-- Indices de la tabla `UbicacionHospital`
--
ALTER TABLE `UbicacionHospital`
  ADD PRIMARY KEY (`Codigo_ubicacion_hospital`);

--
-- Indices de la tabla `UnidadesMedida`
--
ALTER TABLE `UnidadesMedida`
  ADD PRIMARY KEY (`Unidad_medida`);

--
-- Indices de la tabla `UsuarioDoctorWeb`
--
ALTER TABLE `UsuarioDoctorWeb`
  ADD PRIMARY KEY (`id_Usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
