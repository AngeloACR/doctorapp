const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const compraSchema = new mongoose.Schema({
  productosIngresados: [{
    producto: {
      type: Schema.Types.ObjectId,
      ref: 'Producto',
    },
    qty: {
      type: Number,
    },
    unitcost: {
      type: Number,
    }
  }],
  almacen: {
    type: Schema.Types.ObjectId,
    ref: 'Almacen',
  },
  fecha: {
    type: Date,
  },
  estado: {
    type: String,
  },
  observaciones: {
    type: String,
  },
  referencia: {
    type: String,
  },
  proveedor: {
    type: Schema.Types.ObjectId,
    ref: 'Almacen',
  }
})
/* .post('save', alterDisponibilidad)
  .post('remove', compraDeleted);
 */
async function compraDeleted(element) {
  try {


    const Producto = require('./producto');
    const Almacen = require('./almacen');
    const Disponibilidad = require('./disponibilidad');

    let productosIngresados = element.productosIngresados;
    let almacenId = element.almacen;
    let compraId = element._id;
    let piLength = productosIngresados.length;

    for (let i = 0; i < piLength; i++) {
      let productoId = productosIngresados[i].producto;
      let qty = productosIngresados[i].qty;

      let queryA = { 'producto': productoId }
      let disponibilidad = await Disponibilidad.findOne(queryA)

      let dLength = disponibilidad.dispoAlmacen.length;
      for (let j = 0; j < dLength; j++) {
        if (almacenId == disponibilidad.dispoAlmacen[j].almacen.toString()) {
          disponibilidad.dispoAlmacen[j].qty -= qty;
          break;
        }

      }

      disponibilidad.qtyDisponible -= qty;
      for (let j = 0; j < disponibilidad.compras.length; j++) {
        if (disponibilidad.compras[j] == compraId) {
          disponibilidad.compras.splice(j, 1);
        }
      }
      disponibilidad = await disponibilidad.save();
    }
    next()



  } catch (error) {

  }

}

async function alterDisponibilidad(element) {
  try {

    const Producto = require('./producto');
    const Almacen = require('./almacen');
    const Disponibilidad = require('./disponibilidad');

    let productosIngresados = element.productosIngresados;
    let almacenId = element.almacen;
    let compraId = element._id;
    let piLength = productosIngresados.length;

    for (let i = 0; i < piLength; i++) {
      let productoId = productosIngresados[i].producto;
      let qty = productosIngresados[i].qty;

      let queryA = { 'producto': productoId }
      let disponibilidad = await Disponibilidad.findOne(queryA)

      let dLength = disponibilidad.dispoAlmacen.length;
      for (let j = 0; j < dLength; j++) {
        if (almacenId == disponibilidad.dispoAlmacen[j].almacen.toString()) {
          disponibilidad.dispoAlmacen[j].qty += qty;
          break;
        }

      }

      disponibilidad.qtyDisponible += qty;
      disponibilidad.compras.push(compraId);
      disponibilidad = await disponibilidad.save();
    }
    next()

  } catch (error) {

  }

}

const Compra = module.exports = mongoose.model("Compra", compraSchema);

module.exports.removeRef = async function (element) {
  try {
    const Disponibilidad = require('./disponibilidad');
    let productosIngresados = element.productosIngresados;
    let almacenId = element.almacen;
    let compraId = element._id;
    await Disponibilidad.removeCompra(productosIngresados, almacenId, compraId)
  } catch (error) {
    throw error
  }

}

module.exports.agregarProductos = async function (element) {
  try {

    const Disponibilidad = require('./disponibilidad');

    let productosIngresados = element.productosIngresados;
    let almacenId = element.almacen;
    let compraId = element._id;

    await Disponibilidad.agregarProductos(productosIngresados, almacenId, compraId)

  } catch (error) {
    throw error
  }

}

module.exports.deleteCompra = async function (id) {
  try {
    const query = { "_id": id };
    let compra = await this.findOne(query);
    await this.removeRef(compra);
    let deleteRes = await compra.remove();
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

module.exports.addCompra = async function (newCompra) {
  try {
    await this.agregarProductos(newCompra);
    let compra = await newCompra.save();
    let response = {
      status: true,
      values: compra
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

module.exports.getCompras = async function () {
  try {
    const query = {};
    let compras = await this.find(query)
    let response = {
      status: true,
      values: compras
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
module.exports.getCompra = async function (id) {
  try {
    const query = { '_id': id };
    let compra = await this.findOne(query)
    let response = {
      status: true,
      values: compra
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
module.exports.updateCompra = async function (data) {
  try {
    const query = { '_id': data.id }
    let compra = await this.findOne(query);
    compra.name = data.name;
    compra.code = data.code;
    compra = await compra.save();
    let response = {
      status: true,
      values: compra
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