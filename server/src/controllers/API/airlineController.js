import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Airline = require('../../models').Airline;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'airline_add').then((rolePerm) => {
        if (!req.body.airline_details || !req.body.airline_price) {
            res.status(400).send({
                message: 'Please pass airline details and airline price.'
            })
        } else {
            Airline
                .create({
                    airline_details: req.body.airline_details,
                    airline_price: req.body.airline_price,
                })
                .then((airlines) => res.status(201).send(airlines))
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
    helper.checkPermission(req.user.role_id, 'airline_update').then((rolePerm) => {
        Airline
            .findByPk(req.params.id)
            .then((airlines) => {
                if (airlines) {
                    airlines.update({
                        airline_details: (req.body.airline_details) ? req.body.airline_details : airlines.airline_details,
                        airline_price: (req.body.airline_price) ? req.body.airline_price : airlines.airline_price,
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            message: 'Airline updated'
                        });
                    }).catch(err => res.status(400).send(err));
                } else {
                    res.status(400).send("Airline not found");
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
    helper.checkPermission(req.user.role_id, 'airline_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Airline ID.'
            })
        } else {
            Airline
                .findByPk(req.params.id)
                .then((airlines) => {
                    if (airlines) {
                        Airline.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Airline deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Airline not found'
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
    helper.checkPermission(req.user.role_id, 'airline_get_all').then((rolePerm) => {
        Airline
            .findAll()
            .then((airlines) => res.status(200).send(airlines))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

// Find a single "Table" with an id
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'airline_get').then((rolePerm) => {
        Airline
            .findByPk(req.params.id)
            .then((airlines) => {
                if (!airlines) {
                    res.status(404).send({ message: "Airline not found" });
                } else {
                    res.status(200).send(airlines);
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