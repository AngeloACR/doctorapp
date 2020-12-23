const environment = require('../../config/environment');
let tables = require('../model/name')

parser = function (tablename, element) {
    let table = tables[tablename];
    let parsedElement = {};
    let keys = Object.keys(element);
    let aux = []
    keys.forEach(key => {
        let name = ''
        if (key == "reference") {
            name = key;
            let reference = {
                key: table[element[key].key],
                value: element[key]
            };
            parsedElement[name] = reference;
        } else {
            name = table[key]
            parsedElement[name] = element[key]
        }
    });
    return parsedElement;

}

fixQuery = function (action, table) {

    let queryData = [table];
    let query = `${action} ??`;
    let response = {
        query,
        queryData
    }
    return response;
}

/*
*   Fix query works for Select, Update, Insert, Delete. More complex querys will require a bit more of work
*
*
*   We will that data has an element named reference, like this:
*      let data = {
*           ...
*           ...
*           ...
*           reference: {
*               key: keyname,
*               value: value
*           }
*
*       }
*
*/
fixQuery = function (action, table, data) {

    let queryData = [table];
    let keys = Object.keys(data);
    let queryKeys = '';
    let queryValues = '';
    let query = '';
    let dataLength = keys.length
    let i = 0;
    switch (action) {
        case "UPDATE":
            queryKeys = 'SET ';
            queryValues = 'WHERE ?? = ?'
            let referenceAtEnd = true;
            keys.forEach(key => {
                if (key == 'reference' && i != dataLength - 1) {
                    referenceAtEnd = false;

                }
                if ((i == dataLength - 1 && !referenceAtEnd) || (i == dataLength - 2 && referenceAtEnd)) {
                    queryKeys, concat(`?? = ?`)
                } else {
                    queryKeys, concat(`?? = ?, `)
                }

                if (key == "reference") {
                    queryData.push(data[key].key)
                    queryData.push(data[key].value);

                } else {
                    queryData.push(key)
                    queryData.push(data[key]);
                }
                i++;
            });
            query = `${action} ?? ${queryKeys} ${queryValues}`;
            break;
        case "INSERT INTO":
            queryKeys = '(';
            queryValues = 'VALUES (';
            keys.forEach(key => {
                if (i == dataLength - 1) {
                    queryKeys, concat(`${key})`)
                    queryValues, concat(`${data[key]})`)

                } else {
                    queryKeys, concat(`${key}, `)
                    queryValues, concat(`${data[key]}, `)
                }
                queryData.push(key)
                aux.push(data[key]);
                i++
            });
            queryData.concat(aux);
            query = `${action} ?? ${queryKeys} VALUES ${queryValues}`;
            break;

        default:
            queryValues = 'WHERE ?? = ?'
            keys.forEach(key => {

                if (key == "reference") {
                    queryData.push(data[key].key)
                    queryData.push(data[key].value);

                } else {
                    queryData.push(key)
                    queryData.push(data[key]);
                }
                i++
            });
            query = `${action} ?? ${queryKeys} ${queryValues}`;
            break;
    }

    let response = {
        query,
        queryData
    }
    return response;
}

module.exports.addElement = async function (newElement) {
    try {
        let table = ''
        let parsedElement = this.parser(newElement);
        let action = 'INSERT INTO';
        let queryResult = this.fixQuery(action, table, parsedElement)

        let results = await this.db.queryDb(queryResult.query, queryResult.queryData);
        let response = {
            status: true,
            values: results
        }
        return response;
    } catch (e) {
        let response = {
            status: false,
            error: e.toString(),
        }
    }
}


module.exports.getElement = async function (data) {
    try {
        let table = ''
        let parsedElement = this.parse(table, data)
        let action = 'SELECT * FROM';
        let queryResult = this.fixQuery(action, table, parsedElement)

        let results = await this.db.queryDb(queryResult.query, queryResult.queryData);
        let response = {
            status: true,
            values: results
        }
        return response
    } catch (e) {
        let response = {
            status: false,
            error: e.toString(),
        }
        return response
    }
}

module.exports.getAll = async function () {
    try {
        let action = 'SELECT * FROM';
        let table = ''
        let queryResult = this.fixQuery(action, table)

        let results = await this.db.queryDb(queryResult.query, queryResult.queryData);
        let response = {
            status: true,
            values: results
        }
        return response
    } catch (e) {
        let response = {
            status: false,
            error: e.toString(),
        }
        return response
    }
}

module.exports.deleteElement = async function (data) {
    try {

        let table = ''
        let parsedElement = this.parse(table, data)
        let action = 'DELETE FROM';
        let queryResult = this.fixQuery(action, table, parsedElement)

        let results = await this.db.queryDb(queryResult.query, queryResult.queryData);
        let response = {
            status: true,
            values: results
        }
        return response
    } catch (e) {
        let response = {
            status: false,
            error: e.toString(),
        }
        return response
    }
}

module.exports.updateElement = async function (data) {
    try {

        let table = ''
        let parsedElement = this.parse(table, data)
        let action = 'UPDATE';
        let queryResult = this.fixQuery(action, table, parsedElement)

        let results = await this.db.queryDb(queryResult.query, queryResult.queryData);
        let response = {
            status: true,
            values: results
        }
        return response
    } catch (e) {
        let response = {
            status: false,
            error: e.toString(),
        }
        return response
    }
}

module.exports.getFiles = async function (data) {
    try {
        let table = ''
        let parsedElement = this.parse(table, data)
        let action = 'SELECT * FROM';
        let queryResult = this.fixQuery(action, table, parsedElement)

        results = await this.db.queryDb(queryResult.query, queryResult.queryData);
        let response = {
            status: true,
            values: results
        }
        return response
    } catch (e) {
        let response = {
            status: false,
            error: e.toString(),
        }
        return response
    }
}
