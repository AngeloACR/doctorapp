const db = require('./database');
const webListener = require('./webListener');
const localServer = require('./localServer');
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

const localPort = 3400;
const localFolder = './public/samaApp';
const localPath = localFolder + '/index.html';
const localApp = localServer.init(localFolder, localPort);

localApp.get('/', (req, res) => {
	res.send('We are having some troubles, please come back in a while!');
});

 	//Pointing to angular app
localApp.get('/*', (req,res) => {
	var fileToSend = path.join(__dirname, localPath);
	res.sendFile(fileToSend);
});

localApp.listen(localPort, () => {
    console.log('Server running at: ' + localPort);
});
