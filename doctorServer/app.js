const db = require('./database');
const landingServer = require('./landingServer');
const userServer = require('./userServer');
const generalServer = require('./generalServer');
const deliveryServer = require('./deliveryServer');
const doctorsServer = require('./doctorServer');
const tiendasServer = require('./tiendaServer');
const path = require('path');

/* 
const webListenerPort = 4300;
const webFolder = './public/samaFront';
const webPath = webFolder + '/index.html';
const webApp = webListener.init(webFolder, webListenerPort);

// webApp.get('/', (req, res) => {
// 	res.send('We are having some troubles, please come back in a while!');
// });

// 	//Pointing to angular app
// webApp.get('/*', (req,res) => {
// 	var fileToSend = path.join(__dirname, webPath);
// 	res.sendFile(fileToSend);
// });

webApp.listen(webListenerPort, () => {
    console.log('Web Listener running at: ' + webListenerPort);
}); */

/* 
const userFolder = './public/doctorApp';
const userPath = userFolder + '/index.html'; */
const userPort = 5740;
const userApp = userServer.init(userPort);

userApp.get('/', (req, res) => {
	res.send('We are having some troubles, please come back in a while!');
});

userApp.listen(userPort, () => {
	console.log('User Server running at: ' + userPort);
});

const generalPort = 6200;
const generalApp = generalServer.init(generalPort);

generalApp.get('/', (req, res) => {
	res.send('We are having some troubles, please come back in a while!');
});

generalApp.listen(generalPort, () => {
	console.log('General Server running at: ' + generalPort);
});

const deliveryPort = 6400;
const deliveryApp = deliveryServer.init(deliveryPort);

deliveryApp.get('/', (req, res) => {
	res.send('We are having some troubles, please come back in a while!');
});

deliveryApp.listen(deliveryPort, () => {
	console.log('Delivery Server running at: ' + deliveryPort);
});

const doctorsPort = 6600;
const doctorsApp = doctorsServer.init(doctorsPort);

doctorsApp.get('/', (req, res) => {
	res.send('We are having some troubles, please come back in a while!');
});

doctorsApp.listen(doctorsPort, () => {
	console.log('Doctors Server running at: ' + doctorsPort);
});

const tiendasPort = 6800;
const tiendasApp = generalServer.init(tiendasPort);

tiendasApp.get('/', (req, res) => {
	res.send('We are having some troubles, please come back in a while!');
});

tiendasApp.listen(tiendasPort, () => {
	console.log('Tiendas Server running at: ' + tiendasPort);
});
