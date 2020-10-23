const express = require('express');
const correlativoRouter = express.Router();
const auth = require("../../users/auth/auth");
const Correlativo = require('../models/correlativo');

//**************************** USER CRUD************************************//
correlativoRouter.post('/', async (req, res) => {
	try {

		const correlativo = {
			name: req.body.name,
			mail: req.body.mail,
			address: req.body.address,
			tlf: req.body.tlf,
		};

		let newCorrelativo = await Correlativo.addCorrelativo(correlativo);
		res.status(200).json(newCorrelativo);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


// Delete correlativo
correlativoRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await Correlativo.deleteCorrelativo(item);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update correlativo, NEED TO IMPROVE
correlativoRouter.put('/', auth, async (req, res, next) => {
	try {
		const correlativo = req.correlativo;
		const updateData = req.body.updateData;

		let response = await Correlativo.updateCorrelativo(updateData);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

// Get Correlativo
correlativoRouter.get('/', auth, async (req, res, next) => {
	try {
		let response = await Correlativo.getCorrelativo();
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}

});


module.exports = correlativoRouter;