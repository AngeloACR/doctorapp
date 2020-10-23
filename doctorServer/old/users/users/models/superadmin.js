const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;
const User = require('./user');

const superAdminSchema = mongoose.Schema({
  userId: {
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'User',
  }
})
  .post('remove', removeLinkedDocuments);

async function removeLinkedDocuments(element) {
  try {
    // doc will be the removed Person document
    await User.remove({ _id: element.userId })
  } catch (error) {

  }

}
const SuperAdmin = module.exports = mongoose.model("SuperAdmin", superAdminSchema);

module.exports.fillUser = async function (id) {
  try {
    const query = { '_id': id }
    let superAdmin = await this.findOne(query).populate('userId');
    superAdmin.userId['superAdminId'] = id;
    let user = superAdmin.userId.save();
    return superAdmin
  } catch (error) { throw error; }
}

module.exports.addSuperAdmin = async function (newSuperAdmin) {
  try {
    let superAdmin = await newSuperAdmin.save();
    superAdmin = await this.fillUser(superAdmin._id);
    let response = {
      status: true,
      values: superAdmin
    }
    return response;
  } catch (error) { throw error; }
}

module.exports.addQuestion = async function (pId, qId) {
  try {
    const query = { '_id': pId };
    let superAdmin = await this.findOne(query);
    superAdmin.questionsId.push(qId);
    superAdmin = await superAdmin.save();
    if (superAdmin) {
      return true;
    } else {
      throw new Error('Cannot add answer to doctor');
    }
  } catch (error) { throw error; }
}
module.exports.addMH = async function (pId, mhId) {
  try {
    const query = { '_id': pId };
    let superAdmin = await this.findOne(query);
    superAdmin.mhsId.push(mhId);
    superAdmin = await superAdmin.save();
    if (superAdmin) {
      return true;
    } else {
      throw new Error('Cannot add appointment to superAdmin');
    }
  } catch (error) { throw error; }
}

module.exports.deleteSuperAdmin = async function (id) {
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

module.exports.getSuperAdmins = async function () {
  try {
    const query = {};
    let superAdmins = await this.find(query)
      .populate({ path: 'userId', select: 'username mail type name' })
    //.populate({ path: 'questionsId', populate: 'answerId' })
    //        .populate('mhsId')
    //.populate('appointments');
    let response = {
      status: true,
      values: superAdmins
    }
    return response;
  } catch (error) { throw error; }
}

module.exports.getSuperAdmin = async function (pId) {
  try {
    const query = { '_id': pId };
    let superAdmin = await this.findOne(query)
      //      .populate({ path: 'questionsId', populate: 'answerId' })
      //        .populate('mhsId')
      //   .populate('appointmentsId')
      .populate({ path: 'userId', select: 'username mail type name' })
    let response = {
      status: true,
      values: superAdmin
    }
    return response;
  } catch (error) { throw error; }
}

module.exports.updateSuperAdmin = async function (data) {
  try {
    const query = { 'userId': data.id }
    let superAdmin = await this.findOne(query)
      .populate('userId');
    superAdmin.userId.name = data.name;
    if (username != superAdmin.userId.username) {
      let user = await this.findOne({ "username": data.username });
      if (user) {
        throw new Error('Nombre de usuario no disponible');
      }
      superAdmin.userId.username = data.username;
    }
    let user = await superAdmin.userId.save();
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