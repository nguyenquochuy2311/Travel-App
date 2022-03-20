const jwt = require('jsonwebtoken');
const passport = require('passport');
require('../../config/passport')(passport);
const User = require('../../models').User;
const Role = require('../../models').Role;
const bcrypt = require('bcryptjs');
const config = require('../../config/authConfig');

exports.signup = (req, res) => {
    if (!req.body.email || !req.body.password || !req.body.fullname) {
        res.status(400).send({
            message: 'Please pass email, password and name.'
        })
    } else {
        Role.findOne({
            where: {
                role_name: 'admin'
            }
        }).then((role) => {
            console.log(role.id);
            User
                .create({
                    user_email: req.body.email,
                    user_password: bcrypt.hashSync(req.body.password, bcrypt.genSaltSync(10), null),
                    user_fullname: req.body.fullname,
                    user_phone: req.body.phone,
                    role_id: role.id
                })
                .then((user) => res.status(201).send(user))
                .catch((error) => {
                    res.status(400).send(error);
                });
        }).catch((error) => {
            res.status(400).send(error);
        });
    }
};

exports.signin = (req, res) => {
    User
        .findOne({
            where: {
                user_email: req.body.email
            }
        })
        .then((user) => {
            if (!user) {
                return res.status(401).send({
                    message: 'Authentication failed. User not found.',
                });
            }
            var passwordIsValid = bcrypt.compareSync(req.body.password, user.user_password);
            if (passwordIsValid) {
                var token = jwt.sign(JSON.parse(JSON.stringify(user)), config.secret, {
                    expiresIn: 86400 //24 hours
                });
                jwt.verify(token, config.secret, function (err, data) {
                    console.log(err, data);
                })
                res.json({
                    success: true,
                    token: 'JWT ' + token
                });
            } else {
                res.status(401).send({
                    success: false,
                    message: 'Authentication failed. Wrong password.'
                });
            }
        })
        .catch((error) => res.status(400).send(error));
}

exports.logout = (req, res) => {
    const authHeader = req.headers["Authorization"];
    if (authHeader) {
        jwt.sign(authHeader, "", { expiresIn: 1, }, (logout, err) => {
            if (logout) {
                res.json({
                    success: true,
                    message: 'Successful Logout'
                });
            } else {
                res.send({ message: err });
            }
        })
    } else {
        res.status(401).send({ message: 'Error' });
    }
}