const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const precioSchema = new mongoose.Schema({
  producto: {
    type: Schema.Types.ObjectId,
    ref: 'Producto',
  },
  valor: {
    type: Number,
  }
})
//.post('save', elementAdded)


async function elementAdded(element) {
  try {

  } catch (error) {
    console.log(error.toString())
  }

}
const Precio = module.exports = mongoose.model("Precio", precioSchema);


module.exports.deletePrecio = async function (id) {
  try {
    const query = { "_id": id };

    let precio = await this.findOne(query);
    let deleteRes = precio.remove();
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

module.exports.addPrecio = async function (newPrecio) {
  try {

    const query = { 'producto': newPrecio.producto };

    let precio = await this.findOne(query)
    if (precio) {
      throw new Error('Precio ya registrado');
    }

    precio = await newPrecio.save()
    await elementAdded(precio);

    let response = {
      status: true,
      values: precio
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

module.exports.getPrecios = async function () {
  try {
    const query = {};
    let precios = await this.find(query)
      .populate('producto');
    let response = {
      status: true,
      values: precios
    }
    return response;
  } catch (error) { throw error; }
}
module.exports.getPrecio = async function (id) {
  try {
    const query = { '_id': id };
    let precio = await this.findOne(query)
    let response = {
      status: true,
      values: precio
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
module.exports.updatePrecio = async function (data) {
  try {
    const query = { '_id': data.id }
    let precio = await this.findOne(query);
    precio.valor = data.valor;
    precio = await precio.save();
    let response = {
      status: true,
      values: precio
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