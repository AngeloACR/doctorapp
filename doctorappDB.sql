/*Script de creacion de tablas DoctorWEB*/

USE DoctorWEB;

DROP TABLE Hospital;
CREATE TABLE Hospital (
	Codigo_hospital INT COMMENT ' Identificador unico del hospital' NOT NULL,
	Codigo_ubicacion_hospital INT COMMENT ' Identificador unico de la ubicacion del hospital' NOT NULL,
	Nombre VARCHAR(50) COMMENT ' Nombre del hospital'  NOT NULL,
	Especialidad VARCHAR(50) COMMENT ' Especialidad del hospital'  NOT NULL,
	Direccion VARCHAR(100) COMMENT ' Dirección del hospital'  NOT NULL,
	Imagenes VARCHAR(255) COMMENT ' Arreglo con la ubicación de las imagenes en el servidor'  NOT NULL,
	PRIMARY KEY (Codigo_hospital)
);

DROP TABLE Doctor;
CREATE TABLE Doctor (
	Codigo_doctor INT COMMENT ' Identificador unico del doctor' NOT NULL,
	Codigo_agenda INT COMMENT ' Identificador unico de la agenda del doctor' NOT NULL,
	Nombres VARCHAR(30) COMMENT ' Nombres del doctor' COLLATE latin1_spanish_ci NOT NULL,	
	Apellidos VARCHAR(100) COMMENT ' Apellidos de la persona' COLLATE latin1_spanish_ci NOT NULL,
	Codigo_hospital INT COMMENT ' Hospital donde trabaja el doctor' NOT NULL,
	Codigo_especialidad INT COMMENT ' Identificador unico de la especialidad del doctor' NOT NULL,
	Sexo VARCHAR(1) COLLATE latin1_spanish_ci NULL,	
	Perfil VARCHAR(100) COLLATE latin1_spanish_ci COMMENT ' Descripcion de las habilidades del doctor' NOT NULL,
	Experiencia VARCHAR(100) COLLATE latin1_spanish_ci COMMENT ' Tiempo de experiencia del doctor en el campo' NOT NULL,	 	
	Imagenes VARCHAR(255) COMMENT ' Arreglo con la ubicación de las imagenes en el servidor'  NOT NULL,
	Precio INT COMMENT ' Precio de la consulta' NOT NULL,	 	
	PRIMARY KEY (Codigo_doctor)
);

DROP TABLE Especialidad;
CREATE TABLE Especialidad (
	Codigo_especialidad INT COMMENT ' Identificador unico de la especialidad' NOT NULL,
	Nombre VARCHAR(50) COMMENT ' Nombre de la especialidad' COLLATE latin1_spanish_ci NOT NULL,
	Descripcion VARCHAR(100) COMMENT ' Descripcion de la especialidad' COLLATE latin1_spanish_ci NOT NULL,
	PRIMARY KEY (Codigo_especialidad)
);

DROP TABLE Agenda;
CREATE TABLE Agenda (
	Codigo_agenda INT COMMENT ' Identificador unico de la agenda' NOT NULL,
	Codigo_doctor INT COMMENT ' Identificador unico del doctor' NOT NULL,
	Horario_de_trabajo VARCHAR(100) COMMENT 'Horarios de disponibilidad del doctor',
	PRIMARY KEY (Codigo_agenda)
);

DROP TABLE DiaDisponible;
CREATE TABLE DiaDisponible (
	Codigo_dia_disponible INT COMMENT ' Identificador unico del dia disponible' NOT NULL,
	Codigo_agenda INT COMMENT ' Identificador unico de la agenda' NOT NULL,
	Fecha DATETIME COMMENT 'Fecha del dia disponible'  NOT NULL,
	PRIMARY KEY (Codigo_dia_disponible)
);

DROP TABLE HoraDisponible;
CREATE TABLE HoraDisponible (
	Codigo_hora_disponible INT COMMENT ' Identificador unico de la hora disponible' NOT NULL,
	Codigo_dia_disponible INT COMMENT ' Identificador unico del dia disponible' NOT NULL,
	Codigo_agenda INT COMMENT ' Identificador unico de la agenda' NOT NULL,
	Hora VARCHAR(255) COMMENT 'Hora disponible para la consulta',
	Estado VARCHAR(255) COMMENT 'Indicador de si la hora esta disponible o reservada',
	PRIMARY KEY (Codigo_hora_disponible)

);

