import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import bookingController from '../controllers/API/bookingController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), bookingController.create);

// Find All
router.get('/', passport.authenticate('jwt', {
    session: false
}), bookingController.findAll);

// Find One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), bookingController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), bookingController.update);

module.exports = router;