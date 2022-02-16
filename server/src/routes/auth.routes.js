import express from 'express';
const { verifySignUp } = require("../middleware");
const controller = require("../controllers/API/authController");

let router = express.Router();

module.exports = function(app) {
    app.use(function(req, res, next) {
        res.header(
            "Access-Control-Allow-Headers",
            "x-access-token, Origin, Content-Type, Accept"
        );
        next();
    });
    app.post(
        "/auth/signup", [
            verifySignUp.checkDuplicateUsernameOrEmail,
            verifySignUp.checkRolesExisted
        ],
        controller.signup
    );
    app.post("/auth/signin", controller.signin);

    return app.use("/api", router);
};