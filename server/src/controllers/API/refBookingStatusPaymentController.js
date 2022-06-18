import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const StatusPayment = require('../../models').RefBookingStatusPayment;

const create = (req, res) => {
    helper.checkPermission(req.user.role_id, 'status_payment_add').then((rolePerm) => {
        if (!req.body.status) {
            res.status(400).send({ message: "Please pass status payment" });
        } else {
            StatusPayment
                .create({
                    status: req.body.status
                })
                .then((status) => {
                    res.status(201).send(status);
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
    helper.checkPermission(req.user.role_id, 'status_payment_get_all').then((rolePerm) => {
        StatusPayment
            .findAll()
            .then((status) => {
                res.status(201).send(status);
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
    helper.checkPermission(req.user.role_id, 'status_payment_get').then((rolePerm) => {
        StatusPayment
            .findByPk(req.params.id)
            .then((status) => {
                if (!status) {
                    res.status(404).send({ message: "Status Payment not found" });
                } else {
                    res.status(200).send(status);
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
    helper.checkPermission(req.user.role_id, 'status_payment_update').then((rolePerm) => {
        StatusPayment
            .findByPk(req.params.id)
            .then((status) => {
                if (!status) {
                    return res.status(404).send({ message: "Status Payment not found" });
                }
                StatusPayment
                    .update({
                        status: (req.body.status) ? req.body.status : status.status
                    }, {
                        where: {
                            id: req.params.id
                        }
                    })
                    .then(_ => {
                        res.status(200).send({ message: "Status Payment updated" });
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
    helper.checkPermission(req.user.role_id, 'status_payment_delete').then((rolePerm) => {
        if (!req.params.id) {
            res.status(400).send({
                msg: 'Please pass Status Payment ID.'
            })
        } else {
            StatusPayment
                .findByPk(req.params.id)
                .then((status) => {
                    if (status) {
                        StatusPayment.destroy({
                            where: {
                                id: req.params.id
                            }
                        }).then(_ => {
                            res.status(200).send({
                                message: 'Status Payment deleted'
                            });
                        }).catch(err => res.status(400).send(err));
                    } else {
                        res.status(404).send({
                            message: 'Status Payment not found'
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