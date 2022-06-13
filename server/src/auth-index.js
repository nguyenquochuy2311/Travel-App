import express from 'express';
import bodyParser from 'body-parser'; //get param ?id=1 => get 1 
// import initAuthRoutes from './routes/index';
import authRouter from './routes/authRouter';

require('dotenv').config();

let app = express();
let router = express.Router();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

let initAuthRoutes = (app) => {
    router.get("/", (req, res) => {
        res.send("<h1>Auth Server Stared</h1>")
    });
    return app.use("/", router);
}

initAuthRoutes(app);

app.use('/api/v1/auth', authRouter);

let port = process.env.NODE_AUTH_DOCKER_PORT || 4000;
app.listen(port, () => {
    console.log(`Auth Server started: http://localhost:${port}`)
})

module.exports = router;