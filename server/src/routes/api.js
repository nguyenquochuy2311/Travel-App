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
import airlinesRouter from './airlinesRouter.js';
import carsRouter from './carsRouter.js';
import hotelsRouter from './hotelsRouter.js';
import paymentsRouter from './paymentsRouter.js';

let apiRouter = (app) => {
    // app.use('/api/v1/auth', authRouter);

    app.use('/api/v1/users', usersRouter);

    app.use('/api/v1/permissions', permissionsRouter);

    app.use('/api/v1/upload', uploadFileRouter);

    app.use('/api/v1/addresses', addressRouter);

    app.use('/api/v1/addressesdetail', addressDetailRouter);

    app.use('/api/v1/travelagencies', travelAgenciesRouter);

    app.use('/api/v1/services', servicesRouter);

    app.use('/api/v1/restaurants', restaurantsRouter);

    app.use('/api/v1/refBookingStatusPayments', refBookingStatusPaymentsRouter);

    app.use('/api/v1/refBookingOutcomes', refBookingOutcomesRouter);

    app.use('/api/v1/airlines', airlinesRouter);

    app.use('/api/v1/cars', carsRouter);

    app.use('/api/v1/hotels', hotelsRouter);

    app.use('/api/v1/payments', paymentsRouter);
}

module.exports = apiRouter;