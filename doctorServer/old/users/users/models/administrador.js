const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;
const User = require('./user');

const adminSchema = mongoose.Schema({
  userId: {
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'User',
  }
})
  .post('remove', removeLinkedDocuments);

async function removeLinkedDocuments(element) {
  try {

    await User.remove({ _id: element.userId })
  } catch (error) {

  }    // doc will be the removed Person document
}

const Admin = module.exports = mongoose.model("Admin", adminSchema);

module.exports.fillUser = async function (id) {
  try {
    const query = { '_id': id }
    let admin = await this.findOne(query).populate('userId');
    admin.userId['adminId'] = id;
    let user = admin.userId.save();
    return admin
  } catch (error) { throw error; }
}

module.exports.addAdmin = async function (newAdmin) {
  try {
    let admin = await newAdmin.save();
    admin = await this.fillUser(admin._id);
    let response = {
      status: true,
      values: admin
    }
    return response;
  } catch (error) { throw error; }
}


module.exports.deleteAdmin = async function (id) {
  try {
    const query = { "_id": id };
    let deleteRes = await this.findOneAndRemove(query);
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

module.exports.getAdmins = async function () {
  try {
    const query = {};
    let admins = await this.find(query)
      .populate({ path: 'userId', select: 'username mail type name' })
    //.populate({ path: 'questionsId', populate: 'answerId' })
    //        .populate('mhsId')
    //.populate('appointments');
    let response = {
      status: true,
      values: admins
    }
    return response;
  } catch (error) { throw error; }
}

module.exports.getAdmin = async function (pId) {
  try {
    const query = { '_id': pId };
    let admin = await this.findOne(query)
      //      .populate({ path: 'questionsId', populate: 'answerId' })
      //        .populate('mhsId')
      //   .populate('appointmentsId')
      .populate({ path: 'userId', select: 'username mail type name' })
    let response = {
      status: true,
      values: admin
    }
    return response;
  } catch (error) { throw error; }
}

module.exports.updateAdmin = async function (data) {
  try {
    const query = { 'userId': data.id }
    let admin = await this.findOne(query)
      .populate('userId');
    admin.userId.name = data.name;
    if (username != admin.userId.username) {
      let user = await this.findOne({ "username": data.username });
      if (user) {
        throw new Error('Nombre de usuario no disponible');
      }
      admin.userId.username = data.username;
    }
    let user = await admin.userId.save();
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