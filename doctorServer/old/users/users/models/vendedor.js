const mongoose = require('mongoose');
const config = require('../../config/database');
const Schema = require('mongoose').Schema;
const User = require('./user');


const vendedorSchema = mongoose.Schema({
  user: {
    type: Schema.Types.ObjectId,
    ref: 'User'
  },
  comision: {
    type: String
  },
  type: [{
    type: Schema.Types.ObjectId,
    ref: 'Cliente'
  }]
})
  .post('remove', removeLinkedDocuments);

async function removeLinkedDocuments(element) {
  try {
    // doc will be the removed Person document
    await User.remove({ _id: element.userId })
  } catch (error) {

  }

}
const Vendedor = module.exports = mongoose.model("Vendedor", vendedorSchema);


module.exports.deleteVendedor = async function (id) {
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

module.exports.fillUser = async function (id) {
  try {
    const query = { '_id': id }
    let vendedor = await this.findOne(query).populate('userId');
    vendedor.userId['vendedorId'] = id;
    let user = vendedor.userId.save();
    return vendedor
  } catch (error) { throw error; }
}


module.exports.addVendedor = async function (newVendedor) {
  try {
    let vendedor = await newVendedor.save();
    vendedor = await this.fillUser(vendedor._id);
    let response = {
      status: true,
      values: vendedor
    }
    return response;
  } catch (error) { throw error; }
}

module.exports.getVendedors = async function () {
  try {
    const query = {};
    let vendedors = await this.find(query)
      .populate({ path: 'userId', select: 'username mail type name' })
    //.populate({ path: 'questionsId', populate: 'answerId' })
    //        .populate('mhsId')
    //        .populate('reviewsId')
    //.populate('appointments');
    let response = {
      status: true,
      values: vendedors
    }
    return response;
  } catch (error) { throw error; }
}
module.exports.getVendedor = async function (dId) {
  try {
    const query = { 'userId': dId };
    let vendedor = await this.findOne(query)
      //      .populate({ path: 'questionsId', populate: 'answerId' })
      //        .populate('mhsId')
      //        .populate('reviewsId')
      //    .populate('appointmentsId')
      .populate({ path: 'userId', select: 'username mail type name' })
    let response = {
      status: true,
      values: vendedor
    }
    return response;
  } catch (error) { throw error; }
}
module.exports.updateVendedor = async function (data) {
  try {
    const query = { 'userId': data.id }
    let vendedor = await this.findOne(query)
      .populate('userId');
    vendedor.userId.name = data.name;
    if (username != vendedor.userId.username) {
      let user = await this.findOne({ "username": data.username });
      if (user) {
        throw new Error('Nombre de usuario no disponible');
      }
      vendedor.userId.username = data.username;
    }
    let user = await vendedor.userId.save();
    vendedor = await vendedor.save();
    let response = {
      status: true,
      values: vendedor
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