const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const cors = require('cors');
const compression = require('compression');
const config = require('./config/environment');
const cookieSess = require('cookie-session');
const helmet = require('helmet');
const RateLimit = require('express-rate-limit');
const app = express();

const users = require('./users/routes/users');
const superadmins = require('./users/routes/superadmins');
const administradores = require('./users/routes/administradores');
const vendedores = require('./users/routes/vendedores');
const mails = require('./users/routes/mails');
const auth = require('./users/routes/auth');
const roles = require('./users/routes/roles');

const clientes = require('./directorio/routes/clientes');
const proveedores = require('./directorio/routes/proveedores');

const productos = require('./inventario/routes/productos');
const precios = require('./inventario/routes/precios');
const almacenes = require('./inventario/routes/almacenes');

const compras = require('./compras/routes/compras');

const pedidos = require('./ventas/routes/pedidos');
const proformas = require('./ventas/routes/proformas');

const bancos = require('./finanzas/routes/bancos');

const ctasporcobrar = require('./contabilidad/routes/ctasporcobrar');
const ctasporpagar = require('./contabilidad/routes/ctasporpagar');
const ctast = require('./contabilidad/routes/cuentast');
const movimientosdiarios = require('./contabilidad/routes/movimientosdiarios');

const correlativos = require('./general/routes/correlativos');
const company = require('./general/routes/company');

module.exports.init = function (folder, thePath, port) {
    app.set('port', (port));

    // Middlewares initialization

    // app.enable('trust proxy'); // only if you're behind a reverse proxy (Heroku, Bluemix, AWS if you use an ELB, custom Nginx setup, etc) 
    /* 
    var limiter = new RateLimit({
      windowMs: 15*60*1000, // 15 minutes 
      max: 50, // limit each IP to 50 requests per windowMs 
      delayMs: 0 // disable delaying - full speed until the max limit is reached 
    });
     
    //  apply to all requests 
    app.use(limiter);*/

    //App compression
    app.use(compression());

    // Cors Middleware
    app.use(cors());

    // Body Parser Middleware
    app.use(bodyParser.json());

    //Cookie session Middleware
    app.use(cookieSess({
        name: 'panaSess',
        secret: config.cSecret,
        httpOnly: true,
        maxAge: 7 * 24 * 60 * 60 * 1000 //A week
    }));

    app.use(helmet());

    // Set Static Folder

    app.use(express.static(path.join(__dirname, folder)));

    //Adding routes

    app.use('/users', users);
    app.use('/roles', roles);
    app.use('/vendedores', vendedores);
    app.use('/administradores', administradores);
    app.use('/clientes', clientes);
    app.use('/proveedores', proveedores);
    app.use('/mails', mails);
    app.use('/pedidos', pedidos);
    app.use('/compras', compras);
    app.use('/company', company);
    app.use('/correlativos', correlativos);
    app.use('/auth', auth);
    app.use('/superadmins', superadmins);
    app.use('/productos', productos);
    app.use('/precios', precios);
    app.use('/almacenes', almacenes);
    app.use('/proformas', proformas);
    app.use('/bancos', bancos);
    app.use('/cuentasporcobrar', ctasporcobrar);
    app.use('/cuentasporpagar', ctasporpagar);
    app.use('/cuentast', ctast);
    app.use('/movimientosdiarios', movimientosdiarios);

    app.get('/', (req, res) => {
        res.send('We are having some troubles, please come back in a while!');
    });

    //Pointing to angular app
    app.get('/*', (req, res) => {
        var fileToSend = path.join(__dirname, thePath);
        res.sendFile(fileToSend);
    });

    return app
}