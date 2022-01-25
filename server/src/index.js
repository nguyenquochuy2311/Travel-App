import express from 'express';
import bodyParser from 'body-parser';//get param ?id=1 => get 1 
import viewEngine from './config/viewEngine';
import initWebRoutes from './route/web';
require('dotenv').config();

let app = express();

//config app

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

viewEngine(app);
initWebRoutes(app);

let port = process.env.PORT;

app.listen(port, () => {
    console.log("Server started: http://localhost:" + port)
})