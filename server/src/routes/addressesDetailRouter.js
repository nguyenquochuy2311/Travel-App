import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import addressDetailController from '../controllers/API/addressDetailController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), addressDetailController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), addressDetailController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), addressDetailController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), addressDetailController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), addressDetailController.destroy);

module.exports = router;