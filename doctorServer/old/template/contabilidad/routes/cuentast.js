const express = require('express');
const ctaTRouter = express.Router();
const auth = require("../../users/auth/auth");
const ctaTHandler = require('../controllers/main').ctaTHandler;

ctaTRouter.post('/', auth, async (req, res) => {
    try {
        const ctaT = {
            name: req.body.name,
            balance: 0,
            clasificacion: req.body.clasificacion,
            naturaleza: req.body.naturaleza,
            descripcion: req.body.descipcion,
        };
        console.log('here')
        let response = await ctaTHandler.addCuentaT(ctaT);
        console.log(response);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});


ctaTRouter.get('/all', auth, async (req, res) => {
    try {
        let response = await ctaTHandler.getCuentasT();
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});


ctaTRouter.get('/:ctaTId', auth, async (req, res) => {
    try {
        const ctaTId = req.params.ctaTId;
        let response = await ctaTHandler.getCuentaT(ctaTId);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});

// Delete user
ctaTRouter.delete('/', auth, async (req, res, next) => {
    try {

        const item = req.query.item;

        let response = await ctaTHandler.deleteCuentaT(item);
        console.log(response);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});

// Update user, NEED TO IMPROVE
ctaTRouter.put('/', auth, async (req, res, next) => {
    try {
        const updateData = req.body;
        const id = req.body._id;

        let response = await ctaTHandler.updateCuentaT(id, updateData);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }


});

module.exports = ctaTRouter;
