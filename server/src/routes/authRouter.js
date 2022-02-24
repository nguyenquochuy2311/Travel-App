import express from 'express';
const passport = require('passport');
require('../config/passport')(passport);

import authController from '../controllers/API/authController';

let router = express.Router();

router.post('/signup', passport.authenticate('jwt', {
    session: false
}), authController.signup);

router.post('/signin', passport.authenticate('jwt', {
    session: false
}), authController.signin);

module.exports = router;