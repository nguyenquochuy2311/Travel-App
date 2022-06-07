import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import countryController from '../controllers/API/countryController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), countryController.create);

// Get List
router.get('/', countryController.findAll);

// Get One
router.get('/:id', countryController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), countryController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), countryController.destroy);

module.exports = router;