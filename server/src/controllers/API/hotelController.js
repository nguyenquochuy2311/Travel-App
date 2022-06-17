import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Hotel = require('../../models').Hotel;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'hotel_add').then((rolePerm) => {
        if (!req.body.hotel_details || !req.body.hotel_price) {
            res.status(400).send({
                message: 'Please pass hotel details and hotel price.'
            })
        } else {
            Hotel
                .create({
                    hotel_details: req.body.hotel_details,
                    hotel_price: req.body.hotel_price,
                })
                .then((hotels) => res.status(201).send(hotels))
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
    helper.checkPermission(req.user.role_id, 'hotel_update').then((rolePerm) => {
        Hotel
            .findByPk(req.params.id)
            .then((hotels) => {
                if (hotels) {
                    hotels.update({
                        hotel_details: (req.body.hotel_details) ? req.body.hotel_details : hotels.hotel_details,
                        hotel_price: (req.body.hotel_price) ? req.body.hotel_price : hotels.hotel_price,
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            message: 'Hotel updated'
                        });
                    }).catch(err => res.status(400).send(err));
                } else {
                    res.status(400).send("Hotel not found");
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
    helper.checkPermission(req.user.role_id, 'hotel_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Hotel ID.'
            })
        } else {
            Hotel
                .findByPk(req.params.id)
                .then((hotels) => {
                    if (hotels) {
                        Hotel.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Hotel deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Hotel not found'
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
    helper.checkPermission(req.user.role_id, 'hotel_get_all').then((rolePerm) => {
        Hotel
            .findAll()
            .then((hotels) => res.status(200).send(hotels))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

// Find a single "Table" with an id
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'hotel_get').then((rolePerm) => {
        Hotel
            .findByPk(req.params.id)
            .then((hotels) => {
                if (!hotels) {
                    res.status(404).send({ message: "Hotel not found" });
                } else {
                    res.status(200).send(hotels);
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