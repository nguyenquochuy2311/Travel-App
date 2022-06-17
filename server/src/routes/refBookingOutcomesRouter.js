import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import refBookingOutcomeController from '../controllers/API/refBookingOutcomeController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), refBookingOutcomeController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), refBookingOutcomeController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), refBookingOutcomeController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), refBookingOutcomeController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), refBookingOutcomeController.destroy);

module.exports = router;