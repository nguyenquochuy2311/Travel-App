import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const RefBookingOutcome = require('../../models').RefBookingOutcome;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'ref_booking_outcome_add').then((rolePerm) => {
        if (!req.body.outcome_description) {
            res.status(400).send({
                message: 'Please pass Ref Booking Outcome Description.'
            })
        } else {
            RefBookingOutcome
                .create({
                    outcome_description: req.body.outcome_description
                })
                .then((refbookingoutcomes) => res.status(201).send(refbookingoutcomes))
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
    helper.checkPermission(req.user.role_id, 'ref_booking_outcome_update').then((rolePerm) => {
        RefBookingOutcome
            .findByPk(req.params.id)
            .then((refbookingoutcomes) => {
                if (refbookingoutcomes) {
                    refbookingoutcomes.update({
                        outcome_description: (req.body.outcome_description) ? req.body.outcome_description : refbookingoutcomes.outcome_description
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            message: 'Ref Booking Outcome updated'
                        });
                    }).catch(err => res.status(400).send(err));
                } else {
                    res.status(400).send("Ref Booking Outcome not found");
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
    helper.checkPermission(req.user.role_id, 'ref_booking_outcome_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Ref Booking Outcome ID.'
            })
        } else {
            RefBookingOutcome
                .findByPk(req.params.id)
                .then((refbookingoutcomes) => {
                    if (refbookingoutcomes) {
                        RefBookingOutcome.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Ref Booking Outcome deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Ref Booking Outcome not found'
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
    helper.checkPermission(req.user.role_id, 'ref_booking_outcome_get_all').then((rolePerm) => {
        RefBookingOutcome
            .findAll()
            .then((refbookingoutcomes) => res.status(200).send(refbookingoutcomes))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

// Find a single "Table" with an id
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'ref_booking_outcome_get').then((rolePerm) => {
        RefBookingOutcome
            .findByPk(req.params.id)
            .then((refbookingoutcomes) => {
                if (!refbookingoutcomes) {
                    res.status(404).send({ message: "Ref Booking Outcome not found" });
                } else {
                    res.status(200).send(refbookingoutcomes);
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