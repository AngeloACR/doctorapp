const bcrypt = require('bcryptjs');
const environment = require('../../config/environment');
const crypto = require('crypto');
const db = require('../../database');
const mysql = require('mysql');
const jwt = require('jsonwebtoken');

module.exports.addPersona = async function (newPersona) {
    try {
        let query = 'SELECT * FROM ?? WHERE ?? = ?';
        let queryData = ['Persona', 'Identificacion_persona', newPersona.identificacion];
        let results = await this.queryDb(query, queryData);
        if (!results != 0) {
            throw new Error('Identificacion en uso');
        } else {
            query = 'INSERT INTO ?? (??, ??) VALUES (?, ?)';
            queryData = ['Persona',
                'Nombres',
                'Apellidos',
                'Codigo_tipo_identificacion',
                'Identificacion_persona',
                'Sexo',
                'Estado_persona',
                'Foto_persona',
                'Codigo_usuario',
                newPersona.nombres,
                newPersona.apellidos,
                newPersona.tipo,
                newPersona.identificacion,
                newPersona.sexo,
                newPersona.status,
                newPersona.foto,
                newPersona.codigoUSUARIO,

            ];
            results = await this.queryDb(query, queryData);
            let response = {
                status: true,
                values: results
            }
            return response;
        }
    } catch (error) {
        throw error;
    }
};
module.exports.deletePersona = async function (codigo) {
    try {
        console.log('starting deletion')
        let query = 'DELETE FROM ?? WHERE ?? = ?';
        queryData = ['Persona', 'Codigo_persona', codigo];
        let results = await this.queryDb(query, queryData);
        if (!results) {
            throw new Error("Persona doesn't exist")
        }
        let response = {
            status: true,
            values: results
        }
        return response;
    } catch (error) {
        throw error;
    }
};
module.exports.updatePersona = async function (persona) {
    try {
        let query = 'UPDATE ?? SET ?? = ?, ?? = ?, ?? = ?, ?? = ?, ?? = ?, ?? = ?, ?? = ? WHERE ?? = ?';
        queryData = ['Persona',
            'Nombres',
            persona.nombresNew,
            'Apellidos',
            persona.apellidosNew,
            'Codigo_tipo_identificacion',
            persona.tipoNew,
            'Identificacion_persona',
            persona.identificacionNew,
            'Sexo',
            persona.sexoNew,
            'Estado_persona',
            persona.statusNew,
            'Foto_persona',
            persona.fotoNew,
            'Codigo_persona',
            persona.codigo

        ];

        let results = await this.queryDb(query, queryData);
        if (!results) {
            throw new Error("Personaname doesn't exist")
        }
        let response = {
            status: true,
            values: results
        }
        return response;
    } catch (error) {
        throw error;
    }
};
module.exports.getPersona = async function (id) { //Need tons of work
    try {
        let query = 'SELECT * FROM ?? WHERE ?? = ?';
        let queryData = ['Persona', 'Codigo_persona', id];
        let results = await this.queryDb(query, queryData);
        if (!results[0]) {
            throw new Error("Personaname doesn't exist")
        }
        let persona = {

            nombres: results[0].Nombres,
            apellidos: results[0].Apellidos,
            tipoIdentificacion: results[0].Codigo_tipo_identificacion,
            identificacion: results[0].Identificacion_persona,
            sexo: results[0].Sexo,
            status: results[0].Estado_persona,
            foto: results[0].Foto_persona,
            codigo: results[0].Codigo_persona,
        }
        let response = {
            status: true,
            values: persona
        }
        return response;
    } catch (error) {
        throw error;
    }
};

module.exports.getPersonaByUser = async function (id) { //Need tons of work
    try {
        let query = 'SELECT * FROM ?? WHERE ?? = ?';
        let queryData = ['Persona', 'Codigo_usuario', id];
        let results = await this.queryDb(query, queryData);
        if (!results[0]) {
            throw new Error("Personaname doesn't exist")
        }
        let persona = {

            nombres: results[0].Nombres,
            apellidos: results[0].Apellidos,
            tipoIdentificacion: results[0].Codigo_tipo_identificacion,
            identificacion: results[0].Identificacion_persona,
            sexo: results[0].Sexo,
            status: results[0].Estado_persona,
            foto: results[0].Foto_persona,
            codigo: results[0].Codigo_persona,
        }
        let response = {
            status: true,
            values: persona
        }
        return response;
    } catch (error) {
        throw error;
    }
};
module.exports.getPersonas = async function () { //Need tons of work
    try {
        let query = 'SELECT * FROM ??';
        let queryData = ['Persona'];
        let results = await this.queryDb(query, queryData);
        if (!results) {
            throw new Error("Personaname doesn't exist")
        }
        var uMap = [{}];
        var i = 0;
        results.forEach(function (result) {
            uMap[i] = {

                nombres: results.Nombres,
                apellidos: results.Apellidos,
                tipoIdentificacion: results.Codigo_tipo_identificacion,
                identificacion: results.Identificacion_persona,
                sexo: results.Sexo,
                status: results.Estado_persona,
                foto: results.Foto_persona,
                codigo: results.Codigo_persona,
            };
            i++;
        });
        let response = {
            status: true,
            values: uMap
        }
        return response;
    } catch (error) {
        throw error;
    }
};

module.exports.queryDb = async function (query, data) {
    try {
        let myDB = db.init();
        let formatedQuery = mysql.format(query, data);
        let results = await myDB.query(formatedQuery);

        return results;
    } catch (e) {
        throw e
    }
};

const Persona = module.exports
