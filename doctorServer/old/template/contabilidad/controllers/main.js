const Ctaporcobrar = require('../models/ctaporcobrar');
const Ctaporpagar = require('../models/ctaporpagar');
const MovimientoDiario = require('../models/movimientodiario');
const CuentaT = require('../models/cuentat');
const finanzasHandler = require('../../finanzas/controllers/main').mainHandler
const spawn = require("child_process").spawn;

const mainHandler = {


    createCuentaPorPagarDeProveedor: async function (proveedor) {
        try {

            const ctaT = {
                name: `Cuenta por pagar ${proveedor.name}`,
                balance: 0,
                clasificacion: "Pasivo",
                naturaleza: "Haber",
                descripcion: `Cuenta por pagar correspondiente al proveedor ${proveedor.name}`,
            };

            let newCtaT = await ctaTHandler.addCuentaT(ctaT);

            let ctaTId = newCtaT._id;
            let proveedorId = proveedor._id;

            let ctaPorPagar = {
                proveedor: proveedorId,
                ctaTId: ctaTId
            }

            let newCtaPorPagar = await ctaPorPagarHandler(ctaPorPagar);

            return newCtaPorPagar._id;

        } catch (error) {
            console.log(error.toString())
        }

    },
    createCuentaPorCobrarDeCliente: async function (cliente) {
        try {

            const ctaT = {
                name: `Cuenta por cobrar ${cliente.name}`,
                balance: 0,
                clasificacion: "Activo",
                naturaleza: "Debe",
                descripcion: `Cuenta por cobrar correspondiente al cliente ${cliente.name}`,
            };

            let newCtaT = await ctaTHandler.addCuentaT(ctaT);

            let ctaTId = newCtaT._id;
            let clienteId = cliente._id;

            let ctaPorPagar = {
                cliente: clienteId,
                ctaTId: ctaTId
            }

            let newCtaPorPagar = await ctaPorCobrarHandler(ctaPorPagar);

            return newCtaPorPagar._id;

        } catch (error) {
            console.log(error.toString())
        }

    },
    deleteCuentaPorPagarDeProveedor: async function (proveedor) {
        try {

        } catch (error) {
            console.log(error.toString())
        }

    },
    deleteCuentaPorCobrarDeCliente: async function (cliente) {
        try {

        } catch (error) {
            console.log(error.toString())
        }

    },
    aumentarDisponibilidad: async function (move) {
        try {
            let results = await finanzasHandler.aumentarDisponibilidad(move)
        } catch (error) {
            console.log(error.toString())

        }
    },
    disminuirDisponibilidad: async function (move) {
        try {
            let results = await finanzasHandler.disminuirDisponibilidad(move)
        } catch (error) {
            console.log(error.toString())

        }
    },

    aumentarCuentaT: async function (move) {
        try {
            const cId = movimiento.cuentaT;

            let query = { '_id': bId }
            let response = ctaTHandler.getCuentaTById(cId)
            let ctaT = response.values;
            let balance = ctaT.balance;
            let montoMovimiento = movimiento.monto;

            const pytonPath = "./python/aumentarbalance.py";

            const options = [pythonPath, balance, montoMovimiento];

            const process = spawn('python', options);

            var disminuirData;

            process.stdout.on('data', async (data) => {
                disminuirData = data.toString();
            });

            process.on('close', async (code) => {
                dispo.montoDisponible = disminuirData.disponibilidespues;
                dispo.movimientos.push(movimiento._id)
                await dispo.save();
                return {
                    success: true,
                    msg: disminuirData
                };
            });
        } catch (error) {
            console.log(error.toString())
        }
    },

    disminuirCuentaT: async function (move) {
        try {
            const cId = movimiento.cuentaT;

            let query = { '_id': bId }
            let response = ctaTHandler.getCuentaTById(cId)
            let ctaT = response.values;
            let balance = ctaT.balance;
            let montoMovimiento = movimiento.monto;

            const pytonPath = "./python/disminuirbalance.py";

            const options = [pythonPath, balance, montoMovimiento];

            const process = spawn('python', options);

            var disminuirData;

            process.stdout.on('data', async (data) => {
                disminuirData = data.toString();
            });

            process.on('close', async (code) => {
                dispo.montoDisponible = disminuirData.disponibilidespues;
                dispo.movimientos.push(movimiento._id)
                await dispo.save();
                return {
                    success: true,
                    msg: disminuirData
                };
            });
        } catch (error) {
            console.log(error.toString())
        }
    },

    addProformaToCtaPorCobrar: async function (cliente, cobro) {
        try {
            let response = await ctaPorCobrarHandler.getCtaporcobrarByCliente(cliente);
            let ctaporcobrar = response.values;
            ctaporcobrar.cobros.push(cobro);
            ctaporcobrar = await ctaporcobrar.save();
        } catch (error) {

            console.log(error.toString())
        }
    },

    removeProformaFromCtaPorCobrar: async function (element) {
        try {

        } catch (error) {

            console.log(error.toString())
        }
    },

    removeCtaTFromMovimientosDiarios: async function (element) {
        try {

        } catch (error) {

            console.log(error.toString())
        }
    },

    addCtaPorCobrarToCuentasT: async function (element) {
        try {
        } catch (error) {
            console.log(error.toString())
        }

    },

    removeCtaPorCobrarFromCuentasT: async function (element) {
        try {
        } catch (error) {
            console.log(error.toString())
        }

    },
    addCtaPorPagarToCuentasT: async function (element) {
        try {
        } catch (error) {
            console.log(error.toString())
        }

    },

    removeCtaPorPagarFromCuentasT: async function (element) {
        try {
        } catch (error) {
            console.log(error.toString())
        }

    },

}

