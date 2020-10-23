const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const movimientoDiarioSchema = new mongoose.Schema({
    fecha: {
        type: Date,
    },
    codigo: {
        type: String
    },
    monto: {
        type: Number,
    },
    signo: {
        type: String,
    },
    banco: {
        type: Schema.Types.ObjectId,
        ref: 'Banco',
    },
    cuentaT: {
        type: Schema.Types.ObjectId,
        ref: 'CuentaT',
    },
    descripcion: {
        type: String
    },
    disponibilidadAntes: {
        type: Number
    },
    disponibilidadDespues: {
        type: Number
    },
})
const MovimientoDiario = module.exports = mongoose.model("MovimientoDiario", movimientoDiarioSchema);
