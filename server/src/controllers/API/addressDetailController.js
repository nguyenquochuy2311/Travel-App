import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Address = require('../../models').Address;
const AddressDetail = require('../../models').AddressDetail;
const User = require('../../models').User;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'user_address_add').then((rolePerm) => {
        if (!req.body.address_id) {
            res.status(400).send({
                message: 'Please pass Address ID.'
            })
        } else {
            Address.findOne({
                where: {
                    id: req.body.address_id
                }
            }).then((address) => {
                if (!address) {
                    return res.status(401).send({
                        message: 'Not Found ID Role = ' + req.body.address_id,
                    });
                }
                AddressDetail
                    .create({
                        address_id: req.body.address_id,
                        user_id: req.body.req.user.id
                    })
                    .then((addresseDetail) => res.status(201).send(addresseDetail))
                    .catch((error) => {
                        res.status(400).send(error);
                    });
            }).catch((error) => {
                res.status(400).send(error);
            });
        }
    }).catch((error) => {
        res.status(403).send(error);
    });
};
// Retrieve all "Table" from the database.
const findAll = (req, res) => {
    helper.checkPermission(req.user.role_id, 'user_address_get_all').then((rolePerm) => {
        AddressDetail
            .findAll({
                include: [{
                    model: Address,
                    as: 'address'
                }],
                include: [{
                    model: User,
                    as: 'user'
                }]
            })
            .then((addressDetail) => res.status(200).send(addressDetail))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};
// Find a single "Table" with an id
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'address_get').then((rolePerm) => {
        Address
            .findByPk(req.params.id)
            .then((address) => {
                if (!address) {
                    res.status(404).send({ message: "Address not found" });
                } else {
                    res.status(200).send(address);
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
const update = (req, res) => {
    helper.checkPermission(req.user.role_id, 'address_update').then((rolePerm) => {
        Address
            .findByPk(req.params.id)
            .then((address) => {
                if (address) {
                    Address.update({
                        address_details: (req.body.address_details) ? req.body.address_details : address.address_details
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            message: 'Address updated'
                        });
                    }).catch(err => res.status(400).send(err));
                } else {
                    res.status(400).send("Address not found");
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
    helper.checkPermission(req.user.role_id, 'address_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Address ID.'
            })
        } else {
            Address
                .findByPk(req.params.id)
                .then((address) => {
                    if (address) {
                        Address.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Address deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Address not found'
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

module.exports = {
    create,
    findAll,
    findOne,
    update,
    destroy
};

