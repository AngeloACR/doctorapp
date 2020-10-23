const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const disponibilidadBancariaSchema = new mongoose.Schema({
    banco: {
        type: Schema.Types.ObjectId,
        ref: 'Banco',
    },
    movimientosDiarios: [{
        type: Schema.Types.ObjectId,
        ref: 'MovimientoDiario',
    }],
    montoDisponible: {
        type: Number,
    },
    montoBloqueado: {
        type: Number,
    },
    montoDiferido: {
        type: Number,
    }
})

const DisponibilidadBancaria = module.exports = mongoose.model("DisponibilidadBancaria", disponibilidadBancariaSchema);
