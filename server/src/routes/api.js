import usersRouter from './usersRouter.js';
import permissionsRouter from './permissionsRouter.js';
import uploadFileRouter from './uploadFileRouter.js';
import addressRouter from './addressesRouter.js';
import addressDetailRouter from './addressesDetailRouter.js';
import countryRouter from './countryRouter.js';
import serviceRouter from './serviceRouter.js';
import refBookingOutcomeRouter from './refBookingOutcomeRouter.js';
import refBookingStatusPaymentRouter from './refBookingStatusPayment.js';

let apiRouter = (app) => {
    // app.use('/api/v1/auth', authRouter);

    app.use('/api/v1/users', usersRouter);

    app.use('/api/v1/permissions', permissionsRouter);

    app.use('/api/v1/upload', uploadFileRouter);

    app.use('/api/v1/addresses', addressRouter);

    app.use('/api/v1/addressesdetail', addressDetailRouter);

    app.use('/api/v1/country', countryRouter);

    app.use('/api/v1/services', serviceRouter);

    app.use('/api/v1/outcome', refBookingOutcomeRouter);

    app.use('/api/v1/statuspayment', refBookingStatusPaymentRouter);
}

module.exports = apiRouter;