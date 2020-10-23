const express = require('express');
const precioRouter = express.Router();
const auth = require("../../users/auth/auth");
const Precio = require('../models/precio');
const precioHandler = require('../controllers/main').precioHandler;

precioRouter.post('/', auth, async (req, res) => {
	try {
		const precio = {
			producto: req.body.producto,
			valor: req.body.valor
		};
		let response = await precioHandler.addPrecio(precio);

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


precioRouter.get('/all', auth, async (req, res) => {
	try {
		let response = await precioHandler.getPrecios();

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


precioRouter.get('/:precioId', auth, async (req, res) => {
	try {
		const precioId = req.params.precioId;
		let response = await precioHandler.getPrecioById(precioId);

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Delete user
precioRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await precioHandler.deletePrecio(item);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
precioRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;
		const id = req.body._id;

		let response = await precioHandler.updatePrecio(id, updateData);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = precioRouter;
