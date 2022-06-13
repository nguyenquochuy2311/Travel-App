import bcrypt from 'bcryptjs';
import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Role = require('../../models').Role;
const Permission = require('../../models').Permission;
const User = require('../../models').User;
const uploadFileMiddleware = require("../../middleware/upload");

const create = async(req, res) => {
    try {
        //handle upload file
        await uploadFileMiddleware(req, res);
        helper.checkPermission(req.user.role_id, 'user_add').then((rolePerm) => {
            if (!req.body.role_id || !req.body.email || !req.body.password || !req.body.fullname || !req.body.phone) {
                res.status(400).send({
                    message: 'Please pass Role ID, email, password, phone or fullname.'
                })
            } else {
                User
                    .create({
                        user_email: req.body.email,
                        user_password: bcrypt.hashSync(req.body.password, bcrypt.genSaltSync(10), null),
                        user_fullname: req.body.fullname,
                        user_phone: req.body.phone,
                        role_id: req.body.role_id,
                        user_avatar: (req.file !== undefined || req.file) ? req.file.filename : null
                    })
                    .then((user) => res.status(201).send(user))
                    .catch((error) => {
                        res.status(400).send(error);
                    });
            }
        }).catch((error) => {
            res.status(403).send(error);
        });
    } catch (error) {
        res.status(500).send({
            error: `${error}`,
        });
    }
};
// Retrieve all "Table" from the database.
const findAll = (req, res) => {
    helper.checkPermission(req.user.role_id, 'user_get_all').then((rolePerm) => {
        User
            .findAll({
                include: [{
                    model: Role,
                    as: 'role',
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
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'user_get').then((rolePerm) => {
        User
            .findByPk(req.params.id)
            .then((user) => {
                if (!user) {
                    res.status(404).send({ message: "User not found" });
                } else {
                    res.status(200).send(user);
                }
            })
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};
// Update a "Table" by the id in the request
const update = async(req, res) => {
    try {
        await uploadFileMiddleware(req, res);

        helper.checkPermission(req.user.role_id, 'user_update').then((rolePerm) => {
            User
                .findByPk(req.params.id)
                .then((user) => {
                    if (user) {
                        User.update({
                            user_email: (req.body.email) ? req.body.email : user.user_email,
                            user_fullname: (req.body.fullname) ? req.body.fullname : user.user_fullname,
                            user_phone: (req.body.phone) ? req.body.phone : user.user_phone,
                            user_password: req.body.password ? bcrypt.hashSync(req.body.password, bcrypt.genSaltSync(10), null) : user.user_password,
                            role_id: (req.body.role_id) ? req.body.role_id : user.role_id,
                            user_avatar: (req.file !== undefined || req.file) ? req.file.filename : user.user_avatar
                        }, {
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'User updated'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(400).send("User not found");
                    }
                })
                .catch((error) => {
                    res.status(400).send(error);
                });
            // }
        }).catch((error) => {
            res.status(403).send(error);
        });
    } catch (error) {
        res.status(500).send({
            error: `${error}`,
        });
    }
};
// Delete a "Table" with the specified id in the request
const destroy = (req, res) => {
    helper.checkPermission(req.user.role_id, 'user_delete').then((rolePerm) => {
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
                                message: 'User deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'User not found'
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
// Search by record of "Table" from the database.
const search = (req, res) => {
    helper.checkPermission(req.user.role_id, 'user_search').then((rolePerm) => {
            if (!req.params.search_by) {
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
            } else if (req.params.search_by === 'email') {

            } else if (req.params.search_by === 'phone') {

            } else if (req.params.search_by === 'fullname') {

            }
        })
        .catch((error) => {
            res.status(403).send(error);
        });
};

const getBooking = (req, res) => {

}
module.exports = {
    create,
    findAll,
    findOne,
    update,
    destroy
};