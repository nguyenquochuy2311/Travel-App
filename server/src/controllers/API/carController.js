import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Car = require('../../models').Car;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'car_add').then((rolePerm) => {
        if (!req.body.car_details || !req.body.car_price) {
            res.status(400).send({
                message: 'Please pass car details and car price.'
            })
        } else {
            Car
                .create({
                    car_details: req.body.car_details,
                    car_price: req.body.car_price,
                })
                .then((cars) => res.status(201).send(cars))
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
    helper.checkPermission(req.user.role_id, 'car_update').then((rolePerm) => {
        Car
            .findByPk(req.params.id)
            .then((cars) => {
                if (cars) {
                    cars.update({
                        car_details: (req.body.car_details) ? req.body.car_details : cars.car_details,
                        car_price: (req.body.car_price) ? req.body.car_price : cars.car_price,
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            message: 'Car updated'
                        });
                    }).catch(err => res.status(400).send(err));
                } else {
                    res.status(400).send("Car not found");
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
    helper.checkPermission(req.user.role_id, 'car_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Car ID.'
            })
        } else {
            Car
                .findByPk(req.params.id)
                .then((cars) => {
                    if (cars) {
                        Car.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Car deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Car not found'
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
    helper.checkPermission(req.user.role_id, 'car_get_all').then((rolePerm) => {
        Car
            .findAll()
            .then((cars) => res.status(200).send(cars))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

// Find a single "Table" with an id
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'car_get').then((rolePerm) => {
        Car
            .findByPk(req.params.id)
            .then((cars) => {
                if (!cars) {
                    res.status(404).send({ message: "Car not found" });
                } else {
                    res.status(200).send(cars);
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