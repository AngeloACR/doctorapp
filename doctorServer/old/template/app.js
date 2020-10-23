const db = require('./database');
const path = require('path');
const localServer = require('./localServer');
const testServer = require('./localServer');

const connection = db.initConnect();


const localPort = 3400;
const localFolder = './public/invenapp';
const localPath = localFolder + '/index.html';
const localApp = localServer.init(localFolder, localPath, localPort);

localApp.listen(localPort, () => {
	console.log('Server running at: ' + localPort);
});

//const landingServer = require('./landingServer');
/* const landingPort = 6174;
const landingFolder = './public/invenLand';
const landingPath = landingFolder + '/index.html';
const landingApp = landingServer.init(landingFolder, landingPort);

 landingApp.get('/', (req, res) => {
	res.send('We are having some troubles, please come back in a while!');
});

//Pointing to angular app
landingApp.get('/*', (req, res) => {
	var fileToSend = path.join(__dirname, landingPath);
	res.sendFile(fileToSend);
})

landingApp.listen(landingPort, () => {
	console.log('Server running at: ' + landingPort);
}); */