const express = require('express');
const bancoRouter = express.Router();
const auth = require("../../users/auth/auth");
const Banco = require('../models/banco');
const bancoHandler = require('../controllers/main').bancoHandler;

bancoRouter.post('/', auth, async (req, res) => {
	try {
		const banco = {
			bank: req.body.bank,
			status: req.body.status,
			alias: req.body.alias,
			accountNumber: req.body.accountNumber,
			saldoInicial: 0,
		};
		let response = await bancoHandler.addBanco(banco);
		console.log(response);

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


bancoRouter.get('/all', auth, async (req, res) => {
	try {
		let response = await bancoHandler.getBancos();
		/* if (response.values && response.values.length) {
		} else {
			throw new Error('There are no bancos')
		} */
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


bancoRouter.get('/:bancoId', auth, async (req, res) => {
	try {
		const bancoId = req.params.bancoId;
		const response = await bancoHandler.getBancoById(bancoId);

		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Delete user
bancoRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await bancoHandler.deleteBanco(item);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
bancoRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;
		let bancoId = req.body._id

		let response = await bancoHandler.updateBanco(updateData, bancoId);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = bancoRouter;
