import express from 'express';

let router = express.Router();

let initWebRoutes = (app) => {
    router.get("/", (req, res) => {
        res.json({
            code: 200,
            message: "OK"
        })
    });
    return app.use("/api", router);
}

module.exports = initWebRoutes;