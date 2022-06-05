import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import travelAgencyController from '../controllers/API/travelAgencyController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), travelAgencyController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), travelAgencyController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), travelAgencyController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), travelAgencyController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), travelAgencyController.destroy);

module.exports = router;