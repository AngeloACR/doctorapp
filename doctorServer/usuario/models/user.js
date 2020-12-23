const bcrypt = require('bcryptjs');
const environment = require('../../config/environment');
const crypto = require('crypto');
const db = require('../../database');
const jwt = require('jsonwebtoken');
module.exports.tables = {
    UsuarioDoctorWeb: {
        id: 'id_Usuario',
        usuario: 'Login_usuario',
        correo: 'Correo_electronico',
        telefono: 'Numero_celular',
        contraseña: 'Clave_usuario',
        status: 'Estado_usuario',
        caducidad: 'Fecha_caducidad',
        idPersona: 'Codigo_persona',
        tipo: 'Codigo_tipo_Usuario',
        telefonoValidado: 'Telefono_validado',
        correoValidado: 'Correo_validado',
    }
}



module.exports.comparePass = async function (candidatePassword, contraseña) {
    try {
        return await bcrypt.compare(candidatePassword, contraseña);
    } catch (error) {
        throw error;
    }
};
module.exports.hashPass = async function (contraseña) {
    try {
        let salt = await bcrypt.genSalt(10)
        return await bcrypt.hash(contraseña, salt)
    } catch (error) {
        throw error;
    }
};
module.exports.genToken = function (usuario) {
    try {
        const hash = crypto.createHash('sha1');

        var hrTime = process.hrtime();
        var validTime = hrTime[0] * 1000000 + hrTime[1] / 1000

        var toHash = usuario + validTime.toString() + environment.vSecret;
        hash.update(toHash);
        return [hash.digest('hex'), validTime]
    } catch (error) {
        throw error;
    }
};


module.exports.addUser = async function (newUser) {
    try {
        let query = 'SELECT * FROM ?? WHERE ?? = ?';
        let queryData = ['UsuarioDoctorWeb', 'Login_usuario', newUser.username];
        let results = await this.db.queryDb(query, queryData);
        if (!results != 0) {
            throw new Error('Email already in use');
        } else {
            newUser.password = await this.hashPass(newUser.password);
            query = 'INSERT INTO ?? (??, ??, ??) VALUES (?, ?, ?)';
            queryData = ['UsuarioDoctorWeb', 'Login_usuario', 'Clave_usuario', 'Codigo_tipo_Usuario', newUser.username, newUser.password, newUser.tipo];
            results = await this.db.queryDb(query, queryData);
            let response = {
                status: true,
                values: results
            }
            return response;
        }
    } catch (error) {
        throw error;
    }
};
module.exports.authUser = async function (username, password) {
    try {
        let query = 'SELECT * FROM ?? WHERE ?? = ?';
        let queryData = ['UsuarioDoctorWeb', 'Login_usuario', username];
        let results = await this.db.queryDb(query, queryData);
        console.log(results);
        let user = {
            id: results[0].id_Usuario,
            username: results[0].Login_usuario,
            type: results[0].Codigo_tipo_Usuario
        }
        if (!user) {
            throw new Error("Username doesn't exist")
        }
        let isMatch = await this.comparePass(password, results[0].password)
        let data = {}
        if (isMatch) {

            const token = jwt.sign(user, environment.authSecret, {
                expiresIn: '7d' //1 day
            });
            jwtData = {
                auth: true,
                token: token
            }
        } else {
            jwtData = {
                auth: false
            }
        }
        return jwtData;
    } catch (error) {
        throw error;
    }
};
module.exports.deleteUser = async function (username) {
    try {
        console.log('starting deletion')
        let query = 'DELETE FROM ?? WHERE ?? = ?';
        queryData = ['UsuarioDoctorWeb', 'Login_usuario', username];
        let results = await this.db.queryDb(query, queryData);
        if (!results) {
            throw new Error("Username doesn't exist")
        }
        let response = {
            status: true,
            values: results
        }
        return response;
    } catch (error) {
        throw error;
    }
};
module.exports.updateUser = async function (user) {
    try {
        let query = 'UPDATE ?? SET ?? = ?, ?? = ?, ?? = ? WHERE ?? = ?';
        queryData = ['UsuarioDoctorWeb', 'Login_usuario', user.usernameNew, 'Codigo_tipo_Usuario', user.tipo, 'Clave_usuario', user.password, 'Login_usuario', user.usernameOld];
        let results = await this.db.queryDb(query, queryData);
        if (!results) {
            throw new Error("Username doesn't exist")
        }
        let response = {
            status: true,
            values: results
        }
        return response;
    } catch (error) {
        throw error;
    }
};
module.exports.getUser = async function (id) { //Need tons of work
    try {
        let query = 'SELECT * FROM ?? WHERE ?? = ?';
        let queryData = ['UsuarioDoctorWeb', 'id_Usuario', id];
        let results = await this.db.queryDb(query, queryData);
        if (!results[0]) {
            throw new Error("Username doesn't exist")
        }
        let user = {
            id: results[0].id_Usuario,
            usuario: results[0].Login_Usuario,
            tipo: results[0].Codigo_tipo_Usuario
        }
        let response = {
            status: true,
            values: user
        }
        return response;
    } catch (error) {
        throw error;
    }
};

