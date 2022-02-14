import express from 'express';
import contactController from "../controllers/contactController";

let router = express.Router();

let initWebRoutes = (app) => {
    router.get("/", (req, res) => {
        res.json({
            code: 200,
            message: "Server start"
        })
    });

    // API Test
    router.get("/contact", contactController.getContacts);

    return app.use("/api", router);
}

module.exports = initWebRoutes;