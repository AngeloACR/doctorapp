const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;
const Almacen = require('./almacen');

const disponibilidadSchema = new mongoose.Schema({
  producto: {
    type: Schema.Types.ObjectId,
    ref: 'Producto',
  },
  dispoAlmacen: [{
    almacen: {
      type: Schema.Types.ObjectId,
      ref: 'Almacen',
    },
    qty: {
      type: Number,
    }
  }],
  ingresos: [{
    type: Schema.Types.ObjectId,
    ref: 'Ingreso',
  }],
  pedidos: [{
    type: Schema.Types.ObjectId,
    ref: 'Pedido',
  }],
  qtyDisponible: {
    type: Number,
  },
  qtyBloqueada: {
    type: Number,
  }
})

const Disponibilidad = module.exports = mongoose.model("Disponibilidad", disponibilidadSchema);

module.exports.agregarProductos = async function (productosIngresados, almacenId, ingresoId) {
  try {


    productosIngresados.forEach(async (ingreso) => {

      let productoId = ingreso.producto;
      let qty = ingreso.qty;

      let queryA = { 'producto': productoId }
      let disponibilidad = await this.findOne(queryA)

      disponibilidad.qtyDisponible += qty;
      disponibilidad.dispoAlmacen.forEach(dispoAlmacen => {
        if (dispoAlmacen.almacen.toString() == almacenId) {
          dispoAlmacen.qty += qty;
          return;
        }
      });
      disponibilidad.ingresos.push(ingresoId);
      disponibilidad = await disponibilidad.save();
    });

  } catch (error) {
    console.log(error.toString())
  }

}

module.exports.removeIngreso = async function (productosIngresados, almacenId, ingresoId) {
  try {
    const Disponibilidad = require('./disponibilidad');

    productosIngresados.forEach(async (productoIngresado) => {

      let productoId = productoIngresado.producto;
      let qty = productoIngresado.qty;

      let queryA = { 'producto': productoId }
      let disponibilidad = await this.findOne(queryA)
      disponibilidad.dispoAlmacen.forEach(dispoAlmacen => {
        if (dispoAlmacen.almacen.toString() == almacenId) {
          dispoAlmacen.qty -= qty;
          return;
        }
      });
      disponibilidad.qtyDisponible -= qty
      let i = 0;
      disponibilidad.ingresos.forEach(ingreso => {
        if (ingreso.toString() == ingresoId) {
          disponibilidad.ingresos.splice(i, 1)
          return;
        }
        i++
      });
      disponibilidad = await disponibilidad.save();
    });
  } catch (error) {
    console.log(error.toString())
  }

}

module.exports.bloquearProductos = async function (productosPedidos, pedidoId) {
  try {


    productosPedidos.forEach(async (pedido) => {

      let productoId = pedido.producto;
      let qty = pedido.qty;

      let queryA = { 'producto': productoId }
      let disponibilidad = await this.findOne(queryA)

      disponibilidad.qtyDisponible -= qty;
      disponibilidad.qtyBloqueada += qty;
      disponibilidad.pedidos.push(pedidoId);
      disponibilidad = await disponibilidad.save();
    });

  } catch (error) {
    console.log(error.toString())
  }

}

module.exports.removePedido = async function (productosPedidos, pedidoId) {
  try {
    const Disponibilidad = require('./disponibilidad');

    productosPedidos.forEach(async (productoPedido) => {

      let productoId = productoPedido.producto;
      let qty = productoPedido.qty;

      let queryA = { 'producto': productoId }
      let disponibilidad = await this.findOne(queryA)

      disponibilidad.qtyDisponible += qty;
      disponibilidad.qtyBloqueada -= qty;
      let i = 0;
      disponibilidad.pedidos.forEach(pedido => {
        if (pedido.toString() == pedidoId) {
          disponibilidad.pedidos.splice(i, 1)
          return;
        }
        i++
      });
      disponibilidad = await disponibilidad.save();
    });
  } catch (error) {
    console.log(error.toString())
  }

}

