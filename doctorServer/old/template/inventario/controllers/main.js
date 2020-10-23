const Disponibilidad = require('../models/disponibilidad');
const Almacen = require('../models/almacen');
const Producto = require('../models/producto');
const Precio = require('../models/precio');

const mainHandler = {
    agregarProductos: async function (productosIngresados, almacenId, ingresoId) {
        try {


            productosIngresados.forEach(async (ingreso) => {

                let productoId = ingreso.producto;
                let qty = ingreso.qty;

                let response = await disponibilidadHandler.getDisponibilidadByProduct(productoId)
                let disponibilidad = response.values;
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

    },

    egresarProductos: async function (productosEgresados, almacenId, ingresoId) {
        try {


            productosEgresados.forEach(async (egreso) => {

                let productoId = egreso.producto;
                let qty = ingreso.qty;

                let response = await disponibilidadHandler.getDisponibilidadByProduct(productoId)
                let disponibilidad = response.values;
                disponibilidad.qtyBloqueada -= qty;
                disponibilidad.dispoAlmacen.forEach(dispoAlmacen => {
                    if (dispoAlmacen.almacen.toString() == almacenId) {
                        dispoAlmacen.qty -= qty;
                        return;
                    }
                });
                disponibilidad.ingresos.push(ingresoId);
                disponibilidad = await disponibilidad.save();
            });

        } catch (error) {
            console.log(error.toString())
        }

    },

    removeIngreso: async function (productosIngresados, almacenId, ingresoId) {
        try {

            productosIngresados.forEach(async (productoIngresado) => {

                let productoId = productoIngresado.producto;
                let qty = productoIngresado.qty;

                let response = await disponibilidadHandler.getDisponibilidadByProduct(productoId)
                let disponibilidad = response.values;
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

    },

    bloquearProductos: async function (productosPedidos, pedidoId) {
        try {


            productosPedidos.forEach(async (pedido) => {

                let productoId = pedido.producto;
                let qty = pedido.qty;

                let response = await disponibilidadHandler.getDisponibilidadByProduct(productoId)
                let disponibilidad = response.values;


                disponibilidad.qtyDisponible -= qty;
                disponibilidad.qtyBloqueada += qty;
                disponibilidad.pedidos.push(pedidoId);
                disponibilidad = await disponibilidad.save();
            });

        } catch (error) {
            console.log(error.toString())
        }

    },

    removePedido: async function (productosPedidos, pedidoId) {
        try {
            productosPedidos.forEach(async (productoPedido) => {

                let productoId = productoPedido.producto;
                let qty = productoPedido.qty;

                let response = await disponibilidadHandler.getDisponibilidadByProduct(productoId)
                let disponibilidad = response.values;

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

    },

    addAlmacenToDisponibilidad: async function (id) {
        try {
            //    let almacen = await Almacen.findOne({ '_id': element.almacen })

            let response = await disponibilidadHandler.getDisponibilidades();
            let disponibilidades = response.values;
            let aux = [];
            disponibilidades.forEach(async (disponibilidad) => {
                let dispoAlmacen = {
                    almacen: id,
                    qty: 0,
                }
                disponibilidad.dispoAlmacen.push(dispoAlmacen)
                await disponibilidad.save();
                aux.push(disponibilidad._id)
            });
            return aux;

        } catch (error) {
            console.log(error.toString())
        }

    },

    removeAlmacenFromDisponibilidad: async function (id) {
        try {
            //    let almacen = await Almacen.findOne({ '_id': element.almacen })

            let response = await disponibilidadHandler.getDisponibilidades();
            let disponibilidades = response.values;
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

    },

    addDisponibilidadToAlmacen: async function (element) {
        try {
            // doc will be the removed Person document

            let dispoAlmacen = element.dispoAlmacen
            dispoAlmacen.forEach(async (item) => {
                let almacen = await almacenHandler.getAlmacenById({ '_id': item.almacen })
                let disponibilidad = element._id
                almacen.disponibilidades.push(disponibilidad);
                await almacen.save();
            });

        } catch (error) {

        }

    },


    removeDisponibilidadFromAlmacen: async function (element) {
        try {
            // doc will be the removed Person document
            let almacenes = await almacenHandler.getAlmacenes({})
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

    },

    createProductDisponibilidades: async function (element) {
        try {

            let productoId = element._id;
            let responseD = await disponiblidadHandler.getDisponibilidadByProduct(productoId);
            let dispoAux = responseD.values;
            let responseP = await precioHandler.getPrecioByProduct(productId)
            let precioAux = responseP.values;

            let disponibilidadId;
            let precioId;
            let response;

            if (!dispoAux) {

                let dispoAlmacen = [];
                let responseA = await almacenHandler.getAlmacenes({});
                let almacenes = responseA.values
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
                response = await disponibilidadHandler.addDisponibilidad(disponibilidad);
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
                response = await precioHandler.addPrecio(precio);
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

    },


    removeProductDisponibilidades: async function (element) {
        try {

            let disponibilidadId = element.disponibilidad
            let precioId = element.precio

            let deleteRes = await Disponibilidad.deleteDisponibilidad(disponibilidadId)
            deleteRes = await Precio.deletePrecio(precioId)

        } catch (error) {
            console.log(error.toString())
        }

    },


}

const almacenHandler = {


    deleteAlmacen: async function (id) {
        try {
            let response = await this.getAlmacenById(id);
            let almacen = response.values;
            await mainHandler.removeAlmacenFromDisponibilidad(almacen._id);
            let deleteRes = almacen.remove();
            response = {
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
    },

    addAlmacen: async function (element) {
        try {
            const query = { 'code': element.code };
            let response = await this.getAlmacenByCode(query)
            let almacen = response.values
            if (almacen) {
                throw new Error('Código de almacen ya registrado');
            }

            let newAlmacen = new Almacen(element);
            let disponibilidades = await mainHandler.addAlmacenToDisponibilidad(newAlmacen._id)
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
    },

    getAlmacenes: async function () {
        try {
            const query = {};
            let almacens = await Almacen.find(query)
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
    },
    getAlmacenById: async function (id) {
        try {
            const query = { "_id": id };
            let almacen = await Almacen.findOne(query)
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
    },

    getAlmacenByCode: async function (code) {
        try {
            const query = { 'code': code };
            let almacen = await Almacen.findOne(query)
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
    },

    updateAlmacen: async function (id, data) {
        try {
            let almacen = await this.getAlmacenById(id);
            almacen.code = data.code;
            almacen.state = data.state;
            almacen.city = data.city;
            almacen.address = data.adress;
            almacen = await almacen.save();
            response = {
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
}
const disponibilidadHandler = {

    deleteDisponibilidad: async function (id) {
        try {
            let response = await this.getDisponibilidadById(id);
            let disponibilidad = response.values;
            await mainHandler.removeDisponibilidadFromAlmacen(disponibilidad);
            let deleteRes = await disponibilidad.remove();
            response = {
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
    },

    addDisponibilidad: async function (element) {
        try {
            let newDisponibilidad = new Disponibilidad(element);
            await mainHandler.addDisponibilidadToAlmacen(newDisponibilidad);
            let disponibilidad = await newDisponibilidad.save()
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
    },

    getDisponibilidades: async function () {
        try {
            const query = {};
            let disponibilidades = await Disponibilidad.find(query)
            let response = {
                status: true,
                values: disponibilidades
            }
            return response;
        } catch (error) { throw error; }
    },

    getDisponibilidadByProduct: async function (id) {
        try {
            let query = { 'producto': id }
            let disponibilidad = await Disponibilidad.findOne(query)
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
    },

    getDisponibilidadById: async function (id) {
        try {
            let query = { '_id': id }
            let disponibilidad = await Disponibilidad.findOne(query)
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
    },

    updateDisponibilidad: async function (id, data) {
        try {
            let disponibilidad = await this.getDisponibilidadById(id)
            disponibilidad.name = data.name;
            disponibilidad.code = data.code;
            disponibilidad = await disponibilidad.save();
            response = {
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
    },

}
const productoHandler = {



    deleteProducto: async function (id) {
        try {
            let response = await this.getProductoById(id);
            let producto = response.values;
            await this.removeProductDisponibilidades(producto)
            let deleteRes = await producto.remove();

            response = {
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
    },

    addProducto: async function (element) {
        try {

            let response = await this.getProductoByCode(element.code)
            let producto = response.values;
            if (producto) {
                throw new Error('Código de producto ya registrado');
            }
            let ref = await mainHandler.createProductDisponibilidades(newProducto);
            let newProducto = new Producto(element);
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
    },

    getProductos: async function () {
        try {
            const query = {};
            let productos = await Producto.find(query)
                .populate('disponibilidad')
                .populate('precio')
            let response = {
                status: true,
                values: productos
            }
            return response;
        } catch (error) { throw error; }
    },
    getProductoById: async function (id) {
        try {
            const query = { '_id': id };
            let producto = await Producto.findOne(query)
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
    },
    getProductoByCode: async function (code) {
        try {
            const query = { 'code': code };
            let producto = await Producto.findOne(query)
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
    },
    updateProducto: async function (id, data) {
        try {
            let response = await this.getProductoById(id)
            let producto = response.values;
            producto.name = data.name;
            producto.code = data.code;
            producto.brand = data.brand;
            producto = await producto.save();
            response = {
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
}

const precioHandler = {


    deletePrecio: async function (id) {
        try {

            let response = await this.getPrecioById(id);

            let precio = response.values;
            let deleteRes = precio.remove();
            response = {
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
    },

    addPrecio: async function (element) {
        try {

            let response = await this.getPrecioByProduct(element.producto);

            let precio = response.values;
            if (precio) {
                throw new Error('Precio ya registrado');
            }

            let newPrecio = new Precio(element);
            precio = await newPrecio.save()

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
    },

    getPrecios: async function () {
        try {
            const query = {};
            let precios = await Precio.find(query)
                .populate('producto');
            let response = {
                status: true,
                values: precios
            }
            return response;
        } catch (error) { throw error; }
    },
    getPrecioById: async function (id) {
        try {
            const query = { '_id': id };
            let precio = await Precio.findOne(query)
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
    },
    getPrecioByProduct: async function (id) {
        try {
            const query = { 'producto': id };
            let precio = await Precio.findOne(query)
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
    },
    updatePrecio: async function (id, data) {
        try {
            let response = await this.getPrecioById(id);

            let precio = response.values;
            precio.valor = data.valor;
            precio = await precio.save();
            response = {
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
    },
}
const inventarioCtrl = {
    mainHandler,
    almacenHandler,
    disponibilidadHandler,
    productoHandler,
    precioHandler
}

module.exports = inventarioCtrl
