import express from 'express';
import uploadFileController from "../controllers/API/upLoadFileController"
const passport = require('passport');
require('../middleware/passport')(passport);

let router = express.Router();

router.post("/", passport.authenticate('jwt', {
    session: false
}), uploadFileController.upload);

router.get("/files", passport.authenticate('jwt', {
    session: false
}), uploadFileController.getListFiles);

router.get("/files/:name", passport.authenticate('jwt', {
    session: false
}), uploadFileController.download);

module.exports = router;