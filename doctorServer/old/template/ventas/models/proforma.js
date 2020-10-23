const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const proformaSchema = new mongoose.Schema({
    pedido: {
        type: Schema.Types.ObjectId,
        ref: 'Pedido',
    },
    fecha: {
        type: Date,
    },
    productosAutorizados: [{
        producto: {
            type: Schema.Types.ObjectId,
            ref: 'Producto',
        },
        qty: {
            type: Number,
        },
        montoProducto: {
            type: Number,
        },
        precio: {
            type: Number,
        }
    }],
    montoTotal: {
        type: Number,
    },
    status: {
        type: String,
    },
    referencia: {
        type: String,
    },
    reciboDeCobro: {
        type: String,
    },
    cliente: {
        type: Schema.Types.ObjectId,
        ref: 'Cliente',
    },
    observaciones: {
        type: String,
    },
})
const Proforma = module.exports = mongoose.model("Proforma", proformaSchema);

module.exports.removeRef = async function (element) {
    try {
        /*         const Disponibilidad = require('./disponibilidad');
                let productosAutorizados = element.productosAutorizados;
                let proformaId = element._id;
                await Disponibilidad.removeProforma(productosAutorizados, proformaId) */
    } catch (error) {
        throw error
    }

}

module.exports.bloquearProductos = async function (element) {
    try {

        const Disponibilidad = require('./disponibilidad');

        let productosProformas = element.productosProformas;
        let proformaId = element._id;

        await Disponibilidad.bloquearProductos(productosProformas, proformaId)

    } catch (error) {
        throw error
    }

}

module.exports.deleteProforma = async function (id) {
    try {
        const query = { "_id": id };
        let proforma = await this.findOne(query);
        await this.removeRef(proforma);
        let deleteRes = await proforma.remove();
        let response = {
            status: true,
            values: deleteRes
        }
        return response;
    } catch (error) {
        let response = {
            status: false,
            msg: error.toString().replace("Error: ", "")
        }
        return response
    }
}

module.exports.addProforma = async function (newProforma) {
    try {
        //        await this.bloquearProductos(newProforma);
        let proforma = await newProforma.save()

        let response = {
            status: true,
            values: proforma
        }
        return response;
    } catch (error) {
        let response = {
            status: false,
            msg: error.toString().replace("Error: ", "")
        }
        return response
    }
}

module.exports.getProformas = async function () {
    try {
        const query = {};
        let proformas = await this.find(query)
            .populate('productosAutorizados.producto')
        let response = {
            status: true,
            values: proformas
        }
        return response;
    } catch (error) {
        let response = {
            status: false,
            msg: error.toString().replace("Error: ", "")
        }
        return response
    }
}
module.exports.getProforma = async function (id) {
    try {
        const query = { '_id': id };
        let proforma = await this.findOne(query)
        let response = {
            status: true,
            values: proforma
        }
        return response;
    } catch (error) {
        let response = {
            status: false,
            msg: error.toString().replace("Error: ", "")
        }
        return response
    }
}
module.exports.updateProforma = async function (data) {
    try {
        const query = { '_id': data.id }
        let proforma = await this.findOne(query);
        proforma.name = data.name;
        proforma.code = data.code;
        proforma = await proforma.save();
        let response = {
            status: true,
            values: proforma
        }
        return response

    } catch (error) {
        let response = {
            status: false,
            msg: error.toString().replace("Error: ", "")
        }
        return response
    }
}