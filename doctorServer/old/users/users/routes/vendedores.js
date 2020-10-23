const express = require('express');
const vendedorRouter = express.Router();
const auth = require("../auth/auth");
const User = require('../models/user');
const Vendedor = require('../models/vendedor');

vendedorRouter.post('/', /*auth,*/ async (req, res) => {
	try {
		const user = {
			username: req.body.username,
			name: req.body.name,
			mail: req.body.mail,
			password: req.body.password,
			type: req.body.type,
		};
		let newUser = new User(user)
		let response = await User.addUser(newUser);
		if (response.status) {
			const vendedor = {
				userId: response.values._id,
			};
			let newVendedor = new Vendedor(vendedor);
			response = await Vendedor.addVendedor(newVendedor);
		}
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


vendedorRouter.get('/all', /*auth,*/ async (req, res) => {
	try {
		let response = await Vendedor.getVendedores();
		/* if (response.values && response.values.length) {
		} else {
			throw new Error('There are no vendedores')
		} */
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


vendedorRouter.get('/:vendedorId', /*auth,*/ async (req, res) => {
	try {
		const vendedorId = req.params.vendedorId;
		const vendedor = await Vendedor.getVendedor(vendedorId);
		const msg = ` ${req.originalUrl} `;
		sendOk(msg, res, vendedor)
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Delete user
vendedorRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await Vendedor.deleteVendedor(item);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
vendedorRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;

		let response = await Vendedor.updateVendedor(updateData);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = vendedorRouter;