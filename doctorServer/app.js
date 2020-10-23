const db = require('./database');
const landingServer = require('./landingServer');
const userServer = require('./userServer');
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
const userPort = 5540;
const userApp = userServer.init(userFolder, userPort);

userApp.get('/', (req, res) => {
	res.send('We are having some troubles, please come back in a while!');
});

//Pointing to angular app
/* userApp.get('/*', (req, res) => {
	var fileToSend = path.join(__dirname, userPath);
	res.sendFile(fileToSend);
}); */

userApp.listen(userPort, () => {
	console.log('Server running at: ' + userPort);
});
