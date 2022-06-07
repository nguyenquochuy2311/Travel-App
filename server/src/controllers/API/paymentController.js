import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Booking = require('../../models').Booking;
const Payment = require('../../models').Payment;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'payment_add').then((rolePerm) => {
        if (!req.body.booking_id) {
            return res.status(400).send({
                message: 'Please pass Booking ID.'
            })
        } else {
            Booking.findOne({
                where: {
                    id: req.body.booking_id
                }
            }).then((booking) => {
                if (!booking) {
                    return res.status(400).send({
                        message: 'Not Found Booking ID = ' + req.body.booking_id,
                    });
                }
                Payment
                    .create({
                        booking_id: req.body.booking_id,
                        payment_amount: req.body.payment_amount,
                        other_details: (req.body.other_details) ? req.body.other_details : ""
                    })
                    .then((payment) => res.status(201).send(payment))
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
    helper.checkPermission(req.user.role_id, 'payment_get_all').then((rolePerm) => {
        Payment
            .findAll({
                include: [{
                    model: Booking,
                    as: 'booking'
                }]
            })
            .then((payment) => res.status(200).send(payment))
            .catch((error) => {
                res.status(400).send(error);
            });
    }).catch((error) => {
        res.status(403).send(error);
    });
};
// Find a single "Table" with an id
const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'payment_get').then((rolePerm) => {
        Payment.findOne({
            include: [{
                model: Booking,
                as: 'booking'
            }]
        }, {
            where: {
                id: req.params.id
            }
        }).then((payment) => {
            if (!payment) {
                res.status(404).send({ message: "Payment not found" });
            } else {
                res.status(200).send(payment);
            }
        }).catch((error) => {
            res.status(400).send(error);
        });
    }).catch((error) => {
        res.status(403).send(error);
    });
};
// Update a "Table" by the id in the request
const update = async (req, res) => {
    helper.checkPermission(req.user.role_id, 'payment_update').then((rolePerm) => {
        Payment
            .findByPk(req.params.id)
            .then((payment) => {
                Booking
                    .findByPk(req.body.booking_id)
                    .then((booking) => {
                        if (booking) {
                            Payment.update({
                                booking_id: (req.body.booking_id) ? req.body.booking_id : booking.booking_id,
                                payment_amount: (req.body.payment_amount) ? req.body.payment_amount : payment.payment_amount,
                                other_details: (req.body.other_details) ? req.body.other_details : payment.booking_id
                            }, {
                                where: {
                                    id: req.params.id
                                }
                            }).then(_ => {
                                res.status(200).send({
                                    message: 'Payment updated'
                                });
                            }).catch((err) => res.status(400).send({ message: err }));
                        } else {
                            res.status(400).send({
                                message: 'Note Found Booking ID = ' + req.body.booking_id
                            });
                        }
                    }).catch((err) => {
                        res.status(400).send({
                            message: err
                        });
                    })
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
    helper.checkPermission(req.user.role_id, 'payment_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Payment ID.'
            })
        } else {
            Payment
                .findByPk(req.params.id)
                .then((payment) => {
                    if (payment) {
                        Payment.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Payment deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Payment not found'
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

