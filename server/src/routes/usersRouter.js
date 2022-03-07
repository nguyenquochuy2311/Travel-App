import express from 'express';
const passport = require('passport');
require('../config/passport')(passport);

import userController from '../controllers/API/userController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), userController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), userController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), userController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), userController.update);     

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), userController.delete);

module.exports = router;