const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;
const Disponibilidad = require('./disponibilidad');
const Precio = require('./precio');
const Almacen = require('./almacen');

const productoSchema = new mongoose.Schema({
  disponibilidad: {
    type: Schema.Types.ObjectId,
    ref: 'Disponibilidad',
  },
  precio: {
    type: Schema.Types.ObjectId,
    ref: 'Precio',
  },
  name: {
    type: String,
  },
  description: {
    type: String,
  },
  code: {
    type: String,
  },
  brand: {
    type: String,
  }
})
//.post('save', createRef)

const Producto = module.exports = mongoose.model("Producto", productoSchema);

module.exports.createRef = async function (element) {
  try {

    let productoId = element._id;
    let query = { 'producto': productoId }
    let dispoAux = await Disponibilidad.findOne(query);
    let precioAux = await Precio.findOne(query)

    let disponibilidadId;
    let precioId;
    let response;

    if (!dispoAux) {

      let dispoAlmacen = [];
      let almacenes = await Almacen.find({});
      let aLength = almacenes.length;
      for (let i = 0; i < aLength; i++) {
        let almacenId = almacenes[i]._id;
        let aux = {
          almacen: almacenId,
          qty: 0,
        }
        dispoAlmacen.push(aux);
      }
      const disponibilidad = {
        producto: productoId,
        dispoAlmacen: dispoAlmacen,
        qtyDisponible: 0,
        qtyBloqueada: 0,
      }
      let newDisponibilidad = new Disponibilidad(disponibilidad);
      response = await Disponibilidad.addDisponibilidad(newDisponibilidad);
      if (response.status) {
        disponibilidadId = response.values._id;
      } else {
        throw new Error(response.msg)
      }
    }

    if (!precioAux) {

      const precio = {
        producto: productoId,
        valor: 0
      }
      let newPrecio = new Precio(precio);
      response = await Precio.addPrecio(newPrecio);
      if (response.status) {
        precioId = response.values._id;
      } else {
        throw new Error(response.msg)
      }

    }

    let value = {
      disponibilidad: disponibilidadId,
      precio: precioId
    }
    return value

  } catch (error) {
    console.log(error.toString())
  }

}


module.exports.removeLinkedDocuments = async function (element) {
  try {

    let disponibilidadId = element.disponibilidad
    let precioId = element.precio

    let deleteRes = await Disponibilidad.deleteDisponibilidad(disponibilidadId)
    deleteRes = await Precio.deletePrecio(precioId)

  } catch (error) {
    console.log(error.toString())
  }

}



module.exports.deleteProducto = async function (id) {
  try {
    const query = { "_id": id };
    let producto = await this.findOne(query);
    await this.removeLinkedDocuments(producto)
    let deleteRes = await producto.remove();

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

module.exports.addProducto = async function (newProducto) {
  try {

    const query = { 'code': newProducto.code };
    let producto = await this.findOne(query)
    if (producto) {
      throw new Error('Código de producto ya registrado');
    }
    let ref = await this.createRef(newProducto);
    newProducto.disponibilidad = ref.disponibilidad;
    newProducto.precio = ref.precio;

    producto = await newProducto.save();

    let response = {
      status: true,
      values: producto
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

module.exports.getProductos = async function () {
  try {
    const query = {};
    let productos = await this.find(query)
      .populate('disponibilidad')
      .populate('precio')
    let response = {
      status: true,
      values: productos
    }
    return response;
  } catch (error) { throw error; }
}
module.exports.getProducto = async function (id) {
  try {
    const query = { '_id': id };
    let producto = await this.findOne(query)
    let response = {
      status: true,
      values: producto
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
module.exports.updateProducto = async function (data) {
  try {
    const query = { '_id': data.id }
    let producto = await this.findOne(query);
    producto.name = data.name;
    producto.code = data.code;
    producto.brand = data.brand;
    producto = await producto.save();
    let response = {
      status: true,
      values: producto
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