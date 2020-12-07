const bcrypt = require('bcryptjs');
const environment = require('../../config/environment');
const crypto = require('crypto');
const db = require('../../database');
const mysql = require('mysql');
const jwt = require('jsonwebtoken');
module.exports.tables = {
    TipoUsuario: {
        id: 'Codigo_tipo_Usuario',
        descripcion: 'Descripcion_tipo_usuario',
    }
}
module.exports.addRol = async function (newRol) {
    try {
        let query = 'SELECT * FROM ?? WHERE ?? = ?';
        let queryData = ['TipoUsuario', 'Codigo_tipo_Usuario', newRol.codigo];
        let results = await this.queryDb(query, queryData);
        if (!results != 0) {
            throw new Error('Codigo en uso');
        } else {
            query = 'INSERT INTO ?? (??, ??) VALUES (?, ?)';
            queryData = ['TipoUsuario', 'Codigo_tipo_Usuario', 'Descripcion_tipo_usuario', newRol.codigo, newRol.nombre];
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
module.exports.deleteRol = async function (codigo) {
    try {
        console.log('starting deletion')
        let query = 'DELETE FROM ?? WHERE ?? = ?';
        queryData = ['TipoUsuario', 'Codigo_tipo_Usuario', codigo];
        let results = await this.queryDb(query, queryData);
        if (!results) {
            throw new Error("Rol doesn't exist")
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
module.exports.updateRol = async function (rol) {
    try {
        let query = 'UPDATE ?? SET ?? = ? WHERE ?? = ?';
        queryData = ['TipoUsuario', 'Descripcion_tipo_usuario', rol.nombre, 'Codigo_tipo_Usuario', rol.codigo];
        let results = await this.queryDb(query, queryData);
        if (!results) {
            throw new Error("Rolname doesn't exist")
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
module.exports.getRol = async function (id) { //Need tons of work
    try {
        let query = 'SELECT * FROM ?? WHERE ?? = ?';
        let queryData = ['TipoUsuario', 'Codigo_tipo_Usuario', id];
        let results = await this.queryDb(query, queryData);
        if (!results[0]) {
            throw new Error("Rolname doesn't exist")
        }
        let rol = {
            codigo: results[0].Codigo_tipo_Usuario,
            usuario: results[0].Descripcion_tipo_usuario,
        }
        let response = {
            status: true,
            values: rol
        }
        return response;
    } catch (error) {
        throw error;
    }
};
module.exports.getRols = async function () { //Need tons of work
    try {
        let query = 'SELECT * FROM ??';
        let queryData = ['TipoUsuario'];
        let results = await this.queryDb(query, queryData);
        if (!results) {
            throw new Error("Rolname doesn't exist")
        }
        var uMap = [{}];
        var i = 0;
        results.forEach(function (result) {
            uMap[i] = {
                codigo: result.Codigo_tipo_Usuario,
                usuario: result.Descripcion_tipo_usuario,
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

const Rol = module.exports
