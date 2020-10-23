const express = require('express');
const compraRouter = express.Router();
const auth = require("../../users/auth/auth");
const Compra = require('../models/compra');
const compraHandler = require('../controllers/main').compraHandler;

compraRouter.post('/', auth, async (req, res) => {
	try {
		const compra = {
			proveedor: req.body.proveedor,
			almacen: req.body.almacen,
			productosIngresados: req.body.productosIngresados,
			fecha: req.body.fecha,
			estado: req.body.estado,
			referencia: req.body.referencia,
			observaciones: req.body.observaciones,
			proveedor: req.body.proveedor,
		};
		response = await compraHandler.addCompra(compra);

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


compraRouter.get('/all', auth, async (req, res) => {
	try {
		let response = await compraHandler.getCompras();
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


compraRouter.get('/:compraId', auth, async (req, res) => {
	try {
		const compraId = req.params.compraId;
		let response = await compraHandler.getCompra(compraId);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Delete user
compraRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await compraHandler.deleteCompra(item);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
compraRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;
		const id = req.body._id;

		let response = await compraHandler.updateCompra(id, updateData);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = compraRouter;
