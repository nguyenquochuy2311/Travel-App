import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const RefBookingStatusPayment = require('../../models').RefBookingStatusPayment;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'ref_booking_status_payment_add').then((rolePerm) => {
        if (!req.body.status_description) {
            res.status(400).send({
                message: 'Please pass Ref Booking Status Payment Description.'
            })
        } else {
            RefBookingStatusPayment
                .create({
                    status_description: req.body.status_description
                })
                .then((refbookingstatuspayments) => res.status(201).send(refbookingstatuspayments))
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
    helper.checkPermission(req.user.role_id, 'ref_booking_status_payment_update').then((rolePerm) => {
        RefBookingStatusPayment
            .findByPk(req.params.id)
            .then((refbookingstatuspayments) => {
                if (refbookingstatuspayments) {
                    refbookingstatuspayments.update({
                        status_description: (req.body.status_description) ? req.body.status_description : refbookingstatuspayments.status_description
                    }, {
                        where: {
                            id: req.params.id
                        }
                    }).then(_ => {
                        res.status(200).send({
                            message: 'Ref Booking Status Payment updated'
                        });
                    }).catch(err => res.status(400).send(err));
                } else {
                    res.status(400).send("Ref Booking Status Payment not found");
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
    helper.checkPermission(req.user.role_id, 'ref_booking_status_payment_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Ref Booking Status Payment ID.'
            })
        } else {
            RefBookingStatusPayment
                .findByPk(req.params.id)
                .then((refbookingstatuspayments) => {
                    if (refbookingstatuspayments) {
                        RefBookingStatusPayment.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Ref Booking Status Payment deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Ref Booking Status Payment not found'
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
    helper.checkPermission(req.user.role_id, 'ref_booking_status_payment_get_all').then((rolePerm) => {
        RefBookingStatusPayment
            .findAll()
            .then((refbookingstatuspayments) => res.status(200).send(refbookingstatuspayments))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};

// Find a single "Table" with an id
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'ref_booking_status_payment_get').then((rolePerm) => {
        RefBookingStatusPayment
            .findByPk(req.params.id)
            .then((refbookingstatuspayments) => {
                if (!refbookingstatuspayments) {
                    res.status(404).send({ message: "Ref Booking Status Payment not found" });
                } else {
                    res.status(200).send(refbookingstatuspayments);
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