const jwt = require('jsonwebtoken');
require('dotenv').config();
const passport = require('passport');
require('../../config/passport')(passport);
const User = require('../../models').User;
const Role = require('../../models').Role;
const bcrypt = require('bcryptjs');
const config = require('../../config/authConfig');
const cookie = require('cookie');

let refreshTokens = [];

exports.signup = async (req, res) => {
    if (!req.body.email || !req.body.password || !req.body.fullname || !req.body.role_id) {
        res.status(400).send({
            message: 'Please pass email, password, name, id of role'
        })
    } else {
        Role.findOne({
            where: {
                id: req.body.role_id
            }
        }).then((role) => {
            if (!role) {
                return res.status(401).send({
                    message: 'Not Found ID Role = ' + req.body.role_id,
                });
            }
            User
                .create({
                    user_email: req.body.email,
                    user_password: bcrypt.hashSync(req.body.password, bcrypt.genSaltSync(10), null),
                    user_fullname: req.body.fullname,
                    user_phone: req.body.phone,
                    role_id: role.id
                })
                .then((user) => res.status(201).send(user))
                .catch((error) => {
                    res.status(400).send(error);
                });
        }).catch((error) => {
            res.status(400).send(error);
        });
    }
};

exports.signin = (req, res) => {
    User
        .findOne({
            where: {
                user_email: req.body.email
            }
        })
        .then((user) => {
            if (!user) {
                return res.status(401).send({
                    message: 'Authentication failed. User not found.',
                });
            }
            var passwordIsValid = bcrypt.compareSync(req.body.password, user.user_password);
            if (passwordIsValid) {
                const accessToken = generateAccessToken(user);
                jwt.verify(accessToken, process.env.ACCESS_TOKEN_SECRET, function (err, data) {
                    console.log(err, data);
                });
                const refreshToken = jwt.sign(JSON.parse(JSON.stringify(user)), process.env.REFRESH_TOKEN_SECRET);
                refreshTokens.push(refreshToken);
                res.cookie("refreshToken", refreshToken, {
                    httpOnly: true,
                    secure: false,//when deployt set -> true
                    path: "/",
                    sameSite: "strict"
                });
                res.status(200).json({
                    success: true,
                    accessToken: 'JWT ' + accessToken
                });
            } else {
                res.status(401).send({
                    success: false,
                    message: 'Authentication failed. Wrong password.'
                });
            }
        })
        .catch((error) => res.status(400).send(error));
}

function generateAccessToken(user) {
    return jwt.sign(JSON.parse(JSON.stringify(user)), process.env.ACCESS_TOKEN_SECRET, { expiresIn: '10s' });
}

exports.refreshToken = (req, res) => {
    const refreshToken = req.cookies.refreshToken;
    if (refreshToken == null)
        return res.sendStatus(401).send({
            success: false,
            message: 'Authentication failed'
        });
    if (!refreshTokens.includes(refreshToken))
        return res.status(403).send({
            success: false,
            message: 'Refresh Token is not valid'
        });
    jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, data) => {
        if (err) {
            console.log(err, data);
            return res.status(403);
        }
        const newAccessToken = jwt.sign(data, process.env.ACCESS_TOKEN_SECRET, {
            expiresIn: '10s' //24 hours
        });
        const newRefreshToken = jwt.sign(data, process.env.REFRESH_TOKEN_SECRET);
        res.cookie("refreshToken", newRefreshToken, {
            httpOnly: true,
            secure: false,//when deployt set -> true
            path: "/",
            sameSite: "strict"
        });
        res.json({ accessToken: 'JWT ' + newAccessToken });
    });
}

exports.logout = (req, res) => {
    const refreshToken = req.header('Authorization');

    refreshTokens = refreshTokens.filter((token) => token !== refreshToken);
    res.status(204).send({
        message: 'Logout successful'
    });
}