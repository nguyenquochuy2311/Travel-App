import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Country = require('../../models').Country;
const uploadFileMiddleware = require("../../middleware/upload");

const create = async (req, res) => {
    try {
        await uploadFileMiddleware(req, res);
        helper.checkPermission(req.user.role_id, 'country_add').then((rolePerm) => {
            if (!req.body.country_name || !req.file || req.file === undefined) {
                res.status(400).send({
                    message: 'Please pass country name, country image.'
                })
            } else {
                Country
                    .create({
                        country_name: req.body.country_name,
                        country_image: req.file.filename
                    })
                    .then((countries) => res.status(201).send(countries))
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
    Country
        .findAll()
        .then((countries) => res.status(200).send(countries))
        .catch((error) => {
            res.status(400).send(error);
        });
};
// Find a single "Table" with an id
const findOne = (req, res) => {
    Country
        .findByPk(req.params.id)
        .then((country) => {
            if (!country) {
                res.status(404).send({ message: "Country not found" });
            } else {
                res.status(200).send(country);
            }
        })
        .catch((error) => {
            res.status(400).send(error);
        });
};
// Update a "Table" by the id in the request
const update = async (req, res) => {
    try {
        await uploadFileMiddleware(req, res);
        helper.checkPermission(req.user.role_id, 'country_update').then((rolePerm) => {
            Country
                .findByPk(req.params.id)
                .then((country) => {
                    if (country) {
                        Country.update({
                            country_name: (req.body.country_name) ? req.body.country_name : country.country_name,
                            country_image: (req.file && req.file !== undefined) ? req.file.filename : country.country_image
                        }, {
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Country updated'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(400).send("Country not found");
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
    helper.checkPermission(req.user.role_id, 'country_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Country ID.'
            })
        } else {
            Country
                .findByPk(req.params.id)
                .then((country) => {
                    if (country) {
                        Country.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Country deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Country not found'
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

