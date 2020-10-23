const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const ctaporpagarSchema = new mongoose.Schema({
    pagos: [{
        compra: {
            type: Schema.Types.ObjectId,
            ref: 'Compra',
        },
        montoTotal: {
            type: Number,
        },
        status: {
            type: String,
        },
        movimiento: {
            type: Schema.Types.ObjectId,
            ref: 'MovimientoDiario',
        },

    }],
    proveedor: {
        type: Schema.Types.ObjectId,
        ref: 'proveedor',
    },
    cuentaT: {
        type: Schema.Types.ObjectId,
        ref: 'CuentaT',
    },
})
const Ctaporpagar = module.exports = mongoose.model("Ctaporpagar", ctaporpagarSchema);

module.exports.removeRef = async function (element) {
    try {
    } catch (error) {
        throw error
    }

}


module.exports.deleteCtaporpagar = async function (id) {
    try {
        const query = { "_id": id };
        let ctaporpagar = await this.findOne(query);
        await this.removeRef(ctaporpagar);
        let deleteRes = await ctaporpagar.remove();
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

module.exports.addCtaporpagar = async function (newCtaporpagar) {
    try {
        let ctaporpagar = await newCtaporpagar.save()

        let response = {
            status: true,
            values: ctaporpagar
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

module.exports.getCtasporpagar = async function () {
    try {
        const query = {};
        let ctaporpagars = await this.find(query)
            .populate('productosAutorizados.producto')
        let response = {
            status: true,
            values: ctaporpagars
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
module.exports.getCtaporpagar = async function (id) {
    try {
        const query = { '_id': id };
        let ctaporpagar = await this.findOne(query)
        let response = {
            status: true,
            values: ctaporpagar
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
module.exports.updateCtaporpagar = async function (data) {
    try {
        const query = { '_id': data.id }
        let ctaporpagar = await this.findOne(query);
        ctaporpagar.name = data.name;
        ctaporpagar.code = data.code;
        ctaporpagar = await ctaporpagar.save();
        let response = {
            status: true,
            values: ctaporpagar
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