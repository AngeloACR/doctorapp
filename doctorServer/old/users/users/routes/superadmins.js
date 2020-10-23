const express = require('express');
const superAdminRouter = express.Router();
const auth = require("../auth/auth");
const User = require('../models/user');
const SuperAdmin = require('../models/superadmin');

superAdminRouter.post('/', /*auth,*/ async (req, res) => {
	try {
		const user = {
			username: req.body.username,
			name: req.body.name,
			mail: req.body.mail,
			password: req.body.password,
			type: req.body.type,
		};
		let newUser = new User(user)
		let userResponse = await User.addUser(newUser);
		if (userResponse.status) {
			const patient = {
				userId: userResponse.values._id,
			};
			let newSuperAdmin = new SuperAdmin(superSuperAdmin);
			let superSuperAdminResponse = await SuperAdmin.addSuperAdmin(newSuperAdmin);
		}
		res.status(200).json(userResponse);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


superAdminRouter.get('/all', auth, async (req, res) => {
	try {
		let response = await SuperAdmin.getSuperAdmins();
		/* if (response.values && response.values.length) {
		} else {
			throw new Error('There are no superSuperAdmins')
		} */
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


// Delete user
superAdminRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await SuperAdmin.deleteSuperAdmin(item);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
superAdminRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;

		let response = await SuperAdmin.updateSuperAdmin(updateData);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = superAdminRouter;