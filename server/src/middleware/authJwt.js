const jwt = require("jsonwebtoken");
const config = require("../config/authConfig.js");
const db = require("../models");
const User = db.Users;
verifyToken = (req, res, next) => {
    let token = req.headers["x-access-token"];
    if (!token) {
        return res.status(403).send({
            message: "No token provided!"
        });
    }
    jwt.verify(token, config.secret, (err, decoded) => {
        if (err) {
            return res.status(401).send({
                message: "Unauthorized!"
            });
        }
        req.userId = decoded.id;
        next();
    });
};
isAdmin = (req, res, next) => {
    User.findByPk(req.userId).then(user => {
        user.getRoles().then(roles => {
            for (let i = 0; i < roles.length; i++) {
                if (roles[i].role_name === "admin") {
                    next();
                    return;
                }
            }
            res.status(403).send({
                message: "Require Admin Role!"
            });
            return;
        });
    });
};
isCustomer = (req, res, next) => {
    User.findByPk(req.userId).then(user => {
        user.getRoles().then(roles => {
            for (let i = 0; i < roles.length; i++) {
                if (roles[i].role_name === "customer") {
                    next();
                    return;
                }
            }
            res.status(403).send({
                message: "Require Customer Role!"
            });
        });
    });
};
isCustomerOrAdmin = (req, res, next) => {
    User.findByPk(req.userId).then(user => {
        user.getRoles().then(roles => {
            for (let i = 0; i < roles.length; i++) {
                if (roles[i].role_name === "customer") {
                    next();
                    return;
                }
                if (roles[i].role_name === "admin") {
                    next();
                    return;
                }
            }
            res.status(403).send({
                message: "Require Customer or Admin Role!"
            });
        });
    });
};
const authJwt = {
    verifyToken: verifyToken,
    isAdmin: isAdmin,
    isCustomer: isCustomer,
    isCustomerOrAdmin: isCustomerOrAdmin
};
module.exports = authJwt;