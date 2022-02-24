const User = require('../../models').User;
const passport = require('passport');
require('../../config/passport')(passport);
const Helper = require('../../utils/helper');
const helper = new Helper();

exports.create = (req, res) => {
    // const title = req.query.title;
    // var condition = title ? { title: {
    //         [Op.like]: `%${title}%` } } : null;
    helper.checkPermission(req.user.role_id, 'user_add').then((rolePerm) => {
        if (!req.body.role_id || !req.body.email || !req.body.password || !req.body.fullname || !req.body.phone) {
            res.status(400).send({
                msg: 'Please pass Role ID, email, password, phone or fullname.'
            })
        } else {
            User
                .create({
                    user_email: req.body.email,
                    user_password: req.body.password,
                    user_fullname: req.body.fullname,
                    user_phone: req.body.phone,
                    role_id: req.body.role_id
                })
                .then((user) => res.status(201).send(user))
                .catch((error) => {
                    console.log(error);
                    res.status(400).send(error);
                });
        }
    }).catch((error) => {
        res.status(403).send(error);
    });
};
// Retrieve all "Table" from the database.
exports.findAll = (req, res) => {
    helper.checkPermission(req.user.role_id, 'user_get_all').then((rolePerm) => {
        User
            .findAll({
                include: [{
                    model: Role,
                    include: [{
                        model: Permission,
                        as: 'permissions'
                    }]
                }]
            })
            .then((users) => res.status(200).send(users))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};
// Find a single "Table" with an id
exports.findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'user_get').then((rolePerm) => {
        User
            .findByPk(req.params.id)
            .then((user) => res.status(200).send(user))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};
// Update a "Table" by the id in the request
exports.update = (req, res) => {
    helper.checkPermission(req.user.role_id, 'role_update').then((rolePerm) => {
        if (!req.body.role_id || !req.body.email || !req.body.fullname || !req.body.phone) {
            res.status(400).send({
                msg: 'Please pass Role ID, email, password, phone or fullname.'
            })
        } else {
            User
                .findByPk(req.params.id)
                .then((user) => {
                    User.update({
                        email: req.body.email || user.email,
                        fullname: req.body.fullname || user.fullname,
                        phone: req.body.phone || user.phone,
                        role_id: req.body.role_id || user.role_id
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            'message': 'User updated'
                        });
                    }).catch(err => res.status(400).send(err));
                })
                .catch((error) => {
                    res.status(400).send(error);
                });
        }
    }).catch((error) => {
        res.status(403).send(error);
    });
};
// Delete a "Table" with the specified id in the request
exports.delete = (req, res) => {
    helper.checkPermission(req.user.role_id, 'role_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass user ID.'
            })
        } else {
            User
                .findByPk(req.params.id)
                .then((user) => {
                    if (user) {
                        User.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                'message': 'User deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            'message': 'User not found'
                        });
                    }
                })
                .catch((error) => {
                    res.status(400).send(error);
                });
        }
    }).catch((error) => {
        res.status(403).send(error);
    });
};
// Delete all "Table" from the database.
exports.deleteAll = (req, res) => {

};
// Find all published "Table"
exports.findAllPublished = (req, res) => {

};