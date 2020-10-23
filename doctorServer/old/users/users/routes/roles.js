const express = require('express');
const rolRouter = express.Router();
const auth = require("../auth/auth");
const Rol = require('../models/rol');

rolRouter.post('/', async (req, res) => {
    try {
        const rol = {
            name: req.body.name,
        };

        let newRol = new Rol(rol)
        let response = await Rol.addRol(newRol);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});


// Delete rol
rolRouter.delete('/', auth, async (req, res, next) => {
    try {
        const item = req.query.item;
        console.log(item);
        let response = await Rol.deleteRol(item);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});

// Update rol, NEED TO IMPROVE
rolRouter.put('/', auth, async (req, res, next) => {
    try {
        const updateData = req.body.updateData;

        let response = await Rol.updateRol(updateData);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }


});

rolRouter.put('/password', auth, async (req, res, next) => {
    try {
        const rolname = req.body.rolname;
        const password = req.body.password;

        let response = await Rol.updatePassword(rolname, password);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }


});

// Get Rol
rolRouter.get('/', auth, async (req, res, next) => {
    return res.json({
        rol: req.rol
    });
});

rolRouter.get('/all', auth, async (req, res, next) => {
    try {

        let response = await Rol.getRols();
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }

});

module.exports = rolRouter;