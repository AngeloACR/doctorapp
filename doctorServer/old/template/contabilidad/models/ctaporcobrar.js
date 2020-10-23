const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const ctaporcobrarSchema = new mongoose.Schema({
    cobros: [{
        proforma: {
            type: Schema.Types.ObjectId,
            ref: 'Proforma',
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
    cliente: {
        type: Schema.Types.ObjectId,
        ref: 'Cliente',
    },
    cuentaT: {
        type: Schema.Types.ObjectId,
        ref: 'CuentaT',
    },
})
const Ctaporcobrar = module.exports = mongoose.model("Ctaporcobrar", ctaporcobrarSchema);

module.exports.removeRef = async function (element) {
    try {
    } catch (error) {
        throw error
    }

}


module.exports.deleteCtaporcobrar = async function (id) {
    try {
        const query = { "_id": id };
        let ctaporcobrar = await this.findOne(query);
        await this.removeRef(ctaporcobrar);
        let deleteRes = await ctaporcobrar.remove();
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

module.exports.addCtaporcobrar = async function (newCtaporcobrar) {
    try {
        let ctaporcobrar = await newCtaporcobrar.save()

        let response = {
            status: true,
            values: ctaporcobrar
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

module.exports.getCtasporcobrar = async function () {
    try {
        const query = {};
        let ctaporcobrars = await this.find(query)
            .populate('productosAutorizados.producto')
        let response = {
            status: true,
            values: ctaporcobrars
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
module.exports.getCtaporcobrar = async function (id) {
    try {
        const query = { '_id': id };
        let ctaporcobrar = await this.findOne(query)
        let response = {
            status: true,
            values: ctaporcobrar
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
module.exports.updateCtaporcobrar = async function (data) {
    try {
        const query = { '_id': data.id }
        let ctaporcobrar = await this.findOne(query);
        ctaporcobrar.name = data.name;
        ctaporcobrar.code = data.code;
        ctaporcobrar = await ctaporcobrar.save();
        let response = {
            status: true,
            values: ctaporcobrar
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