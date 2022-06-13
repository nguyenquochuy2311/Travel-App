import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Outcome = require('../../models').RefBookingOutcome;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'outcome_add').then((rolePerm) => {
            if (!req.body.outcome) {
                res.status(400).send({ message: "Please pass outcome name" });
            } else {
                Outcome
                    .create({
                        outcome: req.body.outcome
                    })
                    .then((outcome) => {
                        res.status(201).send(outcome);
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
    helper.checkPermission(req.user.role_id, 'outcome_get_all').then((rolePerm) => {
            Outcome
                .findAll()
                .then((outcome) => {
                    res.status(201).send(outcome);
                })
                .catch((error) => {
                    res.status(400).send(error);
                })
        })
        .catch((error) => {
            res.status(403).send(error);
        })
}

const findOne = (req, res) => {
    helper.checkPermission(req.user.role_id, 'outcome_get').then((rolePerm) => {
            Outcome
                .findByPk(req.params.id)
                .then((outcome) => {
                    if (!outcome) {
                        res.status(404).send({ message: "Booking Outcome not found" });
                    } else {
                        res.status(200).send(outcome);
                    }
                })
                .catch((error) => {
                    res.status(400).send(error);
                })
        })
        .catch((error) => {
            res.status(403).send(error);
        })
}

const update = (req, res) => {
    helper.checkPermission(req.user.role_id, 'outcome_update').then((rolePerm) => {
            Outcome
                .findByPk(req.params.id)
                .then((outcome) => {
                    if (!outcome) {
                        return res.status(404).send({ message: "Booking Outcome not found" });
                    }
                    Outcome
                        .update({
                            outcome: (req.body.outcome) ? req.body.outcome : outcome.outcome
                        }, {
                            where: {
                                id: req.params.id
                            }
                        })
                        .then(_ => {
                            res.status(200).send({ message: "Booking Outcome updated" });
                        })
                        .catch((error) => {
                            res.status(400).send(error);
                        })
                })
                .catch((error) => {
                    res.status(400).send(error);
                })
        })
        .catch((error) => {
            res.status(403).send(error);
        })
}

const destroy = (req, res) => {
    helper.checkPermission(req.user.role_id, 'outcome_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Outcome ID.'
            })
        } else {
            Outcome
                .findByPk(req.params.id)
                .then((outcome) => {
                    if (outcome) {
                        Outcome.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Booking Outcome deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Booking Outcome not found'
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

module.exports = {
    create,
    findAll,
    findOne,
    update,
    destroy
};