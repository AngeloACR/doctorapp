const express = require('express');
const personaRouter = express.Router();
const auth = require("../controllers/auth");
const async = require('async');
const Persona = require('../models/persona');

//**************************** USER CRUD************************************//
personaRouter.post('/', async (req, res) => {
    try {

        const persona = {
            nombres: req.nombres,
            apellidos: req.apellidos,
            tipo: req.tipo,
            identificacion: req.identificacion,
            sexo: req.sexo,
            status: req.status,
            foto: req.foto,
            codigoUsuario: req.codigoUsuario,
        };

        let newPersona = await Persona.addPersona(persona);
        res.status(200).json(newPersona);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});


// Delete persona
personaRouter.delete('/:item', auth, async (req, res, next) => {
    try {

        //		const item = req.query.item;
        const item = req.params.item;
        console.log(item)
        let response = await Persona.deletePersona(item);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }
});

// Update persona, NEED TO IMPROVE
personaRouter.put('/', auth, async (req, res, next) => {
    try {
        const persona = req.persona;
        const updateData = req.body.updateData;

        let response = await Persona.updatePersona(updateData);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }


});

// Get Persona
personaRouter.get('/', auth, async (req, res, next) => {

    const item = req.params.item;
    let response = await Persona.getPersonaByUser(item);
    res.status(200).json(response);
});


personaRouter.get('/all', auth, async (req, res, next) => {
    try {

        let response = await Persona.getPersonas(item);
        console.log(response);
        res.status(200).json(response);
    }
    catch (e) {
        res.status(400).json(e.toString());
    }

});

module.exports = personaRouter;