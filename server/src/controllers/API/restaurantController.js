import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Restaurant = require('../../models').Restaurant;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'restaurant_add').then((rolePerm) => {
        if (!req.body.restaurant_details) {
            res.status(400).send({
                message: 'Please pass Restaurant details.'
            })
        } else {
            Restaurant
                .create({
                    restaurant_details: req.body.restaurant_details
                })
                .then((restaurants) => res.status(201).send(restaurants))
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
    helper.checkPermission(req.user.role_id, 'restaurant_update').then((rolePerm) => {
        Restaurant
            .findByPk(req.params.id)
            .then((restaurants) => {
                if (restaurants) {
                    restaurants.update({
                        restaurant_details: (req.body.restaurant_details) ? req.body.restaurant_details : restaurants.restaurant_details
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            message: 'Restaurant updated'
                        });
                    }).catch(err => res.status(400).send(err));
                } else {
                    res.status(400).send("Restaurant not found");
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
    helper.checkPermission(req.user.role_id, 'restaurant_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Restaurant ID.'
            })
        } else {
            Restaurant
                .findByPk(req.params.id)
                .then((restaurants) => {
                    if (restaurants) {
                        Restaurant.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Restaurant deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Restaurant not found'
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
    helper.checkPermission(req.user.role_id, 'restaurant_get_all').then((rolePerm) => {
        Restaurant
            .findAll()
            .then((restaurants) => res.status(200).send(restaurants))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

// Find a single "Table" with an id
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'restaurant_get').then((rolePerm) => {
        Restaurant
            .findByPk(req.params.id)
            .then((restaurants) => {
                if (!restaurants) {
                    res.status(404).send({ message: "Restaurant not found" });
                } else {
                    res.status(200).send(restaurants);
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