const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;

const pedidoSchema = new mongoose.Schema({
  cliente: {
    type: Schema.Types.ObjectId,
    ref: 'Cliente',
  },
  vendedor: {
    type: Schema.Types.ObjectId,
    ref: 'User',
  },
  productosPedidos: [{
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
  fecha: {
    type: Date,
  },
  montoTotal: {
    type: Number,
  },
  estado: {
    type: String,
  },
  condicionVenta: {
    type: String,
  },
  observaciones: {
    type: String,
  },
  proforma: {
    type: Schema.Types.ObjectId,
    ref: 'Proforma',
  },
})
/* .post('save', alterDisponibilidad)
  .post('remove', egresoDeleted);
 */
async function egresoDeleted(element, next) {
  try {
    const Producto = require('./producto');
    const Disponibilidad = require('./disponibilidad');
    let pedidoId = element._id;

    let productosPedidos = element.productosPedidos;
    let piLength = productosPedidos.length;

    for (let i = 0; i < piLength; i++) {
      let productoId = productosPedidos[i].producto;
      let qty = productosPedidos[i].qty;

      let queryA = { 'producto': productoId }
      let disponibilidad = await Disponibilidad.findOne(queryA)



      disponibilidad.qtyDisponible += qty;
      disponibilidad.qtyBloqueada -= qty;
      for (let j = 0; j < disponibilidad.pedidos.length; j++) {
        if (disponibilidad.pedidos[j].toString() == pedidoId) {
          disponibilidad.pedidos.splice(j, 1);
        }
      }
      disponibilidad = await disponibilidad.save();
    }
    next();
  } catch (error) {
    console.log(error.toString());
  }

}

async function alterDisponibilidad(element, next) {
  try {

    const Producto = require('./producto');
    const Disponibilidad = require('./disponibilidad');

    let productosPedidos = element.productosPedidos;
    let pedidoId = element._id;

    let piLength = productosPedidos.length;

    for (let i = 0; i < piLength; i++) {
      let productoId = productosPedidos[i].producto;
      let qty = productosPedidos[i].qty;

      let queryA = { 'producto': productoId }
      let disponibilidad = await Disponibilidad.findOne(queryA)



      disponibilidad.qtyDisponible -= qty;
      disponibilidad.qtyBloqueada += qty;
      disponibilidad.pedidos.push(pedidoId);
      disponibilidad = await disponibilidad.save();
    }
    next();
  } catch (error) {

  }

}

const Pedido = module.exports = mongoose.model("Pedido", pedidoSchema);

module.exports.removeRef = async function (element) {
  try {
    const Disponibilidad = require('./disponibilidad');
    let productosPedidos = element.productosPedidos;
    let pedidoId = element._id;
    await Disponibilidad.removePedido(productosPedidos, pedidoId)
  } catch (error) {
    throw error
  }

}

module.exports.bloquearProductos = async function (element) {
  try {

    const Disponibilidad = require('./disponibilidad');

    let productosPedidos = element.productosPedidos;
    let pedidoId = element._id;

    await Disponibilidad.bloquearProductos(productosPedidos, pedidoId)

  } catch (error) {
    throw error
  }

}

module.exports.deletePedido = async function (id) {
  try {
    const query = { "_id": id };
    let pedido = await this.findOne(query);
    await this.removeRef(pedido);
    let deleteRes = await pedido.remove();
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

module.exports.addPedido = async function (newPedido) {
  try {
    await this.bloquearProductos(newPedido);
    let pedido = await newPedido.save()

    let response = {
      status: true,
      values: pedido
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

module.exports.getPedidos = async function () {
  try {
    const query = {};
    let pedidos = await this.find(query)
      .populate('productosPedidos.producto')
    let response = {
      status: true,
      values: pedidos
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
module.exports.getPedido = async function (id) {
  try {
    const query = { '_id': id };
    let pedido = await this.findOne(query)
    let response = {
      status: true,
      values: pedido
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
module.exports.updatePedido = async function (data) {
  try {
    const query = { '_id': data.id }
    let pedido = await this.findOne(query);
    pedido.name = data.name;
    pedido.code = data.code;
    pedido = await pedido.save();
    let response = {
      status: true,
      values: pedido
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