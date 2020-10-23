const express = require('express');
const clienteRouter = express.Router();
const auth = require("../../users/auth/auth");
const Cliente = require('../models/cliente');
const clienteHandler = require('../controllers/main').clienteHandler;

clienteRouter.post('/', /*auth,*/ async (req, res) => {
	try {
		const cliente = {
			name: req.body.name,
			address: req.body.address,
			ws: req.body.ws,
			ig: req.body.ig,
			mail: req.body.mail,
			rif: req.body.rif,
		};

		response = await clienteHandler.addCliente(cliente);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


clienteRouter.get('/all', /*auth,*/ async (req, res) => {
	try {
		let response = await clienteHandler.getClientes();
		/* if (response.values && response.values.length) {
		} else {
			throw new Error('There are no clientes')
		} */
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


clienteRouter.get('/:clienteId', /*auth,*/ async (req, res) => {
	try {
		const clienteId = req.params.clienteId;
		const cliente = await clienteHandler.getCliente(clienteId);
		const msg = ` ${req.originalUrl} `;
		sendOk(msg, res, cliente)
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Delete user
clienteRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await clienteHandler.deleteCliente(item);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
clienteRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;
		const id = req.body.id;

		let response = await clienteHandler.updateCliente(id, updateData);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = clienteRouter;