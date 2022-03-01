import express from 'express';
import authRouter from './authRouter.js';
import usersRouter from './usersRouter.js';

let apiRouter = (app) => {
    app.use('/api/v1/auth', authRouter);

    app.use('/api/v1/users', usersRouter);
}

module.exports = apiRouter;