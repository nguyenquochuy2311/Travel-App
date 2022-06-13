import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import refBookingStatusPaymentController from '../controllers/API/refBookingStatusPaymentController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), refBookingStatusPaymentController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), refBookingStatusPaymentController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), refBookingStatusPaymentController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), refBookingStatusPaymentController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), refBookingStatusPaymentController.destroy);

module.exports = router;