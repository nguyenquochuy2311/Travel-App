import express from 'express';
const passport = require('passport');
require('../config/passport')(passport);

import authController from '../controllers/API/authController';

let router = express.Router();

router.post('/signup', authController.signup);

router.post('/signin', authController.signin);

router.get('/test', authController.test);

module.exports = router;