const express = require('express');
const movimientoDiarioRouter = express.Router();
const auth = require("../../users/auth/auth");
const movimientoDiarioHandler = require('../controllers/main').movimientoDiarioHandler;

movimientoDiarioRouter.post('/', auth, async (req, res) => {
    try {
        const movimientoDiario = {
            name: req.body.name,
            balance: 0,
            clasificacion: req.body.clasificacion,
            naturaleza: req.body.naturaleza,
            descripcion: req.body.descipcion,
        };
        console.log('here')
        let response = await movimientoDiarioHandler.addMovimientoDiario(movimientoDiario);
        console.log(response);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});


movimientoDiarioRouter.get('/all', auth, async (req, res) => {
    try {
        let response = await movimientoDiarioHandler.getMovimientosDiarios();
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});


movimientoDiarioRouter.get('/:movimientoDiarioId', auth, async (req, res) => {
    try {
        const movimientoDiarioId = req.params.movimientoDiarioId;
        let response = await movimientoDiarioHandler.getMovimientoDiario(movimientoDiarioId);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});

// Delete user
movimientoDiarioRouter.delete('/', auth, async (req, res, next) => {
    try {

        const item = req.query.item;

        let response = await movimientoDiarioHandler.deleteMovimientoDiario(item);
        console.log(response);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});

// Update user, NEED TO IMPROVE
movimientoDiarioRouter.put('/', auth, async (req, res, next) => {
    try {
        const updateData = req.body;
        const id = req.body._id;

        let response = await movimientoDiarioHandler.updateMovimientoDiario(id, updateData);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }


});

module.exports = movimientoDiarioRouter;
