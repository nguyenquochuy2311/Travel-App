import express from 'express';
import serviceController from "../controllers/API/serviceController"
const passport = require('passport');
require('../middleware/passport')(passport);

let router = express.Router();

router.get('/', serviceController.findAll);

module.exports = router;