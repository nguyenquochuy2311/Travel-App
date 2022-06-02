import express from 'express';
import bodyParser from 'body-parser'; //get param ?id=1 => get 1 
import cookieParser from 'cookie-parser';
import cors from 'cors';
import viewEngine from './config/viewEngine.js';
// import initWebRoutes from './routes/index.js';
import apiRouters from './routes/api.js';
import createError from 'http-errors';
import path from 'path';
// import logger from 'morgan';

require('dotenv').config();

let app = express();
let router = express.Router();

var corsOptions = {
    origin: "http://localhost:3000"
};

//config app

app.use(cors(corsOptions));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

let initWebRoutes = (app) => {
    router.get("/", (req, res) => {
        res.send("<h1>Server Started</h1>")
    });
    return app.use("/", router);
}
initWebRoutes(app);

viewEngine(app);
apiRouters(app);

// catch 404 and forward to error handler
// router.get('/notfound', function (req, res, next) {
//     next(createError(404));
// });

// error handler
// router.get('/error', function (err, req, res, next) {
//     // set locals, only providing error in development
//     res.locals.message = err.message;
//     res.locals.error = req.app.get('env') === 'development' ? err : {};

//     // render the error page
//     // res.status(err.status || 500);
//     // res.render('error');
//     res.json({
//         code: err.status || 500,
//         message: res.locals.error,
//         error: res.locals.error
//     })
// });

let port = process.env.NODE_DOCKER_PORT || 3000;

app.listen(port, () => {
    console.log(`Server started: http://localhost:${port}`)
})

module.exports = router;