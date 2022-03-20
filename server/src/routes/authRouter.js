import express from 'express';
const passport = require('passport');
require('../config/passport')(passport);

import authController from '../controllers/API/authController';

let router = express.Router();

router.post('/signup', authController.signup);

router.post('/signin', authController.signin);

router.put('/logout', authController.logout);

module.exports = router;