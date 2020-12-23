const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const cors = require('cors');
const passport = require('passport');
const compression = require('compression');
const config = require('./old/config/environment');
const cookieSess = require('cookie-session');
const helmet = require('helmet');
const RateLimit = require('express-rate-limit');
const app = express();

const citas = require('./medicos/routes/citas');
const doctores = require('./medicos/routes/doctores');
const especializaciones = require('./medicos/routes/especializaciones');
const hospitales = require('./medicos/routes/hospitales');
const medicamentos = require('./medicos/routes/medicamentos');
const ubicaciones = require('./medicos/routes/ubicaciones');

module.exports.init = function (port) {
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
        name: 'Samaven Session',
        secret: config.cSecret,
        maxAge: 7 * 24 * 60 * 60 * 1000 //A week
    }));

    app.use(helmet());

	/*	// Passport Middleware
	app.use(passport.initialize());
	app.use(passport.session());
	require('./config/passport')(passport);
	*/
    // Set Static Folder

    //app.use(express.static(path.join(__dirname, folder)));

    //Adding routes

    app.use('/citas', citas);
    app.use('/doctores', doctores);
    app.use('/especializaciones', especializaciones);
    app.use('/hospitales', hospitales);
    app.use('/medicamentos', medicamentos);
    app.use('/ubicaciones', ubicaciones);

    return app
}