module.exports.addAlmacen = async function (id) {
  try {
    //    let almacen = await Almacen.findOne({ '_id': element.almacen })

    let disponibilidades = await this.find({});
    disponibilidades.forEach(async (disponibilidad) => {
      let dispoAlmacen = {
        almacen: id,
        qty: 0,
      }
      disponibilidad.dispoAlmacen.push(dispoAlmacen)
      await disponibilidad.save();
    });

  } catch (error) {
    console.log(error.toString())
  }

}

module.exports.removeAlmacen = async function (id) {
  try {
    //    let almacen = await Almacen.findOne({ '_id': element.almacen })

    let disponibilidades = await this.find({});

    disponibilidades.forEach(async (disponibilidad) => {
      let i = 0
      disponibilidad.dispoAlmacen.forEach(item => {
        if (item.almacen == id) {
          disponibilidad.dispoAlmacen.splice(i, 1);
          return;
        }
        i++;
      });
      await disponibilidad.save();
    });

  } catch (error) {
    console.log(error.toString())
  }

}

module.exports.createRef = async function (element) {
  try {
    // doc will be the removed Person document

    let dispoAlmacen = element.dispoAlmacen
    dispoAlmacen.forEach(async (item) => {
      let almacen = await Almacen.findOne({ '_id': item.almacen })
      let disponibilidad = element._id
      almacen.disponibilidades.push(disponibilidad);
      await almacen.save();
    });

  } catch (error) {

  }

}


module.exports.removeRef = async function (element) {
  try {
    // doc will be the removed Person document
    let almacenes = await Almacen.find({})
    let disponibilidadId = element._id
    almacenes.forEach(async (almacen) => {
      let i = 0;
      almacen.disponibilidades.forEach(item => {
        if (item == disponibilidadId) {
          almacen.disponibilidades.splice(i, 1)
          return;
        }
        i++;
      });
      await almacen.save();
    });

  } catch (error) {

  }

}



module.exports.deleteDisponibilidad = async function (id) {
  try {
    const query = { "_id": id };
    let disponibilidad = await this.findOne(query);
    await this.removeRef(disponibilidad);
    let deleteRes = await disponibilidad.remove();
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

module.exports.addDisponibilidad = async function (newDisponibilidad) {
  try {
    await this.createRef(newDisponibilidad);
    let disponibilidad = await newDisponibilidad.save()
    //    await elementAdded(disponibilidad);
    /*     .populate({ path: 'almacen', select: 'disponibilidades' });
        .populate({ path: 'producto', select: 'disponibilidades' }); */

    /*     let almacen = disponibilidad.almacen;
        almacen.disponibilidad.push(disponibilidad._id)
        almacen = almacen.save();
        producto.disponibilidad.push(disponibilidad._id)
        producto = producto.save();
     *///    disponibilidad = disponibilidad.save();
    let response = {
      status: true,
      values: disponibilidad
    }
    return response;
  } catch (error) {
    console.log(error.toString())
    let response = {
      status: false,
      msg: error.toString().replace("Error: ", "")
    }
    return response
  }
}

module.exports.getDisponibilidades = async function () {
  try {
    const query = {};
    let disponibilidades = await this.find(query)
    let response = {
      status: true,
      values: disponibilidades
    }
    return response;
  } catch (error) { throw error; }
}
module.exports.getDisponibilidad = async function (id) {
  try {
    const query = { '_id': id };
    let disponibilidad = await this.findOne(query)
    let response = {
      status: true,
      values: disponibilidad
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
module.exports.updateDisponibilidad = async function (data) {
  try {
    const query = { '_id': data.id }
    let disponibilidad = await this.findOne(query);
    disponibilidad.name = data.name;
    disponibilidad.code = data.code;
    disponibilidad = await disponibilidad.save();
    let response = {
      status: true,
      values: disponibilidad
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