import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const TravelAgency = require('../../models').TravelAgency;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'travel_agency_add').then((rolePerm) => {
        if (!req.body.travel_agency_details) {
            res.status(400).send({
                message: 'Please pass travel agency details.'
            })
        } else {
            TravelAgency
                .create({
                    travel_agency_details: req.body.travel_agency_details
                })
                .then((travelagencies) => res.status(201).send(travelagencies))
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
    helper.checkPermission(req.user.role_id, 'travel_agency_update').then((rolePerm) => {
        TravelAgency
            .findByPk(req.params.id)
            .then((travelagencies) => {
                if (travelagencies) {
                    travelagencies.update({
                        travel_agency_details: (req.body.travel_agency_details) ? req.body.travel_agency_details : travelagencies.travel_agency_details
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            message: 'Travel Agency updated'
                        });
                    }).catch(err => res.status(400).send(err));
                } else {
                    res.status(400).send("Travel Agency not found");
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
    helper.checkPermission(req.user.role_id, 'travel_agency_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Travel Agency ID.'
            })
        } else {
            TravelAgency
                .findByPk(req.params.id)
                .then((travelagencies) => {
                    if (travelagencies) {
                        TravelAgency.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Travel Agency deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Travel Agency not found'
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
    helper.checkPermission(req.user.role_id, 'travel_agency_get_all').then((rolePerm) => {
        TravelAgency
            .findAll()
            .then((travelagencies) => res.status(200).send(travelagencies))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

// Find a single "Table" with an id
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'travel_agency_get').then((rolePerm) => {
        TravelAgency
            .findByPk(req.params.id)
            .then((travelagencies) => {
                if (!travelagencies) {
                    res.status(404).send({ message: "Travel Agency not found" });
                } else {
                    res.status(200).send(travelagencies);
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