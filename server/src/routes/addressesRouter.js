import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import addressController from '../controllers/API/addressController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), addressController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), addressController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), addressController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), addressController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), addressController.destroy);

module.exports = router;