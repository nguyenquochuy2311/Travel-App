import authRouter from './authRouter.js';
import usersRouter from './usersRouter.js';
import permissionsRouter from './permissionsRouter.js';

let apiRouter = (app) => {
    app.use('/api/v1/auth', authRouter);

    app.use('/api/v1/users', usersRouter);

    app.use('/api/v1/permissions', permissionsRouter);
}

module.exports = apiRouter;