const express = require('express');
const productoRouter = express.Router();
const auth = require("../../users/auth/auth");
const Producto = require('../models/producto');
const productoHandler = require('../controllers/main').productoHandler;

productoRouter.post('/', auth, async (req, res) => {
	try {
		const producto = {
			name: req.body.name,
			code: req.body.code,
			brand: req.body.brand,
			description: req.body.description,
			qtyTotal: 0,
		};
		let newProducto = new Producto(producto);
		response = await Producto.addProducto(newProducto);
		//let response = await productoHandler.addProducto(producto);

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


productoRouter.get('/all', auth, async (req, res) => {
	try {
		let response = await Producto.getProductos();
		//let response = await productoHandler.getProductos();

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


productoRouter.get('/:productoId', auth, async (req, res) => {
	try {
		const productoId = req.params.productoId;
		let response = await Producto.getProducto(productoId);
		//let response = await productoHandler.getProductoById(productoId);

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Delete user
productoRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await Producto.deleteProducto(item);
		//let response = await productoHandler.deleteProducto(item);

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
productoRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;
		const id = req.body._id;

		let response = await Producto.updateProducto(id, updateData);
		//let response = await productoHandler.updateProducto(id, updateData);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = productoRouter;
