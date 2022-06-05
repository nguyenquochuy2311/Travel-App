import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import permissionController from '../controllers/API/permissionController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), permissionController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), permissionController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), permissionController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), permissionController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), permissionController.destroy);

module.exports = router;