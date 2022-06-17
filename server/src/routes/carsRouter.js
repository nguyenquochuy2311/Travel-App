import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import carController from '../controllers/API/carController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), carController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), carController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), carController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), carController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), carController.destroy);

module.exports = router;