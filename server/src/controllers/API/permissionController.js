import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../config/passport')(passport);

const Permission = require('../../models').Permission;

exports.create = async (req, res) => {
    helper.checkPermission(req.user.role_id, 'permissions_add').then((rolePerm) => {
        if (!req.body.perm_name || !req.body.perm_description) {
            res.status(400).send({
                message: 'Please pass permission name or description.'
            })
        } else {
            Permission
                .create({
                    perm_name: req.body.perm_name,
                    perm_description: req.body.perm_description
                })
                .then((perm) => res.status(201).send(perm))
                .catch((error) => {
                    console.log(error);
                    res.status(400).send(error);
                });
        }
    }).catch((error) => {
        res.status(403).send(error);
    });
};

exports.findAll = (req, res) => {
    console.log(req.user.role_id);
    helper.checkPermission(req.user.role_id, 'permissions_get_all').then((rolePerm) => {
        Permission
            .findAll()
            .then((perms) => res.status(200).send(perms))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

exports.findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'permissions_get').then((rolePerm) => {
        Permission
            .findByPk(req.params.id)
            .then((perms) => res.status(200).send(perms))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

exports.update = (req, res) => {
    helper.checkPermission(req.user.role_id, 'permissions_update').then((rolePerm) => {
        if (!req.params.id || !req.body.perm_name || !req.body.perm_description) {
            res.status(400).send({
                message: 'Please pass permission ID, name or description.'
            })
        } else {
            Permission
                .findByPk(req.params.id)
                .then((perm) => {
                    Permission.update({
                        perm_name: req.body.perm_name || perm.perm_name,
                        perm_description: req.body.perm_description || perm.perm_description
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            message: 'Permission updated'
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

exports.delete = (req, res) => {
    helper.checkPermission(req.user.role_id, 'permissions_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                message: 'Please pass permission ID.'
            })
        } else {
            Permission
                .findByPk(req.params.id)
                .then((perm) => {
                    if (perm) {
                        perm.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Permission deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Permission not found'
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