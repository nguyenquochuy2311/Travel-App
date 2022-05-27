import express from 'express';

let router = express.Router();

let initWebRoutes = (app) => {
    router.get("/", (req, res) => {
        res.send("<h1>Server Started</h1>")
    });
    return app.use("/", router);
}

let initAuthRoutes = (app) => {
    router.get("/", (req, res) => {
        res.send("<h1>Auth Server Stared</h1>")
    });
    return app.use("/", router);
}

module.exports = {
    initWebRoutes: initWebRoutes,
    initAuthRoutes: initAuthRoutes
};