const db = require("../models");
const Role = db.role;
const User = db.user;

checkDuplicateEmailOrPhone = (req, res, next) => {
    // Phone
    User.findOne({
        where: {
            user_email: req.body.email
        }
    }).then(user => {
        if (user) {
            res.status(400).send({
                message: "Failed! Email is already in use!"
            });
            return;
        }
        // Email
        User.findOne({
            where: {
                user_phone: req.body.phone
            }
        }).then(user => {
            if (user) {
                res.status(400).send({
                    message: "Failed! Phone is already in use!"
                });
                return;
            }
            next();
        });
    });
};
checkRolesExisted = (req, res, next) => {
    if (req.body.roles) {
        for (let i = 0; i < req.body.roles.length; i++) {
            if (!Role.includes(req.body.roles[i])) {
                res.status(400).send({
                    message: "Failed! Role does not exist = " + req.body.roles[i]
                });
                return;
            }
        }
    }

    next();
};
const verifySignUp = {
    checkDuplicateEmailOrPhone: checkDuplicateEmailOrPhone,
    checkRolesExisted: checkRolesExisted
};
module.exports = verifySignUp;