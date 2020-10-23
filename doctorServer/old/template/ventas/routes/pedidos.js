const express = require('express');
const pedidoRouter = express.Router();
const auth = require("../../users/auth/auth");
const Pedido = require('../models/pedido');
const pedidoHandler = require('../controllers/main').pedidoHandler;

pedidoRouter.post('/', auth, async (req, res) => {
	try {
		const pedido = {
			cliente: req.body.cliente,
			productosPedidos: req.body.productosPedidos,
			vendedor: req.body.vendedor,
			fecha: req.body.fecha,
			estado: req.body.estado,
			montoTotal: req.body.montoTotal,
			condicionVenta: req.body.condicionVenta,
			observaciones: req.body.observaciones,
		};
		let response = await pedidoHandler.addPedido(pedido);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


pedidoRouter.get('/all', auth, async (req, res) => {
	try {
		let response = await pedidoHandler.getPedidos();
		/* if (response.values && response.values.length) {
		} else {
			throw new Error('There are no pedidos')
		} */
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


pedidoRouter.get('/:pedidoId', auth, async (req, res) => {
	try {
		const pedidoId = req.params.pedidoId;
		let response = await pedidoHandler.getPedido(pedidoId);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Delete user
pedidoRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await pedidoHandler.deletePedido(item);
		console.log(response);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
pedidoRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;
		const id = req.body._id;

		let response = await pedidoHandler.updatePedido(id, updateData);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = pedidoRouter;
