const jwt = require('jsonwebtoken');
const passport = require('passport');
require('../../config/passport')(passport);
const User = require('../../models').User;
const Role = require('../../models').Role;

exports.test = (req, res) => {
    res.status(400).send({
        msg: 'test domain'
    });
};

exports.signup = (req, res) => {
    if (!req.body.email || !req.body.password || !req.body.fullname) {
        res.status(400).send({
            msg: 'Please pass email, password and name.'
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
                    user_password: req.body.password,
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
            user.comparePassword(req.body.password, (err, isMatch) => {
                if (isMatch && !err) {
                    var token = jwt.sign(JSON.parse(JSON.stringify(user)), 'nodeauthsecret', {
                        expiresIn: 86400 * 30
                    });
                    jwt.verify(token, 'nodeauthsecret', function(err, data) {
                        console.log(err, data);
                    })
                    res.json({
                        success: true,
                        token: 'JWT ' + token
                    });
                } else {
                    res.status(401).send({
                        success: false,
                        msg: 'Authentication failed. Wrong password.'
                    });
                }
            })
        })
        .catch((error) => res.status(400).send(error));
}