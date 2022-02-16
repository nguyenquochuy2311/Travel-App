import express from 'express';
const { authJwt } = require("../middleware");
const controller = require("../controllers/API/userController");

let router = express.Router();

module.exports = function(app) {
    app.use(function(req, res, next) {
        res.header(
            "Access-Control-Allow-Headers",
            "x-access-token, Origin, Content-Type, Accept"
        );
        next();
    });
    app.get("/test/all", controller.allAccess);
    app.get(
        "/test/user", [authJwt.verifyToken],
        controller.userBoard
    );
    app.get(
        "/test/mod", [authJwt.verifyToken, authJwt.isCustomer],
        controller.moderatorBoard
    );
    app.get(
        "/test/admin", [authJwt.verifyToken, authJwt.isAdmin],
        controller.adminBoard
    );

    return app.use("/api", router);
};