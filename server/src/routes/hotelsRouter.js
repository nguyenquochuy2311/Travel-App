import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import hotelController from '../controllers/API/hotelController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), hotelController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), hotelController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), hotelController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), hotelController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), hotelController.destroy);

module.exports = router;