import express from 'express';
import authRouter from './authRouter.js';
import usersRouter from './usersRouter.js';
let router = express.Router();

let apiRouter = (app) => {
    app.use('/auth', authRouter);
    app.use('/users', usersRouter);

    return app.use("/api/v1", router);
}

module.exports = apiRouter;