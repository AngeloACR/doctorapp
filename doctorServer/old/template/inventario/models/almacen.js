const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const almacenSchema = new mongoose.Schema({

  code: {
    type: String,
  },
  disponibilidades: [{
    type: Schema.Types.ObjectId,
    ref: 'Disponibilidad',
  }],
  state: {
    type: String,
  },
  city: {
    type: String,
  },
  address: {
    type: String,
  },
})/* .post('save', createDisponibilidad)
.post('remove', removeLinkedDocuments); */

const Almacen = module.exports = mongoose.model("Almacen", almacenSchema);

module.exports.addDisponibilidad = async function (element) {
  try {
    const Disponibilidad = require('./disponibilidad');
    await Disponibilidad.addAlmacen(element._id);
    let disponibilidades = await Disponibilidad.find({});
    let aux = []
    disponibilidades.forEach(disponibilidad => {
      aux.push(disponibilidad._id)
    });
    return aux;
  } catch (error) {
    console.log(error.toString())
  }

}

module.exports.removeDisponibilidad = async function (element) {
  try {
    const Disponibilidad = require('./disponibilidad');
    await Disponibilidad.removeAlmacen(element._id);

  } catch (error) {
    console.log(error.toString())
  }

}


module.exports.deleteAlmacen = async function (id) {
  try {
    const query = { "_id": id };
    let almacen = await this.findOne(query);
    await this.removeDisponibilidad(almacen);
    let deleteRes = almacen.remove();
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

module.exports.addAlmacen = async function (newAlmacen) {
  try {
    const query = { 'code': newAlmacen.code };
    let almacen = await this.findOne(query)
    if (almacen) {
      throw new Error('Código de almacen ya registrado');
    }

    let disponibilidades = await this.addDisponibilidad(newAlmacen)
    newAlmacen.disponibilidades = disponibilidades;

    almacen = await newAlmacen.save();
    let response = {
      status: true,
      values: almacen
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

module.exports.getAlmacenes = async function () {
  try {
    const query = {};
    let almacens = await this.find(query)
      .populate('disponibilidades')
    let response = {
      status: true,
      values: almacens
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
module.exports.getAlmacen = async function (id) {
  try {
    const query = { '_id': id };
    let almacen = await this.findOne(query)
      .populate({ path: 'userId', select: 'username mail type name' })
    let response = {
      status: true,
      values: almacen
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
module.exports.updateAlmacen = async function (data) {
  try {
    const query = { 'userId': data.id }
    let almacen = await this.findOne(query);
    almacen.code = data.code;
    almacen.state = data.state;
    almacen.city = data.city;
    almacen.address = data.adress;
    almacen = await almacen.save();
    let response = {
      status: true,
      values: almacen
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