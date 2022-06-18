import authRouter from './authRouter.js';
import usersRouter from './usersRouter.js';
import permissionsRouter from './permissionsRouter.js';
import uploadFileRouter from './uploadFileRouter.js';
import addressRouter from './addressesRouter.js';
import addressDetailRouter from './addressesDetailRouter.js';
import countryRouter from './countryRouter.js';
import serviceRouter from './serviceRouter.js';
import refBookingOutcomeRouter from './refBookingOutcomeRouter.js';
import refBookingStatusPaymentRouter from './refBookingStatusPaymentRouter.js';
import bookingRouter from './bookingRouter.js';
import restaurantsRouter from './restaurantsRouter.js';
import airlinesRouter from './airlinesRouter.js';
import carsRouter from './carsRouter.js';
import hotelsRouter from './hotelsRouter.js';
import paymentsRouter from './paymentsRouter.js';

let apiRouter = (app) => {
    app.use('/api/v1/auth', authRouter);

    app.use('/api/v1/users', usersRouter);

    app.use('/api/v1/permissions', permissionsRouter);

    app.use('/api/v1/upload', uploadFileRouter);

    app.use('/api/v1/addresses', addressRouter);

    app.use('/api/v1/addressesdetail', addressDetailRouter);

    app.use('/api/v1/country', countryRouter);

    app.use('/api/v1/restaurants', restaurantsRouter);

    app.use('/api/v1/airlines', airlinesRouter);

    app.use('/api/v1/hotels', hotelsRouter);

    app.use('/api/v1/cars', carsRouter);

    app.use('/api/v1/services', serviceRouter);

    app.use('/api/v1/outcome', refBookingOutcomeRouter);

    app.use('/api/v1/statuspayment', refBookingStatusPaymentRouter);

    app.use('/api/v1/booking', bookingRouter);

    app.use('/api/v1/payments', paymentsRouter);
}

module.exports = apiRouter;