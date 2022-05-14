// import express from 'express';

// const passport = require('passport');
// require('../middleware/passport')(passport);

// import uploadFileController from '../controllers/API/uploadFileController';

// let router = express.Router();

// router.post("/upload", passport.authenticate('jwt', {
//     session: false
// }), uploadFileController.upload);

// router.get("/files", passport.authenticate('jwt', {
//     session: false
// }), uploadFileController.getListFiles);

// router.get("/files/:name", passport.authenticate('jwt', {
//     session: false
// }), uploadFileController.download);

// module.exports = router;