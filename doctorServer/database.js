const mysql = require('mysql');
const config = require('./old/config/environment');
var util = require('util');

//Database stuff
module.exports.init = function () {
    // Connect to Database
    const host = config.host;
    const mysqlPort = config.mysqlPort;
    const mysqlUser = config.mysqlUser;
    const mysqlPass = config.mysqlPass;
    const dbName = config.dbName;
    const connectionLimit = config.connectionLimit;
    var pool = mysql.createPool({
        host: host,
        connectionLimit: connectionLimit,
        port: mysqlPort,
        user: mysqlUser,
        password: mysqlPass,
        database: dbName
    });
    pool.query = util.promisify(pool.query)
    return pool;
};

module.exports.close = function (myDB) {

};

module.exports.queryDb = async function (query, data) {
    try {
        let myDB = this.init();
        let formatedQuery = mysql.format(query, data);
        let results = await myDB.query(formatedQuery);

        return results;
    } catch (e) {
        throw e
    }
};
