import express from 'express';
import role from '../controllers/API/roleController';

let router = express.Router();

let initWebRoutes = (app) => {
    router.get("/", (req, res) => {
        res.json({
            code: 200,
            message: "Server start"
        })
    });

    // API Router List
    // Roles
    router.get("/roles", role.findAll);

    return app.use("/api", router);
}

module.exports = initWebRoutes;