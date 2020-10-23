const Proforma = require('../models/proforma');
const Pedido = require('../models/pedido');
const inventarioHandler = require('../../inventario/controllers/main').mainHandler
const contabilidadHandler = require('../../contabilidad/controllers/main').contabilidadHandler

const mainHandler = {

    addProformaToCtaPorCobrar: async function (element) {
        try {
            let cliente = element.pedido.cliente;
            let cobro = {

                proforma: element._id,
                montoTotal: element.montoTotal,
                status: element.status
            }
            await contabilidadHandler.addProformaToCtaporcobrar(cliente, cobro);
        } catch (error) {

            console.log(error.toString())
        }
    },

    removeProformaFromCtaPorCobrar: async function (element) {
        try {
            await contabilidadHandler.removeProformaFromCtaPorCobrar(element.cliente, element._id)
        } catch (error) {

            console.log(error.toString())
        }
    },

    removePedidoFromDisponibilidad: async function (element) {
        try {
            let productosPedidos = element.productosPedidos;
            let pedidoId = element._id;
            await inventarioHandler.removePedido(productosPedidos, pedidoId)
        } catch (error) {
            throw error
        }

    },

    addProformaToPedido: async function (element) {
        try {
            let pedidoId = element.pedido
            let response = await pedidoHandler.getPedidoById(pedidoId);
            let pedido = response.values;
            pedido.proforma = element._id
            await pedido.save();
        } catch (error) {
            throw error
        }

    },
    removeProformaFromPedido: async function (element) {
        try {
            let pedidoId = element.pedido
            let response = await pedidoHandler.getPedidoById(pedidoId);
            let pedido = response.values;
            pedido.proforma = null
            await pedido.save();
        } catch (error) {
            throw error
        }

    },

    bloquearProductos: async function (element) {
        try {

            let productosPedidos = element.productosPedidos;
            let pedidoId = element._id;

            await inventarioHandler.bloquearProductos(productosPedidos, pedidoId)

        } catch (error) {
            throw error
        }

    },

    removeProformaAsociada: async function (element) {
        try {

            let proformaId = element.proforma;

            let response = await proformaHandler.deleteProforma(proforma);

        } catch (error) {
            throw error
        }

    },
}

const pedidoHandler = {



    deletePedido: async function (id) {
        try {
            let response = await this.getPedidoById(id);
            let pedido = response.values;
            await mainHandler.removePedidoFromDisponibilidad(pedido);
            await mainHandler.removeProformaAsociada(pedido);
            let deleteRes = await pedido.remove();
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

    addPedido: async function (element) {
        try {
            let newPedido = new Pedido(element);
            await mainHandler.bloquearProductos(newPedido);
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
    },

    getPedidos: async function () {
        try {
            const query = {};
            let pedidos = await Pedido.find(query)
                .populate('productosPedidos.producto')
                .populate('cliente')
                .populate('vendedor')
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
    },
    getPedidoById: async function (id) {
        try {
            const query = { '_id': id };
            let pedido = await Pedido.findOne(query)
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
    },
    updatePedido: async function (id, data) {
        try {
            let response = await this.getPedidoById(id);
            let pedido = response.values;
            pedido.name = data.name;
            pedido.code = data.code;
            pedido = await pedido.save();
            response = {
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
}

const proformaHandler = {

    deleteProforma: async function (id) {
        try {
            let response = await this.getProformaById(id);
            let proforma = response.values;
            await mainHandler.removeProformaFromPedido(proforma);
            let deleteRes = await proforma.remove();
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

    addProforma: async function (element) {
        try {
            let newProforma = new Proforma(element)
            await mainHandler.addProformaToPedido(newProforma);
            let proforma = await newProforma.save()

            let response = {
                status: true,
                values: proforma
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

    getProformas: async function () {
        try {
            const query = {};
            let proformas = await Proforma.find(query)
                .populate('productosAutorizados.producto')
                .populate('pedido')
                .populate('cliente')
            let response = {
                status: true,
                values: proformas
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
    getProformaById: async function (id) {
        try {
            const query = { '_id': id };
            let proforma = await Proforma.findOne(query)
            let response = {
                status: true,
                values: proforma
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
    updateProforma: async function (id, data) {
        try {
            let response = await this.getProformaById(id);
            let proforma = response.values;
            proforma.name = data.name;
            proforma.code = data.code;
            proforma = await proforma.save();
            response = {
                status: true,
                values: proforma
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


const ventasHandler = {
    mainHandler,
    proformaHandler,
    pedidoHandler
}

module.exports = ventasHandler;
