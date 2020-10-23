const mongoose = require('mongoose');
const config = require('../../config/database');

// Move Schema
const CompanySchema = mongoose.Schema({
  name: {
    type: String
  },
  users: [{
    type: String
  }],
  roles: [{
    type: String
  }],
  tlf: {
    type: String
  },
  rif: {
    type: String
  },
  mail: {
    type: String
  },
  address: {
    type: String
  },
});

const company = module.exports = mongoose.model('company', CompanySchema, 'company');


module.exports.addCompany = async function (newCompany) {
  try {
    let company = await newCompany.save();
    let response = {
      status: true,
      values: company
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

module.exports.updateCompany = async function (updateCompany, id) {
  try {
    let query = { '_id': id }
    let company = await this.findOne(query);
    company.name = updateCompany.name;
    company.address = updateCompany.address;
    company.tlf = updateCompany.tlf;
    company.rif = updateCompany.rif;
    company.mail = updateCompany.mail;

    company = company.save();
    let response = {
      status: true,
      values: company
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


module.exports.getCompany = async function (id) {
  try {
    const query = {};
    let company = await this.find(query)
    let response = {
      status: true,
      values: company
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
    let company = company.find(query)
    company.users.push(user);
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
    let company = company.find(query)
    let users = company.users;
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
  company.findOneAndUpdate(query,
    {
      $push: {
        "roles": role
      }
    },
    callback);
};

module.exports.removeRole = function (role, callback) {
  const query = {};
  company.findOneAndUpdate(query,
    {
      $pull: {
        "roles": role
      }
    },
    callback);
};