DROP TABLE Reserva;
CREATE TABLE Reserva (
	Codigo_reserva INT COMMENT 'Identificador unico de la reserva' NOT NULL,
	Codigo_agenda INT COMMENT ' Identificador unico de la agenda del doctor' NOT NULL,
	Codigo_dia_disponible INT COMMENT 'Identificador unico del dia reservado' NOT NULL,
	Codigo_hora_disponible INT COMMENT 'Identificador unico de la hora reservada' NOT NULL,
	Codigo_usuario INT COMMENT ' Identificador unico del usuario' NOT NULL,
	PRIMARY KEY (Codigo_reserva)
);

DROP TABLE RatingDoctor;
CREATE TABLE RatingDoctor (
	Codigo_rating INT COMMENT ' Identificador unico del rating' NOT NULL,
	Codigo_doctor INT COMMENT ' Identificador unico del doctor' NOT NULL,
	Rating INT COMMENT ' Calificación del doctor' NOT NULL,
	PRIMARY KEY (Codigo_rating)
);

DROP TABLE ReseñaDoctor;
CREATE TABLE ReseñaDoctor (
	Codigo_reseña INT COMMENT ' Identificador unico de la reseña' NOT NULL,
	Codigo_doctor INT COMMENT ' Identificador unico del doctor al que va dirigida la reseña' NOT NULL,
	Codigo_usuario INT COMMENT ' Identificador unico del usuario que hace la reseña' NOT NULL,
	Reseña VARCHAR(50) COMMENT ' Reseña del doctor realizada por el usuario' NOT NULL,
	PRIMARY KEY (Codigo_reseña)
);

/* PREGUNTAR COMO SE MANEJAN ARREGLOS EN LAS TABLAS*/
DROP TABLE Carrito;
CREATE TABLE Carrito (
	Codigo_carrito INT COMMENT ' Identificador unico del carrito' NOT NULL,
	Codigo_usuario INT COMMENT ' Identificador unico del usuario' NOT NULL,
	Codigo_producto INT COMMENT ' Identificador unico del producto en el carrito',
	Cantidad INT COMMENT 'Cantidad del producto en el carrito',
	Subtotal INT COMMENT 'Subtotal a pagar por la cantidad de productos solicitados',
	/* Total INT COMMENT 'Total a pagar por todos productos solicitados', */
	PRIMARY KEY (Codigo_carrito)
);

DROP TABLE UbicacionHospital;
CREATE TABLE UbicacionHospital (
	Codigo_ubicacion_hospital INT COMMENT 'Identificador Unico de la ubicacion del hospital '  NOT NULL,
	Latitud VARCHAR(255) COMMENT 'Latitud de la ubicacion del hospital',
	Longitud VARCHAR(255) COMMENT 'Longitud de la ubicacion del hospital',
	Direccion VARCHAR(255) COMMENT 'Ubicacion en letras del hospital',
	PRIMARY KEY (Codigo_ubicacion_hospital)
);

DROP TABLE Orden;
CREATE TABLE Orden (
	Codigo_orden INT COMMENT ' Identificador unico de la orden' NOT NULL,
	Codigo_carrito INT COMMENT ' Identificador unico del carrito' NOT NULL,
	Fecha DATETIME COMMENT 'Fecha en que fue pedida la orden'  NOT NULL,
	Codigo_metodo_de_pago INT COMMENT 'Identificador del metodo de pago',
	Estado INT COMMENT 'Indicador del estado de la orden, si en proceso, entregada o rechazada',
	PRIMARY KEY (Codigo_orden)
);

DROP TABLE MetodoDePago;
CREATE TABLE MetodoDePago (
	Codigo_metodo_de_pago INT 'Identificador unico del metodo de pago' NOT NULL,
	Metodo VARCHAR(100) 'Descripcion del metodo de pago, si efectivo, paypal, tarjeta de credito, debito, transferencia bancaria o cualquier otro metodo de pago definido',
	PRIMARY KEY (Codigo_metodo_de_pago)
);

