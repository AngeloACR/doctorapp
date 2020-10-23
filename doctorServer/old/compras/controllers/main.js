const Compra = require('../models/compra');
const inventarioHandler = require('../../inventario/controllers/main').mainHandler

const mainHandler = {
    removeRef: async function (element) {
        try {
            let productosIngresados = element.productosIngresados;
            let almacenId = element.almacen;
            let compraId = element._id;
            await inventarioHandler.removeCompra(productosIngresados, almacenId, compraId)
        } catch (error) {
            throw error
        }

    },

    agregarProductos: async function (element) {
        try {

            let productosIngresados = element.productosIngresados;
            let almacenId = element.almacen;
            let compraId = element._id;

            await inventarioHandler.agregarProductos(productosIngresados, almacenId, compraId)

        } catch (error) {
            throw error
        }

    },

}

const compraHandler = {

    deleteCompra: async function (id) {
        try {
            let response = await this.getCompraById(id);
            let compra = response.values;
            await mainHandler.removeRef(compra);
            let deleteRes = await compra.remove();
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

    addCompra: async function (element) {
        try {
            let newCompra = new Compra(element);
            await mainHandler.agregarProductos(newCompra);
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
    },

    getCompras: async function () {
        try {
            const query = {};
            let compras = await Compra.find(query)
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
    },
    getCompraById: async function (id) {
        try {
            const query = { '_id': id };
            let compra = await Compra.findOne(query)
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
    },
    updateCompra: async function (id, data) {
        try {
            let response = await this.getCompraById(id);
            let compra = response.values;
            compra.name = data.name;
            compra.code = data.code;
            compra = await compra.save();
            response = {
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
}

const finanzasCtrl = {
    mainHandler,
    compraHandler,
}

module.exports = finanzasCtrl
