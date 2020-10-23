const mongoose = require('mongoose');
const config = require('../../config/database');

// Move Schema
const CorrelativoSchema = mongoose.Schema({
  prefijo: {
    type: String
  },
  referencia: {
    type: String
  },
  valorActual: {
    type: String
  },
});

const correlativo = module.exports = mongoose.model('correlativo', CorrelativoSchema, 'correlativo');


module.exports.addCorrelativo = async function (newCorrelativo) {
  try {
    const query = { 'code': newCorrelativo.code };
    let correlativo = await this.findOne(query)
    if (correlativo) {
      throw new Error('Código de correlativo ya registrado');
    }

    correlativo = await newCorrelativo.save();
    let response = {
      status: true,
      values: correlativo
    }
    return response;
  } catch (error) {
    let response = {
      status: false,
      msg: error.toString().replace("Error: ", "")
    }
    return response
  }
}

module.exports.getCorrelativo = async function (id) {
  try {
    const query = {};
    let correlativo = await this.find(query)
    let response = {
      status: true,
      values: correlativo
    }
    return response;
  } catch (error) {
    let response = {
      status: false,
      msg: error.toString().replace("Error: ", "")
    }
    return response
  }
}

module.exports.updateUsers = async function (user) {
  try {

    const query = {};
    let correlativo = correlativo.find(query)
    correlativo.users.push(user);
  } catch (error) {
    let response = {
      status: false,
      msg: error.toString().replace("Error: ", "")
    }
    return response
  }
};

module.exports.removeUser = function (user) {
  const query = {};
  try {

    const query = {};
    let correlativo = correlativo.find(query)
    let users = correlativo.users;
    let dLength = users.length;
    for (let i = 0; i < dLength; i++) {
      if (users[i] == user) {
        users.splice(i, user);
      }
    }
  } catch (error) {
    let response = {
      status: false,
      msg: error.toString().replace("Error: ", "")
    }
    return response
  }
};

module.exports.updateRoles = function (role, callback) {
  const query = {};
  correlativo.findOneAndUpdate(query,
    {
      $push: {
        "roles": role
      }
    },
    callback);
};

module.exports.removeRole = function (role, callback) {
  const query = {};
  correlativo.findOneAndUpdate(query,
    {
      $pull: {
        "roles": role
      }
    },
    callback);
};