module.exports.getUsersByType = async function (type) { //Need tons of work
    try {
        let query;
        let queryData;
        if (type == 'all') {
            query = 'SELECT * FROM ??';
            queryData = ['UsuarioDoctorWeb'];
        } else {
            query = 'SELECT * FROM ?? WHERE ?? = ?';
            queryData = ['UsuarioDoctorWeb', 'Codigo_tipo_Usuario', type];
        }
        let results = await this.db.queryDb(query, queryData);
        if (!results) {
            throw new Error("There are no users of this type")
        }
        var uMap = [{}];
        var i = 0;
        results.forEach(function (result) {
            uMap[i] = {
                id: result.id_Usuario,
                usuario: result.Login_Usuario,
                tipo: result.Codigo_tipo_Usuario
            };
            i++;
        });
        let response = {
            status: true,
            values: uMap
        }
        return response;
    } catch (error) {
        throw error;
    }
};

module.exports.getUsers = async function () { //Need tons of work
    try {
        let query = 'SELECT * FROM ??';
        let queryData = ['UsuarioDoctorWeb'];
        let results = await this.db.queryDb(query, queryData);
        if (!results) {
            throw new Error("Username doesn't exist")
        }
        var uMap = [{}];
        var i = 0;
        results.forEach(function (result) {
            uMap[i] = {
                id: result.id_Usuario,
                usuario: result.Login_Usuario,
                tipo: result.Codigo_tipo_Usuario
            };
            i++;
        });
        let response = {
            status: true,
            values: uMap
        }
        return response;
    } catch (error) {
        throw error;
    }
};

/********************EMAIL VALIDATION, NEEDS WORK */
module.exports.setToken = async function setToken(username) {
    try {
        let tokenData = this.genToken(username);
        const query = { username: username };
        return await this.findOneAndUpdate(
            query, {
                $set: {
                    "validEmail": false,
                    "validToken": tokenData[0],
                    "validTime": tokenData[1]
                }
            },
            updateOptions
        );
    } catch (error) {
        throw error;
    }
};
module.exports.validateUser = async function (username, token) {
    try {
        const hrTime = process.hrtime();
        const thisTime = hrTime[0] * 1000000 + hrTime[1] / 1000
        const maxTime = 3600 * 8 * 1000000;
        const query = { "username": username };

        let user = await this.findOne(query);

        if (thisTime - user.validTime < maxTime) {
            if (user.validToken == token) {
                user = await this.findOneAndUpdate(
                    query, {
                        $set: {
                            "validEmail": true,
                        }
                    },
                    updateOptions
                );
                return user;
            } else {
                throw new Error('Wrong token');
            }
        } else {
            throw new Error('Token has expired');
        }

    } catch (error) {
        throw error;
    }
};

const User = module.exports
