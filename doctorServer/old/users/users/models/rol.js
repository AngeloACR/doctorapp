const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;
const User = require('./user');

const rolSchema = mongoose.Schema({
  users: [{
    type: Schema.Types.ObjectId,
    ref: 'User',
  }],
  nombre: {
    type: String,
  },

})
  .post('remove', removeLinkedDocuments);

async function removeLinkedDocuments(element) {
  try {

  } catch (error) {

  }    // doc will be the removed Person document
}

const Rol = module.exports = mongoose.model("Rol", rolSchema);

module.exports.addRol = async function (newRol) {
  try {
    let rol = await newRol.save();
    let response = {
      status: true,
      values: rol
    }
    return response;
  } catch (error) { throw error; }
}

module.exports.addUser = async function (rol, id) {
  try {
    let rol = await this.findOne({ '_id': id });
    rol.users.push(id);
    rol = rol.save();
    let response = {
      status: true,
      values: rol
    }
    return response;
  } catch (error) { throw error; }
}

module.exports.deleteRol = async function (id) {
  try {
    const query = { "_id": id };
    let rol = await this.findOne(query);
    let deleteRes = rol.remove();
    let response = {
      status: true,
      values: deleteRes
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

module.exports.getRols = async function () {
  try {
    const query = {};
    let rols = await this.find(query);
    let response = {
      status: true,
      values: rols
    }
    return response;
  } catch (error) { throw error; }
}

module.exports.getRol = async function (pId) {
  try {
    const query = { '_id': pId };
    let rol = await this.findOne(query)
    let response = {
      status: true,
      values: rol
    }
    return response;
  } catch (error) { throw error; }
}

module.exports.updateRol = async function (data) {
  try {
    const query = { 'userId': data.id }
    let rol = await this.findOne(query)
      .populate('userId');
    rol.userId.name = data.name;
    if (username != rol.userId.username) {
      let user = await this.findOne({ "username": data.username });
      if (user) {
        throw new Error('Nombre de usuario no disponible');
      }
      rol.userId.username = data.username;
    }
    let user = await rol.userId.save();
    let response = {
      status: true,
      values: user
    }
    return response

  } catch (error) {
    let response = {
      status: false,
      msg: error.toString().replace("Error: ", "")
    }
    return response
  }
}