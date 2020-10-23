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

const users = require('./tienda/routes/users');
const mails = require('./tienda/routes/mails');
const auth = require('./tienda/routes/auth');
const personas = require('./tienda/routes/personas');
const roles = require('./tienda/routes/roles');
const ubicaciones = require('./tienda/routes/ubicaciones');

module.exports.init = function (folder, port) {
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

    app.use(express.static(path.join(__dirname, folder)));

    //Adding routes

    app.use('/users', users);
    app.use('/mails', mails);
    app.use('/auth', auth);
    app.use('/personas', personas);
    app.use('/roles', roles);
    app.use('/ubicaciones', ubicaciones);

    return app
}
