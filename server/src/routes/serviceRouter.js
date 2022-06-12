import express from 'express';

const passport = require('passport');
require('../middleware/passport')(passport);

import serviceController from '../controllers/API/serviceController';

let router = express.Router();

router.post('/', passport.authenticate('jwt', {
    session: false
}), serviceController.create);

router.get('/', serviceController.findAll);

router.get('/:id', serviceController.findOne);

router.put('/:id', passport.authenticate('jwt', {
    session: false
}), serviceController.update);

router.delete('/:id', passport.authenticate('jwt', {
    session: false
}), serviceController.destroy);

router.get('/search/:text', serviceController.search)

module.exports = router;