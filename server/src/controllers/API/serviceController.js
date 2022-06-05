import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Service = require('../../models').Service;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'service_add').then((rolePerm) => {
        if (!req.body.service_name) {
            res.status(400).send({
                message: 'Please pass service name.'
            })
        } else {
            Service
                .create({
                    service_name: req.body.service_name
                })
                .then((services) => res.status(201).send(services))
                .catch((error) => {
                    res.status(400).send(error);
                });
        }
    }).catch((error) => {
        res.status(403).send(error);
    });
};

// Update a "Table" by the id in the request
const update = (req, res) => {
    helper.checkPermission(req.user.role_id, 'service_update').then((rolePerm) => {
        Service
            .findByPk(req.params.id)
            .then((services) => {
                if (services) {
                    services.update({
                        service_name: (req.body.service_name) ? req.body.service_name : services.service_name
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            message: 'Service updated'
                        });
                    }).catch(err => res.status(400).send(err));
                } else {
                    res.status(400).send("Service not found");
                }
            })
            .catch((error) => {
                res.status(400).send(error);
            });
        // }
    }).catch((error) => {
        res.status(403).send(error);
    });
};

// Delete a "Table" with the specified id in the request
const destroy = (req, res) => {
    helper.checkPermission(req.user.role_id, 'service_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Service ID.'
            })
        } else {
            Service
                .findByPk(req.params.id)
                .then((services) => {
                    if (services) {
                        Service.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Service deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Service not found'
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

// Retrieve all "Table" from the database.
const findAll = (req, res) => {
    helper.checkPermission(req.user.role_id, 'service_get_all').then((rolePerm) => {
        Service
            .findAll()
            .then((services) => res.status(200).send(services))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

// Find a single "Table" with an id
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'service_get').then((rolePerm) => {
        Service
            .findByPk(req.params.id)
            .then((services) => {
                if (!services) {
                    res.status(404).send({ message: "Service not found" });
                } else {
                    res.status(200).send(services);
                }
            })
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

module.exports = {
    create,
    update,
    destroy,
    findAll,
    findOne
};