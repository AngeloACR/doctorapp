#!/bin/bash

mkdir medicos
mkdir general
mkdir usuario
mkdir delivery
mkdir tienda

cd medicos
    mkdir controller
    mkdir model
    mkdir routes

    cd controller
        touch index.js
        touch main.js
        touch citas.js
        touch hospitales.js
        touch doctores.js
        touch especializaciones.js
        touch medicamentos.js
        touch ubicaciones.js

        cd ../model
        touch index.js
        touch cita.js
        touch hospital.js
        touch doctor.js
        touch especializacion.js
        touch medicamento.js
        touch ubicacion.js

        cd ../routes
        touch index.js
        touch citas.js
        touch hospitales.js
        touch doctores.js
        touch especializaciones.js
        touch medicamentos.js
        touch ubicaciones.js

cd ../../general
    mkdir controller
    mkdir model
    mkdir routes

    cd controller
        touch index.js
        touch main.js
        touch faqs.js
        touch ubicaciones.js
        touch asistencias.js
        touch terminosycondiciones.js
        touch empresas.js

        cd ../model
        touch index.js

        touch faq.js
        touch ubicacion.js
        touch asistencias.js
        touch terminosycondiciones.js
        touch empresa.js

        cd ../routes
        touch index.js
        touch faqs.js
        touch ubicaciones.js
        touch asistencias.js
        touch terminosycondiciones.js
        touch empresas.js

cd ../../usuario
    mkdir controller
    mkdir model
    mkdir routes

    cd controller
        touch index.js
        touch main.js
        touch auth.js
        touch personas.js
        touch ubicaciones.js
        touch roles.js

        cd ../model
        touch index.js
        touch persona.js
        touch ubicacion.js
        touch rol.js
        
        cd ../routes
        touch index.js
        touch auth.js
        touch personas.js
        touch ubicaciones.js
        touch roles.js

cd ../../delivery
    mkdir controller
    mkdir model
    mkdir routes

    cd controller
        touch index.js
        touch main.js
        touch trackers.js
        touch conductores.js
        touch carteras.js
        touch ubicaciones.js
        touch carreras.js

        cd ../model
        touch index.js
        touch trackers.js
        touch conductor.js
        touch cartera.js
        touch ubicacion.js
        touch carrera.js
        
        cd ../routes
        touch index.js
        touch trackers.js
        touch conductores.js
        touch carteras.js
        touch carreras.js
        touch ubicaciones.js

cd ../../tienda
    mkdir controller
    mkdir model
    mkdir routes

    cd controller
        touch index.js
        touch main.js
        touch carritos.js
        touch tdcs.js
        touch ordenes.js
        touch pagos.js
        touch ubicaciones.js


        cd ../model
        touch index.js
        touch carritos.js
        touch tdcs.js
        touch ordenes.js
        touch pagos.js
        touch ubicacion.js
        
        cd ../routes
        touch index.js
        touch carritos.js
        touch tdcs.js
        touch ordenes.js
        touch pagos.js
        touch ubicaciones.js
