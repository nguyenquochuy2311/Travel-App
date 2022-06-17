import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import restaurantController from '../controllers/API/restaurantController';

let router = express.Router();

// Create
router.post('/', passport.authenticate('jwt', {
    session: false
}), restaurantController.create);

// Get List
router.get('/', passport.authenticate('jwt', {
    session: false
}), restaurantController.findAll);

// Get One
router.get('/:id', passport.authenticate('jwt', {
    session: false
}), restaurantController.findOne);

// Update
router.put('/:id', passport.authenticate('jwt', {
    session: false
}), restaurantController.update);

// Delete
router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), restaurantController.destroy);

module.exports = router;