import express from 'express';
import bodyParser from 'body-parser'; //get param ?id=1 => get 1 
import authRouter from './routes/authRouter.js';
import cookieParser from 'cookie-parser';

let app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

app.use(cookieParser());

app.use('/api/v1/auth', authRouter);

let port = 4000;

app.listen(port, () => {
    console.log(`Auth Server started: http://localhost:${port}`)
})

