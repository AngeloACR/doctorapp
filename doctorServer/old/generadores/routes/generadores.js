const express = require('express');
const tAccRouter = express.Router();
const passport = require('passport');

//Create TAcc
tAccRouter.post('/cTAcc', (req, res, next) => {

	const tName = req.body.tName;
	const tMonth = req.body.tMonth;
	const tClasf = req.body.tClasf;
	const tType = req.body.tType;
	const tNature = req.body.tNature;

	let newTAcc = new TAcc({
		tName: tName,
		tClasf: tClasf,
		tBalance: 0,
		tType: tType,
		tNature: tNature
	});

	let newMTAcc = new MTAcc({
		tName: tName,
		tMonth: tMonth,
		tNature: tNature,
		tType: tType,		
		tBalance: 0
	});


	var createTAcc = function(callback){
		TAcc.createTAcc(newTAcc, (cErr, tAcc) => {
			if(cErr) throw cErr
			if(tAcc){
				callback(null, tAcc);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		});		
	}

	var createMTAcc = function(callback){
		MTAcc.createMTAcc(newMTAcc, (mErr, mtAcc) => {
			if(mErr) throw mErr
			if(mtAcc){
				callback(null, mtAcc);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		});		
	}

	var updateCompany = function(callback){
		Company.updateTAcc(tName, (cErr, company) => {
			if(cErr) throw cErr;
			if(company){
				callback(null, company);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		});
	}

	async.series([
    	createTAcc,
    	createMTAcc,
    	updateCompany,
	], function (err, info) {
		if (err){	
			return res.json({
				success: false, 
				msg: err
			})
		} else{					
			return res.json({
				success: true, 
				msg: 'TAcc registered'
			})
		}
	});
});

tAccRouter.post('/csvTAccs', (req, res, next) => {

	const tName = req.body.tName;
	const tMonth = req.body.tMonth;
	const tClasf = req.body.tClasf;
	const tType = req.body.tType;
	const tNature = req.body.tNature;

	let newTAcc = new TAcc({
		tName: tName,
		tClasf: tClasf,
		tBalance: 0,
		tType: tType,
		tNature: tNature
	});

	let newMTAcc = new MTAcc({
		tName: tName,
		tMonth: tMonth,
		tNature: tNature,
		tType: tType,		
		tBalance: 0
	});


	var createTAcc = function(callback){
		TAcc.createTAcc(newTAcc, (cErr, tAcc) => {
			if(cErr) throw cErr
			if(tAcc){
				callback(null, tAcc);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		});		
	}

	var createMTAcc = function(callback){
		MTAcc.createMTAcc(newMTAcc, (mErr, mtAcc) => {
			if(mErr) throw mErr
			if(mtAcc){
				callback(null, mtAcc);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		});		
	}

	var updateCompany = function(callback){
		Company.updateTAcc(tName, (cErr, company) => {
			if(cErr) throw cErr;
			if(company){
				callback(null, company);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		});
	}

	async.series([
    	createTAcc,
    	createMTAcc,
    	updateCompany,
	], function (err, info) {
		if (err){	
			return res.json({
				success: false, 
				msg: err
			})
		} else{					
			return res.json({
				success: true, 
				msg: 'TAcc registered'
			})
		}
	});
});

//Get TAcc
tAccRouter.post('/gTAcc', (req, res, next) => {

	const tName = req.body.tName;

	TAcc.getTAccByName(tName, (err,tAcc) => {
	if(err) throw err;
		if(!tAcc){
			return res.json({
				success: false, 
				msg:'tAcc not found'
			});			
		} else{
			return res.json({
				success: true, 
				TAcc: tAcc
			});
		};
	});
});

// Get all BAccs
tAccRouter.get('/gTAccs', (req, res, next) => {
	TAcc.getAllTAccs( (err, tAccs) => {
		if (err) throw err;
		var tMap = [{}];
		var i = 0;
		if (tAccs && tAccs.length) {   
			tAccs.forEach(function(tAcc) {
				tMap[i] = tAcc;
				i++;
			});
			return res.json({
				status: true,
				tAccs: tMap
			});
		} else {
			return res.json({
				status: false,
				tAccs: tMap
			});
		}	
	});
});


//Update BAcc
tAccRouter.post('/uTAcc', (req, res, next) => {
	
	const tType = req.body.tType;
	const tClasf = req.body.tClasf;
	const tName = req.body.tName
	const tNature = req.body.tNature

	let tacc = new TAcc({
		tName: tName,
		tClasf: tClasf,
		tType: tType,
		tNature: tNature
	});


	TAcc.getTAccByName(tName, (err,tAcc) => {
	if(err) throw err;
		if(!tAcc){
			return res.json({
				success: false, 
				msg:'TAcc not found'
			});			
		} else{
			TAcc.updateTAcc(tacc, (uErr,uTAcc) => {
				return res.json({
					success: true, 
					msg: 'TAcc updated'
				});				
			});
		};
	});
});

//Delete BAcc
tAccRouter.post('/dTAcc', (req, res, next) => {

	const tName = req.body.tName

	var findMoves = function(callback){
		Move.getMovesByTAcc(tName, (dErr,moves) => {
			if(dErr) throw dErr
			if(moves){
				callback(null, moves);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		})
	}

	var deleteMoves = function(moves, callback){
		var aux = true;
		moves.forEach(function(move){
			Move.deleteMove(move, (mErr,status) => {
				if(mErr) aux = false;
			});
		});
		if(aux){
			callback(null, aux);
		} else{
			callback(new Error('Something is wrong, try again in a million years'))			
		}
	}

	var moveThing = function(callback){
		async.waterfall([
	    	findMoves,
	    	deleteMoves,
		], function (err, info) {
			if (err){	
				callback(new Error('Something is wrong, try again in a million years'))			
			} else{
				callback(null, true);
			}
		});
	}


	var getTAcc = function(status, callback){
		TAcc.getTAccByName(tName, (cErr,tacc) => {
			if(cErr) throw cErr;
			if(tacc){
				callback(null, tacc);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		});
	}


	var removeTAcc = function(tacc, callback){
		Company.removeTAcc(tacc.tName, (dErr,dtAcc) => {
			if(dErr) throw dErr
			if(dtAcc){
				callback(null, tacc);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		})
	}

	var deleteMTAcc = function(tacc, callback){
		MTAcc.deleteMTAcc(tacc, (dErr,dtAcc) => {
			if(dErr) throw dErr;
			if(dtAcc){
				callback(null, tacc);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		})
	}

	var deleteTAcc = function(tacc, callback){
		TAcc.deleteTAcc(tacc, (dErr,dtAcc) => {
			if(dErr) throw dErr
			if(dtAcc){
				callback(null, dtAcc);
			} else {
				callback(new Error('Something is wrong, try again in a million years'))
			}
		})
	}
	
	async.waterfall([
		moveThing,
		getTAcc,
		removeTAcc,
    	deleteMTAcc,
    	deleteTAcc,
	], function (err, info) {
		if (err){
			return res.json({
				success: false, 
				msg: err
			})
		} else{	
			return res.json({
				success: true, 
				msg: 'TAcc deleted'
			})
		}
	});
});

tAccRouter.get('/gmTAccs', (req, res, next) => {
	MTAcc.getAllMTAccs( (err, mtAccs) => {
		if (err) throw err;
		var tMap = [{}];
		var i = 0;
		if (mtAccs && mtAccs.length) {   
			mtAccs.forEach(function(mtAcc) {
				tMap[i] = mtAcc;
				i++;
			});
			return res.json({
				status: true,
				mtAccs: tMap
			});
		} else {
			return res.json({
				status: false
			});
		}		
	});
});

module.exports = tAccRouter;