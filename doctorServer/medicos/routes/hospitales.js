const express = require('express');
const mainRouter = express.Router();
const passport = require('passport');


//Create Ret
mainRouter.post('/', (req, res, next) => {
    console.log("Creating Ret");
    return res.json({
        status: true
    });
});

mainRouter.get('/', (req, res, next) => {
    console.log('getting rets');
    return res.json({
        status: false
    });
});


//Update BAcc
mainRouter.put('/', (req, res, next) => {
    console.log('Updating ret');
    return res.json({
        status: true
    });
});

//Delete BAcc
mainRouter.delete('/', (req, res, next) => {
    console.log('Deleting ret')
    return res.json({
        status: true
    });
});

module.exports = mainRouter; const express = require('express');
const mainRouter = express.Router();
const passport = require('passport');


//Create Ret
mainRouter.post('/', (req, res, next) => {
    console.log("Creating Ret");
    return res.json({
        status: true
    });
});

mainRouter.get('/', (req, res, next) => {
    console.log('getting rets');
    return res.json({
        status: false
    });
});


//Update BAcc
mainRouter.put('/', (req, res, next) => {
    console.log('Updating ret');
    return res.json({
        status: true
    });
});

//Delete BAcc
mainRouter.delete('/', (req, res, next) => {
    console.log('Deleting ret')
    return res.json({
        status: true
    });
});

module.exports = mainRouter;