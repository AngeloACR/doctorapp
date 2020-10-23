const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;


const bancoSchema = new mongoose.Schema({
  bank: {
    type: String,
  },
  accountNumber: {
    type: String,
  },
  status: {
    type: String,
  },
  alias: {
    type: String,
  },
  saldoInicial: {
    type: Number,
  },
  disponibilidad: {
    type: Schema.Types.ObjectId,
    ref: 'DisponibilidadBancaria',
  },
})

const Banco = module.exports = mongoose.model("Banco", bancoSchema);

module.exports.createRef = async function (element) {
  try {


  } catch (error) {
    console.log(error.toString())
  }

}


module.exports.removeLinkedDocuments = async function (element) {
  try {


  } catch (error) {
    console.log(error.toString())
  }

}



module.exports.deleteBanco = async function (id) {
  try {
    const query = { "_id": id };
    let banco = await this.findOne(query);
    await this.removeLinkedDocuments(banco)
    let deleteRes = await banco.remove();

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

module.exports.addBanco = async function (newBanco) {
  try {

    const query = { 'code': newBanco.code };
    let banco = await this.findOne(query)
    if (banco) {
      throw new Error('Código de banco ya registrado');
    }
    let ref = await this.createRef(newBanco);

    banco = await newBanco.save();

    let response = {
      status: true,
      values: banco
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

module.exports.getBancos = async function () {
  try {
    const query = {};
    let bancos = await this.find(query)
    let response = {
      status: true,
      values: bancos
    }
    return response;
  } catch (error) { throw error; }
}
module.exports.getBanco = async function (id) {
  try {
    const query = { '_id': id };
    let banco = await this.findOne(query)
    let response = {
      status: true,
      values: banco
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
module.exports.updateBanco = async function (data) {
  try {
    const query = { '_id': data.id }
    let banco = await this.findOne(query);
    banco.name = data.name;
    banco.code = data.code;
    banco.brand = data.brand;
    banco = await banco.save();
    let response = {
      status: true,
      values: banco
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