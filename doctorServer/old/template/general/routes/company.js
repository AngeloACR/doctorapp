const express = require('express');
const companyRouter = express.Router();
const auth = require("../../users/auth/auth");
const Company = require('../models/company');

//**************************** USER CRUD************************************//
companyRouter.post('/', async (req, res) => {
	try {

		const company = {
			name: req.body.name,
			mail: req.body.mail,
			address: req.body.address,
			tlf: req.body.tlf,
			rif: req.body.rif,
		};
		let newCompany = new Company(company);
		let response = await Company.addCompany(newCompany);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


// Delete company
companyRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await Company.deleteCompany(item);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update company, NEED TO IMPROVE
companyRouter.put('/', auth, async (req, res, next) => {
	try {
		const company = {
			name: req.body.name,
			mail: req.body.mail,
			address: req.body.address,
			tlf: req.body.tlf,
			rif: req.body.rif,
		};
		let companyId = req.body.id
		console.log(companyId);
		let response = await Company.updateCompany(company, companyId);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

// Get Company
companyRouter.get('/', auth, async (req, res, next) => {
	try {
		let response = await Company.getCompany();
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}

});


module.exports = companyRouter;