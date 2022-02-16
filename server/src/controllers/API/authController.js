const db = require("../../models");
const config = require("../../config/authConfig");
const User = db.Users;
const Role = db.Roles;
const Op = db.Sequelize.Op;
var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");
exports.signup = (req, res) => {
    // Save User to Database
    User.create({
            user_fullname: req.body.fullname,
            user_email: req.body.email,
            user_phone: req.body.phone,
            user_password: bcrypt.hashSync(req.body.password, 8),
            user_birthday: req.body.birthday,
            user_lastlogin: req.body.lastlogin,
            user_role: req.body.role
        })
        .then(user => {
            if (req.body.roles) {
                Role.findAll({
                    where: {
                        name: {
                            [Op.or]: req.body.role
                        }
                    }
                }).then(roles => {
                    user.setRoles(roles).then(() => {
                        res.send({ message: "User was registered successfully!" });
                    });
                });
            } else {
                // user role = 1
                user.setRoles([1]).then(() => {
                    res.send({ message: "User was registered successfully!" });
                });
            }
        })
        .catch(err => {
            res.status(500).send({ message: err.message });
        });
};
exports.signin = (req, res) => {
    User.findOne({
            where: {
                user_email: req.body.email
            }
        })
        .then(user => {
            if (!user) {
                return res.status(404).send({ message: "User Not found." });
            }
            var passwordIsValid = bcrypt.compareSync(
                req.body.password,
                user.user_password
            );
            if (!passwordIsValid) {
                return res.status(401).send({
                    accessToken: null,
                    message: "Invalid Password!"
                });
            }
            var token = jwt.sign({ id: user.id }, config.secret, {
                expiresIn: 86400 // 24 hours
            });
            var authorities = [];
            user.getRoles().then(roles => {
                for (let i = 0; i < roles.length; i++) {
                    authorities.push("ROLE_" + roles[i].role_name.toUpperCase());
                }
                res.status(200).send({
                    id: user.id,
                    fullname: user.user_fullname,
                    email: user.user_email,
                    phone: user.user_phone,
                    birthday: user.user_birthday,
                    lastlogin: user.user_lastlogin,
                    roles: authorities,
                    accessToken: token
                });
            });
        })
        .catch(err => {
            res.status(500).send({ message: err.message });
        });
};