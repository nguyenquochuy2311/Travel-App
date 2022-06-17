import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import airlineController from '../controllers/API/airlineController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), airlineController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), airlineController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), airlineController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), airlineController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), airlineController.destroy);

module.exports = router;