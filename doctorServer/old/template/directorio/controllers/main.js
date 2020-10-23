const Cliente = require('../models/cliente');
const Proveedor = require('../models/proveedor');
const contabilidadHandler = require('../../contabilidad/controllers/main').mainHandler

const mainHandler = {
    createCuentaPorPagar: async function (proveedor) {
        try {
            let id = await contabilidadHandler.createCuentaPorPagarDeProveedor(proveedor);
            return id;
        } catch (error) {
            console.log(error.toString())
        }

    },
    createCuentaPorCobrar: async function (cliente) {
        try {
            let id = await contabilidadHandler.createCuentaPorCobrarDeCliente(cliente);
            return id;
        } catch (error) {
            console.log(error.toString())
        }

    },
    deleteCuentaPorPagar: async function (proveedor) {
        try {

            await contabilidadHandler.deleteCuentaPorPagarDeProveedor(proveedor);
        } catch (error) {
            console.log(error.toString())
        }

    },
    deleteCuentaPorCobrar: async function (cliente) {
        try {

            await contabilidadHandler.deleteCuentaPorCobrarDeCliente(cliente);
        } catch (error) {
            console.log(error.toString())
        }

    },
}

const clienteHandler = {
    deleteCliente: async function (id) {
        try {
            let response = await this.getClienteById(id)
            let cliente = response.values;
            let deleteRes = await cliente.remove();
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



    addCliente: async function (cliente) {
        try {
            let noAplica = false;
            if (cliente.rif == "NO APLICA") {
                noAplica = true;
            }
            let auxC = await this.getClienteByRif(cliente.rif)
            let aux = auxC.values;

            if (aux && !noAplica) {
                throw new Error('Rif de cliente ya registrado')
            } else {
                let newCliente = new Cliente(cliente);
                let ctaPorCobrarId = await mainHandler.createCuentaPorCobrar(newCliente);
                newCliente.ctaPorCobrar = ctaPorCobrarId;
                newCliente = await newCliente.save();
                let response = {
                    status: true,
                    values: newCliente
                }
                return response;
            }
        } catch (error) {
            let response = {
                status: false,
                msg: error.toString().replace("Error: ", "")
            }
            return response
        }
    },

    getClientes: async function () {
        try {
            const query = {};
            let clientes = await Cliente.find(query);
            let response = {
                status: true,
                values: clientes
            }
            return response;
        } catch (error) { throw error; }
    },
    getClienteById: async function (id) {
        try {
            const query = { '_id': id };
            let cliente = await Cliente.findOne(query)
            let response = {
                status: true,
                values: cliente
            }
            return response;
        } catch (error) { throw error; }
    },
    getClienteByRif: async function (rif) {
        try {
            const query = { 'rif': rif };
            let cliente = await Cliente.findOne(query)
            let response = {
                status: true,
                values: cliente
            }
            return response;
        } catch (error) { throw error; }
    },
    updateCliente: async function (data) {
        try {
            let response = await this.getClienteById(id)
            let cliente = response.values;

            cliente.name = data.name;
            cliente.address = data.address;
            cliente.ws = data.ws;
            cliente.ig = data.ig;
            cliente.mail = data.mail;
            cliente.rif = data.rif;
            cliente = await cliente.save();
            let response = {
                status: true,
                values: cliente
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

const proveedorHandler = {


    deleteProveedor: async function (id) {
        try {
            let response = await this.getProveedorById(id)
            let proveedor = response.values;

            let deleteRes = await proveedor.remove();

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

    addProveedor: async function (proveedor) {
        try {
            let noAplica = false;
            if (proveedor.rif == "NO APLICA") {
                noAplica = true;
            }
            let auxC = await this.getProveedorByRif(proveedor.rif)
            let aux = auxC.values;

            if (aux && !noAplica) {
                throw new Error('Rif de proveedor ya registrado')
            } else {
                let newProveedor = new Cliente(proveedor);

                let ctaPorPagarId = await mainHandler.createCuentaPorPaga(newProveedor);
                newProveedor.ctaPorPagar = ctaPorPagarId;
                newProveedor = await newProveedor.save();
                let response = {
                    status: true,
                    values: newProveedor
                }
                return response;
            }
        } catch (error) {
            let response = {
                status: false,
                msg: error.toString().replace("Error: ", "")
            }
            return response
        }
    },

    getProveedores: async function () {
        try {
            const query = {};
            let proveedors = await Proveedor.find(query)
            let response = {
                status: true,
                values: proveedors
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
    getProveedorById: async function (id) {
        try {
            const query = { '_id': id };
            let proveedor = await Proveedor.findOne(query)
            let response = {
                status: true,
                values: proveedor
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
    getProveedorByRif: async function (rif) {
        try {
            const query = { 'rif': rif };
            let proveedor = await Proveedor.findOne(query)
            let response = {
                status: true,
                values: proveedor
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

    updateProveedor: async function (id, data) {
        try {
            let response = await this.getProveedorById(id)
            let proveedor = response.values;
            proveedor.name = data.name;
            proveedor.address = data.address;
            proveedor.ws = data.ws;
            proveedor.ig = data.ig;
            proveedor.mail = data.mail;
            proveedor.rif = data.rif;
            proveedor = await proveedor.save();
            let response = {
                status: true,
                values: proveedor
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

const inventarioCtrl = {
    mainHandler,
    clienteHandler,
    proveedorHandler
}

module.exports = inventarioCtrl
