const express = require('express');
const proveedorRouter = express.Router();
const auth = require("../../users/auth/auth");
const Proveedor = require('../models/proveedor');
const proveedorHandler = require('../controllers/main').proveedorHandler;

proveedorRouter.post('/', /*auth,*/ async (req, res) => {
	try {
		const proveedor = {
			name: req.body.name,
			address: req.body.address,
			ws: req.body.ws,
			ig: req.body.ig,
			mail: req.body.mail,
			rif: req.body.rif,
		};
		response = await proveedorHandler.addProveedor(proveedor);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


proveedorRouter.get('/all', /*auth,*/ async (req, res) => {
	try {
		let response = await proveedorHandler.getProveedores();
		/* if (response.values && response.values.length) {
		} else {
			throw new Error('There are no proveedors')
		} */
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


proveedorRouter.get('/:proveedorId', /*auth,*/ async (req, res) => {
	try {
		const proveedorId = req.params.proveedorId;
		const response = await proveedorHandler.getProveedor(proveedorId);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Delete user
proveedorRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await proveedorHandler.deleteProveedor(item);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
proveedorRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;
		const id = req.body.id;

		let response = await proveedorHandler.updateProveedor(id, updateData);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = proveedorRouter;