const ctaTHandler = {

    deleteCuentaT: async function (id) {
        try {
            let response = this.getCtaTById(id);
            let cuentaT = response.values;
            await this.removeCtaTFromMovimientosDiarios(cuentaT);
            let deleteRes = await cuentaT.remove();
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

    addCuentaT: async function (element) {
        try {
            let newCuentaT = new CuentaT(element)
            let cuentaT = await newCuentaT.save()

            let response = {
                status: true,
                values: cuentaT
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

    getCuentasT: async function () {
        try {
            let cuentasT = await CuentaT.find()
            let response = {
                status: true,
                values: cuentasT
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
    getCuentaTById: async function (id) {
        try {
            const query = { '_id': id };
            let cuentaT = await CuentaT.findOne(query)
            let response = {
                status: true,
                values: cuentaT
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
    updateCuentaT: async function (id, data) {
        try {
            let response = this.getCtaTById(id);
            let cuentaT = response.values;
            cuentaT.name = data.name;
            cuentaT = await cuentaT.save();
            response = {
                status: true,
                values: cuentaT
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

const ctaPorCobrarHandler = {


    deleteCtaporcobrar: async function (id) {
        try {
            let response = await this.getCtaporcobrarById(id);
            let ctaporcobrar = response.values
            await this.removeCtaPorCobrarFromCuentasT(ctaporcobrar);
            let deleteRes = await ctaporcobrar.remove();
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

    addCtaporcobrar: async function (element) {
        try {
            let newCtaporcobrar = new Ctaporcobrar(element);
            await this.addCtaPorCobrarToCuentasT(ctaporcobrar);
            let ctaporcobrar = await newCtaporcobrar.save();

            let response = {
                status: true,
                values: ctaporcobrar
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

    getCtasporcobrar: async function () {
        try {
            const query = {};
            let ctaporcobrars = await Ctaporcobrar.find(query)
            let response = {
                status: true,
                values: ctaporcobrars
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
    getCtaporcobrarById: async function (id) {
        try {
            const query = { '_id': id };
            let ctaporcobrar = await Ctaporcobrar.findOne(query)
            let response = {
                status: true,
                values: ctaporcobrar
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
    getCtaporcobrarByCliente: async function (id) {
        try {
            const query = { 'cliente': id };
            let ctaporcobrar = await Ctaporcobrar.findOne(query)
            let response = {
                status: true,
                values: ctaporcobrar
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
    updateCtaporcobrar: async function (id, data) {
        try {
            let response = await this.getCtaporcobrarById(id);
            let ctaporcobrar = response.values
            ctaporcobrar = await ctaporcobrar.save();
            response = {
                status: true,
                values: ctaporcobrar
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

const ctaPorPagarHandler = {


    deleteCtaporpagar: async function (id) {
        try {
            let response = await this.getCtaporpagarById(id);
            let ctaporpagar = response.values
            await this.removeCtaPorPagarFromCuentasT(ctaporpagar);
            let deleteRes = await ctaporpagar.remove();
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

    addCtaporpagar: async function (element) {
        try {
            let newCtaporpagar = new Ctaporpagar(element);
            await this.addCtaPorPagarToCuentasT(ctaporpagar);
            let ctaporpagar = await newCtaporpagar.save();

            let response = {
                status: true,
                values: ctaporpagar
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

    getCtasporpagar: async function () {
        try {
            const query = {};
            let ctaporpagars = await Ctaporpagar.find(query)
            let response = {
                status: true,
                values: ctaporpagars
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
    getCtaporpagarById: async function (id) {
        try {
            const query = { '_id': id };
            let ctaporpagar = await Ctaporpagar.findOne(query)
            let response = {
                status: true,
                values: ctaporpagar
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
    updateCtaporpagar: async function (id, data) {
        try {
            let response = await this.getCtaporpagarById(id);
            let ctaporpagar = response.values
            ctaporpagar = await ctaporpagar.save();
            response = {
                status: true,
                values: ctaporpagar
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

const movimientoDiarioHandler = {


    deleteMovimientoDiario: async function (id) {
        try {
            const query = { "_id": id };
            let response = await this.getMovimientoDiarioById(query);
            let movimientoDiario = response.values;

            let sign = newMovimientoDiario.signo
            if (sign == '+') {
                mainHandler.disminuirCuentaT(move)
                mainHandler.disminuirDisponibilidad(move)
            } else {
                mainHandler.aumentarCuentaT(move)
                mainHandler.aumentarDisponibilidad(move)
            }

            let deleteRes = await movimientoDiario.remove();
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

    addMovimientoDiario: async function (move) {
        try {
            let newMovimientoDiario = new MovimientoDiario(move)
            let sign = newMovimientoDiario.signo
            if (sign == '+') {
                await mainHandler.aumentarCuentaT(move)
                await mainHandler.aumentarDisponibilidad(move)
            } else {
                await mainHandler.disminuirCuentaT(move)
                await mainHandler.disminuirDisponibilidad(move)
            }
            let movimientoDiario = await newMovimientoDiario.save()

            let response = {
                status: true,
                values: movimientoDiario
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

    getMovimientosDiarios: async function () {
        try {
            const query = {};
            let movimientoDiarios = await MovimientoDiario.find(query)
            let response = {
                status: true,
                values: movimientoDiarios
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
    getMovimientosDiariosByBanco: async function (banco) {
        try {
            const query = { 'banco': banco };
            let movimientoDiarios = await MovimientoDiario.find(query)
            let response = {
                status: true,
                values: movimientoDiarios
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
    getMovimientosDiariosByCuentaT: async function (cuentat) {
        try {
            const query = { 'cuentaT': cuentat };
            let movimientoDiarios = await MovimientoDiario.find(query)
            let response = {
                status: true,
                values: movimientoDiarios
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
    getMovimientoDiarioById: async function (id) {
        try {
            const query = { '_id': id };
            let movimientoDiario = await MovimientoDiario.findOne(query)
            let response = {
                status: true,
                values: movimientoDiario
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
    getMovimientoDiarioByReferencia: async function (ref) {
        try {
            const query = { 'referencia': ref };
            let movimientoDiario = await MovimientoDiario.findOne(query)
            let response = {
                status: true,
                values: movimientoDiario
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
    updateMovimientoDiario: async function (id, data) {
        try {
            const query = { "_id": id };
            let response = await this.getMovimientoDiarioById(query);
            let movimientoDiario = response.values;

            movimientoDiario = await movimientoDiario.save();
            let response = {
                status: true,
                values: movimientoDiario
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


const contabilidadCtrl = {
    mainHandler,
    ctaTHandler,
    ctaPorCobrarHandler,
    ctaPorPagarHandler,
    movimientoDiarioHandler,
}

module.exports = contabilidadCtrl
