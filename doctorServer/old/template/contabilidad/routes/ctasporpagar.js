const express = require('express');
const ctaporpagarRouter = express.Router();
const auth = require("../../users/auth/auth");
const Ctaporpagar = require('../models/ctaporpagar');
const ctaPorPagarHandler = require('../controllers/main').ctaPorPagarHandler;

ctaporpagarRouter.post('/', auth, async (req, res) => {
    try {
        const ctaporpagar = {
            proveedor: req.body.cliente,
            ingreso: req.body.proforma,
            status: req.body.status,
            montoTotal: req.body.montoTotal,
        };
        let response = await ctaPorPagarHandler.addCtaporpagar(newCtaporpagar);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});


ctaporpagarRouter.get('/all', auth, async (req, res) => {
    try {
        let response = await ctaPorPagarHandler.getCtasporpagar();

        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});


ctaporpagarRouter.get('/:ctaporpagarId', auth, async (req, res) => {
    try {
        const ctaporpagarId = req.params.ctaporpagarId;
        let response = await ctaPorPagarHandler.getCtaporpagar(ctaporpagarId);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});

// Delete user
ctaporpagarRouter.delete('/', auth, async (req, res, next) => {
    try {

        const item = req.query.item;

        let response = await ctaPorPagarHandler.deleteCtaporpagar(item);
        console.log(response);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});

// Update user, NEED TO IMPROVE
ctaporpagarRouter.put('/', auth, async (req, res, next) => {
    try {
        const updateData = req.body;

        let response = await ctaPorPagarHandler.updateCtaporpagar(updateData);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }


});

module.exports = ctaporpagarRouter;
