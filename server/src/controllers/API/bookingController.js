import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Booking = require('../../models').Booking;
const User = require('../../models').User;
const TravelAgency = require('../../models').TravelAgency;
const Outcome = require('../../models').RefBookingOutcome;
const StatusPayment = require('../../models').RefBookingStatusPayment;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'booking_add').then((rolePerm) => {
            if (!req.body.agency_id) {
                return res.status(400).send({ message: "Please pass agency_id." });
            } else {
                TravelAgency
                    .findByPk(req.body.agency_id)
                    .then(async(agency) => {
                        if (!agency)
                            return res.status(404).send({ message: "Travel Agency not found" });
                        let user_id = req.user.id;
                        console.log(user_id);
                        if (req.user.role_id === 1) {
                            if (!req.body.user_id)
                                return res.status(400).send({ message: "Please pass user_id" });
                            const currentUser = await User.findOne({
                                where: {
                                    id: req.body.user_id,
                                    role_id: 2
                                }
                            });
                            if (!currentUser)
                                return res.status(404).send({ message: "User not found" });
                            user_id = currentUser.dataValues.id;
                        }
                        Booking.create({
                                user_id: user_id,
                                travel_agency_id: req.body.agency_id,
                                outcome_id: 1,
                                status_payment_id: 1,
                                booking_details: req.body.detail
                            })
                            .then((booking) => {
                                res.status(200).send(booking);
                            })
                            .catch((error) => {
                                res.status(400).send(error);
                            })
                    })
                    .catch((error) => {
                        res.status(400).send(error);
                    })
            }
        })
        .catch((error) => {
            res.status(403).send(error);
        })
}

const findAll = (req, res) => {
    helper.checkPermission(req.user.role_id, 'booking_get_all').then((rolePerm) => {
            Booking
                .findAll({
                    attributes: {
                        exclude: ['user_id', 'travel_agency_id', 'outcome_id', 'status_payment_id']
                    },
                    include: [{
                        model: User,
                        as: 'user'
                    }, {
                        model: TravelAgency,
                        as: 'travel_agency'
                    }, {
                        model: Outcome,
                        as: 'outcome'
                    }, {
                        model: StatusPayment,
                        as: 'payment_status'
                    }]
                })
                .then((bookings) => res.status(200).send(bookings))
                .catch((error) => {
                    console.log(error);
                    res.status(400).send(error);
                });
        })
        .catch((error) => {
            res.status(403).send(error);
        })
}

const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'booking_get').then((rolePerm) => {
            Booking
                .findOne({
                    where: {
                        id: req.params.id
                    },
                    attributes: {
                        exclude: ['user_id', 'travel_agency_id', 'outcome_id', 'status_payment_id']
                    },
                    include: [{
                        model: User,
                        as: 'user'
                    }, {
                        model: TravelAgency,
                        as: 'travel_agency'
                    }, {
                        model: Outcome,
                        as: 'outcome'
                    }, {
                        model: StatusPayment,
                        as: 'payment_status'
                    }]
                })
                .then((booking) => res.status(200).send(booking))
                .catch((error) => {
                    console.log(error);
                    res.status(400).send(error);
                });
        })
        .catch((error) => {
            res.status(403).send(error);
        })
}

const update = (req, res) => {
    helper.checkPermission(req.user.role_id, 'booking_update').then(async(rolePerm) => {
            const currentBooking = await Booking.findByPk(req.params.id);
            if (!currentBooking) {
                res.status(404).send({ message: "Booking not found" });
            } else {
                if (req.user.role_id === 2 && currentBooking.dataValues.outcome_id !== 2) {
                    res.status(400).send({ message: "Update fail" });
                } else {
                    let agency_id = req.body.agency_id ? req.body.agency_id : currentBooking.dataValues.travel_agency_id;
                    TravelAgency
                        .findByPk(agency_id)
                        .then((agency) => {
                            let outcome_id = req.body.outcome_id ? req.body.outcome_id : currentBooking.dataValues.outcome_id
                            Outcome
                                .findByPk(outcome_id)
                                .then((outcome) => {
                                    let status_payment_id = req.body.status_payment_id ? req.body.status_payment_id : currentBooking.dataValues.status_payment_id
                                    StatusPayment
                                        .findByPk(status_payment_id)
                                        .then((statusPayment) => {
                                            Booking
                                                .update({
                                                    travel_agency_id: agency.id,
                                                    outcome_id: outcome.id,
                                                    status_payment_id: statusPayment.id,
                                                    booking_details: (req.body.detail) ? req.body.detail : currentBooking.dataValues.booking_details
                                                }, {
                                                    where: {
                                                        id: req.params.id
                                                    }
                                                })
                                                .then(_ => {
                                                    res.status(200).send({ message: "Updated success" });
                                                })
                                                .catch((error) => {
                                                    res.status(400).send(error);
                                                })
                                        })
                                })
                                .catch((error) => {
                                    res.status(400).send(error);
                                })
                        })
                        .catch((error) => {
                            res.status(400).send(error);
                        })
                }
            }
        })
        .catch((error) => {
            res.status(403).send(error);
        })
}

const cancel = (req, res) => {

}

module.exports = {
    create,
    findAll,
    findOne,
    update,
    cancel
};