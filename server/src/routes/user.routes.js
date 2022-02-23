import express from 'express';
const { authJwt } = require("../middleware");
const controller = require("../controllers/API/userController");

let router = express.Router();

let userRoutes = (app) => {
    app.use(function(req, res, next) {
        res.header(
            "Access-Control-Allow-Headers",
            "x-access-token, Origin, Content-Type, Accept"
        );
        next();
    });
    router.get("/test/all", controller.allAccess);
    router.get(
        "/test/user", [authJwt.verifyToken],
        controller.userBoard
    );
    router.get(
        "/test/mod", [authJwt.verifyToken, authJwt.isModerator],
        controller.moderatorBoard
    );
    router.get(
        "/test/admin", [authJwt.verifyToken, authJwt.isAdmin],
        controller.adminBoard
    );

    return app.use("/api", router);
};

module.exports = userRoutes;