const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const cuentaTSchema = new mongoose.Schema({
    name: {
        type: String,
    },
    balance: {
        type: Number,
    },
    clasificacion: {
        type: String,
    },
    naturaleza: {
        type: String,
    },
    descripcion: {
        type: String,
    },
    movimientos: [{
        type: Schema.Types.ObjectId,
        ref: 'MovimientoDiario',
    }]
})
const CuentaT = module.exports = mongoose.model("CuentaT", cuentaTSchema);

module.exports.removeRef = async function (element) {
    try {
    } catch (error) {
        throw error
    }

}


module.exports.deleteCuentaT = async function (id) {
    try {
        const query = { "_id": id };
        let cuentaT = await this.findOne(query);
        await this.removeRef(cuentaT);
        let deleteRes = await cuentaT.remove();
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

module.exports.addCuentaT = async function (newCuentaT) {
    try {
        let cuentaT = await newCuentaT.save()

        let response = {
            status: true,
            values: cuentaT
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
        let cuentaTs = await this.find(query)
            .populate('productosAutorizados.producto')
        let response = {
            status: true,
            values: cuentaTs
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
module.exports.getCuentaT = async function (id) {
    try {
        const query = { '_id': id };
        let cuentaT = await this.findOne(query)
        let response = {
            status: true,
            values: cuentaT
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
module.exports.updateCuentaT = async function (data) {
    try {
        const query = { '_id': data.id }
        let cuentaT = await this.findOne(query);
        cuentaT.name = data.name;
        cuentaT.code = data.code;
        cuentaT = await cuentaT.save();
        let response = {
            status: true,
            values: cuentaT
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