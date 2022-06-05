import usersRouter from './usersRouter.js';
import permissionsRouter from './permissionsRouter.js';
import uploadFileRouter from './uploadFileRouter.js';
import addressRouter from './addressesRouter.js';
import addressDetailRouter from './addressesDetailRouter.js';
import travelAgenciesRouter from './travelAgenciesRouter.js';
import servicesRouter from './servicesRouter.js';
import restaurantsRouter from './restaurantsRouter.js';
import refBookingStatusPaymentsRouter from './refBookingStatusPaymentsRouter.js';
import refBookingOutcomesRouter from './refBookingOutcomesRouter.js';

let apiRouter = (app) => {
    // app.use('/api/v1/auth', authRouter);

    app.use('/api/v1/users', usersRouter);

    app.use('/api/v1/permissions', permissionsRouter);

    app.use('/api/v1/upload', uploadFileRouter);

    app.use('/api/v1/addresses', addressRouter);

    app.use('/api/v1/addressesdetail', addressDetailRouter);

    app.use('/api/v1/travelagencies', travelAgenciesRouter);

    app.use('/api/v1/services', servicesRouter);

    app.use('/api/v1/services', restaurantsRouter);

    app.use('/api/v1/services', refBookingStatusPaymentsRouter);

    app.use('/api/v1/services', refBookingOutcomesRouter);
}

module.exports = apiRouter;