const express = require('express');
const retRouter = express.Router();
const passport = require('passport');


//Create Ret
retRouter.post('/', (req, res, next) => {
	console.log("Creating Ret");
	return res.json({
		status: true
	});
});

retRouter.get('/', (req, res, next) => {
	console.log('getting rets');
	return res.json({
		status: false
	});
});


//Update BAcc
retRouter.put('/', (req, res, next) => {
	console.log('Updating ret');	
	return res.json({
		status: true
	});
});

//Delete BAcc
retRouter.delete('/', (req, res, next) => {
	console.log('Deleting ret')
	return res.json({
		status: true
	});
});

module.exports = retRouter;