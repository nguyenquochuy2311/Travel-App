import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import authController from '../controllers/API/authController';

let router = express.Router();

router.post('/signup', authController.signup);

router.post('/signin', authController.signin);

// router.post('/refreshToken', authController.refreshToken);

// router.delete('/logout', authController.logout);

module.exports = router;