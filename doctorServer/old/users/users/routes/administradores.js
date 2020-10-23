const express = require('express');
const adminRouter = express.Router();
const auth = require("../auth/auth");
const User = require('../models/user');
const Admin = require('../models/administrador');

adminRouter.post('/', /*auth,*/ async (req, res) => {
	try {
		const user = {
			username: req.body.username,
			name: req.body.name,
			mail: req.body.mail,
			password: req.body.password,
			type: req.body.type,
		};
		let newUser = new User(user);
		let response = await User.addUser(newUser);
		if (response.status) {
			const admin = {
				userId: response.values._id,
			};
			let newAdmin = new Admin(admin);
			response = await Admin.addAdmin(newAdmin);
		}
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


adminRouter.get('/all', auth, async (req, res) => {
	try {
		let response = await Admin.getAdmins();
		/* if (response.values && response.values.length) {
		} else {
			throw new Error('There are no admins')
		} */
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


adminRouter.get('/:adminId', auth, async (req, res) => {
	try {
		const adminId = req.params.adminId;
		const admin = await Admin.getAdmin(adminId);
		const msg = ` ${req.originalUrl} `;
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});


// Delete user
adminRouter.delete('/', auth, async (req, res, next) => {
	try {

		const item = req.query.item;

		let response = await Admin.deleteAdmin(item);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}
});

// Update user, NEED TO IMPROVE
adminRouter.put('/', auth, async (req, res, next) => {
	try {
		const updateData = req.body;

		let response = await Admin.updateAdmin(updateData);
		res.status(200).json(response);
	}
	catch (e) {
		res.status(400).json(e.toString());
	}


});

module.exports = adminRouter;