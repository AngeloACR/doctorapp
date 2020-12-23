const jwt = require("jsonwebtoken");
const config = require("../../config/environment");

module.exports = function (req, res, next) {
    try {
        //get the token from the header if present
        const token = req.headers["x-access-token"] || req.headers["authorization"];
        //token = token.replace('Bearer ','');
        //if no token found, return response (without going to the next middleware)
        let errorResponse = {
            message: 'Acceso denegado',
            status: false
        }
        if (!token) return res.status(401).send(errorResponse);

        //if can verify the token, set req.user and pass to next middleware
        const decoded = jwt.verify(token, config.authSecret); //ESTO PASA A VARIABLE DE ENTORNO EN PRODUCCIÓN

        req.user = decoded;

        next();
    } catch (ex) {
        //if invalid token
        res.status(400).send("Invalid token.");
    }
};