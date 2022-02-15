import express from 'express';
import bodyParser from 'body-parser';//get param ?id=1 => get 1 
import cors from 'cors';
import viewEngine from './config/viewEngine.js';
import initWebRoutes from './route/web.js';

require('dotenv').config();

let app = express();

var corsOptions = {
    origin: "http://localhost:3000"
};

//config app

app.use(cors(corsOptions));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));


// db.sequelize.sync();
// db.sequelize.sync({ force: true }).then(() => {
//     console.log("Drop and re-sync db.");
// });

viewEngine(app);
initWebRoutes(app);

let port = process.env.NODE_DOCKER_PORT || 3000;

app.listen(port, () => {
    console.log(`Server started: http://localhost:${port}`)
})