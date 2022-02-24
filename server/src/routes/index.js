import express from 'express';

let router = express.Router();

let initWebRoutes = (app) => {
    router.get("/", (req, res) => {
        res.json({
            code: 200,
            message: "Server start"
        })
    });

    return app.use("/", router);
}

module.exports = initWebRoutes;