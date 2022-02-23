import express from 'express';
const { verifySignUp } = require("../middleware");
const controller = require("../controllers/API/authController");

let router = express.Router();

let authRoutes = (app) => {
    app.use(function(req, res, next) {
        res.header(
            "Access-Control-Allow-Headers",
            "x-access-token, Origin, Content-Type, Accept"
        );
        next();
    });

    router.post(
        "/auth/signup", [
            verifySignUp.checkDuplicateEmailOrPhone,
            verifySignUp.checkRolesExisted
        ],
        controller.signup
    );

    router.post("/auth/signin", controller.signin);

    return app.use("/api", router);
};

module.exports = authRoutes;