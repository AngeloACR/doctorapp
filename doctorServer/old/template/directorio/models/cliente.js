const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const clienteSchema = mongoose.Schema({
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
  ctaPorCobrar: {
    type: Schema.Types.ObjectId,
    ref: 'Ctaporcobrar',
  },
});

const Cliente = module.exports = mongoose.model("Cliente", clienteSchema);


module.exports.deleteCliente = async function (id) {
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



module.exports.addCliente = async function (newCliente) {
  try {
    const query = { 'rif': newCliente.rif };
    let cliente = await this.findOne(query)
    if (cliente) {
      throw new Error('Rif de cliente ya registrado')
    } else {
      cliente = await newCliente.save();
      let response = {
        status: true,
        values: cliente
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

module.exports.getClientes = async function () {
  try {
    const query = {};
    let clientes = await this.find(query);
    let response = {
      status: true,
      values: clientes
    }
    return response;
  } catch (error) { throw error; }
}
module.exports.getCliente = async function (id) {
  try {
    const query = { '_id': id };
    let cliente = await this.findOne(query)
    let response = {
      status: true,
      values: cliente
    }
    return response;
  } catch (error) { throw error; }
}
module.exports.updateCliente = async function (data) {
  try {
    const query = { '_id': data.id }
    let cliente = await this.findOne(query)
    cliente.name = data.name;
    cliente.address = data.address;
    cliente.ws = data.ws;
    cliente.ig = data.ig;
    cliente.mail = data.mail;
    cliente.rif = data.rif;
    cliente = await cliente.save();
    let response = {
      status: true,
      values: cliente
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