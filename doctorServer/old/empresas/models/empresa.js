const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const environment = require('../../config/environment');
const crypto = require('crypto');
const db = require('../../database');
const mysql = require('mysql');
const jwt = require('jsonwebtoken');


module.exports.addEmpresa = async function (newEmpresa) {
	try {
		let query = 'SELECT * FROM ?? WHERE ?? = ?';
		let queryData = ['empresas', 'rif', newEmpresa.rif];
		let results = await this.queryDb(query, queryData);
		if (results.length != 0) {
			throw new Error('Empresa already in use');
		} else {
			query = 'INSERT INTO ?? (??, ??, ??, ??, ??) VALUES (?, ?, ?, ?, ?)';
			queryData = ['empresas', 'codigo', 'nombre', 'rif', 'abreviatura', 'ctasBancarias', newEmpresa.codigo, newEmpresa.nombre, newEmpresa.rif, newEmpresa.abreviatura, newEmpresa.ctasBancarias];
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

module.exports.deleteEmpresa = async function (codigo) {
	try {
		let query = 'DELETE FROM ?? WHERE ??=?';
		queryData = ['empresas', 'codigo', codigo];
		let results = await this.queryDb(query, queryData);
		if (!results) {
			throw new Error("Empresa doesn't exist")
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
module.exports.updateEmpresa = async function (empresa) {
	try {
		let query = 'UPDATE ?? SET ?? = ?, ?? = ? WHERE ?? = ?';
		queryData = ['empresas', 'nombre', empresa.nombre, 'rif', empresa.rif, 'codigo', empresa.codigo, 'abreviatura', empresa.abreviatura, 'ctasBancarias', empresa.ctasBancarias, 'id', empresa.id];
		query = this.formatQuery(query, queryData);
		let results = await this.queryDb(query);
		if (!results) {
			throw new Error("Username doesn't exist")
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
module.exports.getEmpresa = async function (id) { //Need tons of work
	try {
		let query = 'SELECT * FROM ?? WHERE ?? = ?';
		let queryData = ['empresas', 'id', id];
		let results = await this.queryDb(query, queryData);
		if (!results[0]) {
			throw new Error("Empresa doesn't exist")
		}
		let empresa = {
			id: results[0].id,
			codigo: results[0].codigo,
			abreviatura: results[0].abreviatura,
			nombre: results[0].nombre,
			rif: results[0].rif,
			ctasBancarias: results[0].ctasBancarias
		};
		i++;
		let response = {
			status: true,
			values: empresa
		}
		return response;
		return empresa;
	} catch (error) {
		throw error;
	}
};

module.exports.getEmpresas = async function () { //Need tons of work
	try {
		let query = 'SELECT * FROM ??';
		let queryData = ['empresas'];
		let results = await this.queryDb(query, queryData);
		if (!results) {
			throw new Error("Empresa doesn't exist")
		}
		var eMap = [{}];
		var i = 0;
		results.forEach(function (result) {
			eMap[i] = {
				id: result.id,
				codigo: result.codigo,
				abreviatura: result.abreviatura,
				nombre: result.nombre,
				rif: result.rif,
				ctasBancarias: result.ctasBancarias
			};
			i++;
		});
		let response = {
			status: true,
			values: eMap
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

const Empresa = module.exports
