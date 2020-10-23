const express = require('express');
const almacenRouter = express.Router();
const auth = require("../../users/auth/auth");
const Almacen = require('../models/almacen');
const almacenHandler = require('../controllers/main').almacenHandler;

almacenRouter.post('/', /*auth,*/ async (req, res) => {
	try {
		const almacen = {
			state: req.body.state,
			code: req.body.code,
			city: req.body.city,
			address: req.body.address,
		};
		let newAlmacen = new Almacen(almacen);
		let response = await Almacen.addAlmacen(newAlmacen);

		//let response = await almacenHandler.addAlmacen(almacen);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


almacenRouter.get('/all', /*auth,*/ async (req, res) => {
	try {
		let response = await Almacen.getAlmacenes();
		//let response = await almacenHandler.getAlmacenes();
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


almacenRouter.get('/:almacenId', /*auth,*/ async (req, res) => {
	try {
		const almacenId = req.params.almacenId;
		let response = await Almacen.getAlmacen(almacenId);
		//let response = await almacenHandler.getAlmaceneById(almacenId);

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Delete user
almacenRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await Almacen.deleteAlmacen(item);
		//let response = await almacenHandler.deleteAlmacen(item);

		console.log(response);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
almacenRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;
		const id = req.body._id
		let response = await Almacen.updateAlmacen(id, updateData);
		//let response = await almacenHandler.updateAlmacen();
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = almacenRouter;