DROP TABLE Categoria;
CREATE TABLE Categoria (
	Codigo_categoria INT COMMENT ' Identificador unico de la categoria del producto' NOT NULL,
	Nombre VARCHAR(50) COMMENT ' Nombre de la categoria'  NOT NULL,
	PRIMARY KEY (Codigo_categoria)
);

DROP TABLE Producto;
CREATE TABLE Producto (
	Codigo_producto INT COMMENT ' Identificador unico del producto' NOT NULL,
	Codigo_categoria INT COMMENT ' Identificador unico de la categoria del producto' NOT NULL,
	Nombre VARCHAR(50) COMMENT ' Nombre del producto'  NOT NULL,
	Descripcion VARCHAR(100) COMMENT ' Descripcion del producto'  NOT NULL,
	Precio INT COMMENT ' Precio del producto'  NOT NULL,
	Imagenes VARCHAR(255) COMMENT ' Arreglo con la ubicación de las imagenes en el servidor'  NOT NULL,
	PRIMARY KEY (Codigo_producto)
);

DROP TABLE ReseñaProducto;
CREATE TABLE ReseñaProducto (
	Codigo_reseña INT COMMENT ' Identificador unico de la reseña' NOT NULL,
	Codigo_producto INT COMMENT ' Identificador unico del producto al que va dirigida la reseña' NOT NULL,
	Codigo_usuario INT COMMENT ' Identificador unico del usuario que hace la reseña' NOT NULL,
	Reseña VARCHAR(50) COMMENT ' Reseña del producto realizada por el usuario' NOT NULL,
	PRIMARY KEY (Codigo_reseña)
);

DROP TABLE RatingProducto;
CREATE TABLE RatingProducto (
	Codigo_rating INT COMMENT ' Identificador unico del rating' NOT NULL,
	Codigo_producto INT COMMENT ' Identificador unico del producto' NOT NULL,
	Rating INT COMMENT ' Calificación del producto' NOT NULL,
	PRIMARY KEY (Codigo_rating)
);

DROP TABLE UsuarioDoctorWeb;
CREATE TABLE UsuarioDoctorWeb (
	id_Usuario INT COMMENT 'Identificador Unico del usuario '   NOT NULL,
	Login_usuario VARCHAR(30) COLLATE latin1_spanish_ci COMMENT 'Nombre del usuario '  NOT NULL,	
	Correo_electronico VARCHAR(250) COLLATE latin1_spanish_ci COMMENT 'Correo electronico '  NOT NULL,
	Numero_celular VARCHAR(50) COLLATE latin1_spanish_ci COMMENT 'Numero del celular '  NOT NULL,
	Clave_usuario VARCHAR(255) COLLATE latin1_spanish_ci COMMENT 'Clave del Usuario encriptada '  NOT NULL,
	Estado_usuario INT COMMENT 'Senala si el usuario esta activo o inactivo ej. 0= Inactivo , 1= Activo' NOT NULL,
	Fecha_caducidad DATETIME COMMENT 'Fecha hasta la cual es vigente el usuario, pasada la fecha se inactiva '  NOT NULL,
	Codigo_persona  INT COMMENT 'Identificador unico del codigo del persona '  NOT NULL, 
	Codigo_tipo_Usuario INT COMMENT 'Para el codigo del tipo de usuario ej. . Administrador, usuario medico, usuario doctorWeb, usuario delivery '  NOT NULL, 
	Usuario_creacion VARCHAR(100) COLLATE latin1_spanish_ci COMMENT ' Para registro de Auditoria' NOT NULL,
	Fecha_ult_modif DATETIME NOT NULL,
	Usuario_ult_modif VARCHAR(100) COLLATE latin1_spanish_ci COMMENT ' Para registro de Auditoria' NOT NULL,	
	/* Imagenes VARCHAR(255) COLLATE latin1_spanish_ci COMMENT ' Arreglo con la ubicacion de las imagenes en el servidor' NOT NULL, */	
	/* Telefono_validado VARCHAR(100) COLLATE latin1_spanish_ci COMMENT ' Indicador para saber si el telefono esta verificado' NOT NULL, */	
	/* Correo_validado VARCHAR(100) COLLATE latin1_spanish_ci COMMENT ' Indicador para saber si el correo esta verificado' NOT NULL, */	

	PRIMARY KEY (id_Usuario)
);