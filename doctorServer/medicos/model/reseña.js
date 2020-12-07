const environment = require('../../config/environment');
const db = require('../../database');
module.exports.tables = {
    RatingDoctor: {
        id: 'Codigo_rating',
        doctorInfo: 'Codigo_personaDoctor',
        doctorUser: 'id_UsuarioDoctor',
        pacienteInfo: 'Codigo_personaPaciente',
        pacienteUser: 'id_UsuarioPaciente',
        rating: 'Rating',
    },
    ReseniaDoctor: {
        id: 'Codigo_resenia',
        doctorInfo: 'Codigo_personaDoctor',
        doctorUser: 'id_UsuarioDoctor',
        pacienteInfo: 'Codigo_personaPaciente',
        pacienteUser: 'id_UsuarioPaciente',
        resenia: 'Resenia',
        motivo: 'Motivo_resenia',
    }
}

const Reseña = module.exports
