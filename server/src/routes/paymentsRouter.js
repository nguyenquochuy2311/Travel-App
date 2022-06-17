import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import paymentController from '../controllers/API/paymentController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), paymentController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), paymentController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), paymentController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), paymentController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), paymentController.destroy);

module.exports = router;