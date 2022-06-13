import Helper from '../../utils/helper';
const helper = new Helper();

const Sequelize = require("sequelize");
const Op = Sequelize.Op;

const passport = require('passport');
require('../../middleware/passport')(passport);

const Service = require('../../models').Service;
const Country = require('../../models').Country;
const Airline = require('../../models').Airline;
const Car = require('../../models').Car;
const Hotel = require('../../models').Hotel;
const Restaurant = require('../../models').Restaurant;
const ServiceDetail = require('../../models').ServiceDetail;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'service_add').then((rolePerm) => {
        if (!req.body.name || !req.body.country_id) {
            res.status(400).send({
                message: 'Please pass service name, country id'
            })
        } else {
            Country
                .findByPk(req.body.country_id)
                .then((country) => {
                    if (!country) {
                        res.status(404).send({ message: "Country not found" });
                    } else {
                        Service
                            .create({
                                service_name: req.body.name,
                                country_id: req.body.country_id
                            })
                            .then((service) => res.status(201).send(service))
                            .catch((error) => {
                                res.status(400).send(error);
                            });
                    }
                })
                .catch((error) => {
                    res.status(400).send(error);
                });
        }
    }).catch((error) => {
        console.log(error);
        res.status(403).send(error);
    });
}

const findAll = (req, res) => {
    Service
        .findAll({
            include: [{
                model: Country,
                as: 'country'
            }]
        })
        .then((services) => res.status(200).send(services))
        .catch((error) => {
            console.log(error);
            res.status(400).send(error);
        });
};

const findOne = (req, res) => {
    ServiceDetail
        .findOne({
            where: {
                service_id: req.params.id
            },
            attributes: {
                exclude: ['id', 'service_id', 'airline_id', 'car_id', 'hotel_id', 'restaurant_id', 'createdAt', 'updatedAt']
            },
            include: [{
                model: Service,
                as: 'service',
                include: [{
                    model: Country,
                    as: 'country'
                }]
            }, {
                model: Airline,
                as: 'airline',
            }, {
                model: Hotel,
                as: 'hotel',
            }, {
                model: Car,
                as: 'car',
            }, {
                model: Restaurant,
                as: 'restaurant',
            }]
        })
        .then((service) => res.status(200).send(service))
        .catch((error) => {
            console.log(error);
            res.status(400).send(error);
        });
};

const update = (req, res) => {
    helper.checkPermission(req.user.role_id, 'service_update').then((rolePerm) => {
        Service
            .findByPk(req.params.id)
            .then((service) => {
                if (!service) {
                    res.status(404).send({ message: "Service not found" });
                } else {
                    let country_id = req.body.country_id ? req.body.country_id : service.country_id;
                    Country
                        .findByPk(country_id)
                        .then((country) => {
                            if (!country) {
                                return res.status(400).send({ message: "Country not found" });
                            }
                            Service.update({
                                service_name: (req.body.name) ? req.body.name : service.service_name,
                                country_id: country.id
                            }, {
                                where: {
                                    id: req.params.id
                                }
                            }).then(_ => {
                                res.status(200).send({
                                    message: 'Service updated'
                                });
                            }).catch(err => res.status(400).send(err));
                        })
                        .catch((error) => {
                            res.status(400).send(error);
                        })
                }
            })
            .catch((error) => {
                res.status(400).send(error);
            })
    }).catch((error) => {
        res.status(403).send(error);
    })

}

const destroy = (req, res) => {
    helper.checkPermission(req.user.role_id, 'service_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                message: 'Please pass Service ID.'
            })
        } else {
            Service
                .findByPk(req.params.id)
                .then((service) => {
                    if (service) {
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
}

const search = async(req, res) => {
    const { count, rows } = await Service.findAndCountAll({
        where: {
            service_name: {
                [Op.substring]: `${req.params.text}`
            }
        },
        include: [{
            model: Country,
            as: 'country'
        }]
    });
    return res.status(200).send({
        count: count,
        rows: rows
    })
}

module.exports = {
    create,
    findAll,
    findOne,
    update,
    destroy,
    search
};