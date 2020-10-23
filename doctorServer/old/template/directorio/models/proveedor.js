const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const proveedorSchema = mongoose.Schema({
  name: {
    type: String,
  },
  address: {
    type: String,
  },
  ws: {
    type: String,
  },
  ig: {
    type: String,
  },
  mail: {
    type: String,
  },
  rif: {
    type: String
  },
  ctaPorPagar: {
    type: Schema.Types.ObjectId,
    ref: 'Ctaporpagar',
  },
});

const Proveedor = module.exports = mongoose.model("Proveedor", proveedorSchema);


module.exports.deleteProveedor = async function (id) {
  try {
    const query = { "_id": id };

    let deleteRes = await this.findOneAndRemove(query);

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

module.exports.addProveedor = async function (newProveedor) {
  try {
    const query = { 'rif': newProveedor.rif };
    let proveedor = await this.findOne(query)
    if (proveedor) {
      throw new Error('Rif de proveedor ya registrado')
    } else {
      let proveedor = await newProveedor.save();
      let response = {
        status: true,
        values: proveedor
      }
      return response;
    }
  } catch (error) {
    let response = {
      status: false,
      msg: error.toString().replace("Error: ", "")
    }
    return response
  }
}

module.exports.getProveedores = async function () {
  try {
    const query = {};
    let proveedors = await this.find(query)
    let response = {
      status: true,
      values: proveedors
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
module.exports.getProveedor = async function (id) {
  try {
    const query = { '_id': id };
    let proveedor = await this.findOne(query)
    let response = {
      status: true,
      values: proveedor
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

module.exports.updateProveedor = async function (data) {
  try {
    const query = { '_id': data.id }
    let proveedor = await this.findOne(query)
    proveedor.name = data.name;
    proveedor.address = data.address;
    proveedor.ws = data.ws;
    proveedor.ig = data.ig;
    proveedor.mail = data.mail;
    proveedor.rif = data.rif;
    proveedor = await proveedor.save();
    let response = {
      status: true,
      values: proveedor
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