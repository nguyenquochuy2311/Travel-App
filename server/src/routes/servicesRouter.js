import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import serviceController from '../controllers/API/serviceController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), serviceController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), serviceController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), serviceController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), serviceController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), serviceController.destroy);

module.exports = router;