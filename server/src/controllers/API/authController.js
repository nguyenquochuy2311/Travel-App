import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';
// import fs from 'fs';

const staticPath = require('../../config/pathStaticFile');
const fs = require('fs');
const path = require('path');
const formidable = require('formidable');

const passport = require('passport');
require('../../middleware/passport')(passport);

const User = require('../../models').User;
const Role = require('../../models').Role;
const TokenManagement = require('../../models').TokenManagement;

require('dotenv').config();

exports.signup = (req, res) => {
    if (req.body.avatar) {
        console.log(req.body.avatar);
    } else {
        console.log('no');
    }
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
                    user_avatar: req.body.avatar,
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
                const refreshToken = generateRefreshToken(user);
                TokenManagement
                    .create({
                        refresh_token: refreshToken,
                        access_token: accessToken,
                        type_token: process.env.TYPE_TOKEN,
                        user_id: user.id,
                        access_token_secret: bcrypt.hashSync(process.env.ACCESS_TOKEN_SECRET, bcrypt.genSaltSync(10), null),
                        refresh_token_secret: bcrypt.hashSync(process.env.REFRESH_TOKEN_SECRET, bcrypt.genSaltSync(10), null),
                        expired_at: Date.now() + 1000 * 60 * 60 * 24
                    })
                    .then(_ => {
                        res.cookie("refreshToken", refreshToken, {
                            httpOnly: true,
                            secure: false,//when deployt set -> true
                            path: "/",
                            sameSite: "strict"
                        });
                        res.status(200).json({
                            accessToken: `${process.env.TYPE_TOKEN} ` + accessToken
                        });
                    })
                    .catch((error) => {
                        res.status(400).send(error);
                    });
            } else {
                res.status(401).send({
                    message: 'Authentication failed. Wrong password.'
                });
            }
        })
        .catch((error) => res.status(400).send(error));
}

function generateAccessToken(user) {
    return jwt.sign(JSON.parse(JSON.stringify(user)), process.env.ACCESS_TOKEN_SECRET, { expiresIn: '1d' });
}

function generateRefreshToken(user) {
    return jwt.sign(JSON.parse(JSON.stringify(user)), process.env.REFRESH_TOKEN_SECRET, { expiresIn: '365d' });
}

exports.refreshToken = (req, res) => {
    const refreshToken = req.cookies.refreshToken;
    if (refreshToken == null) {
        return res.sendStatus(401).send({
            message: 'Authentication failed'
        });
    }
    TokenManagement
        .findOne({
            where: {
                refresh_token: refreshToken
            }
        })
        .then((token_manager) => {
            if (!token_manager) {
                return res.status(403).send({
                    message: 'Refresh Token is not valid'
                });
            }
            jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, data) => {
                if (err) {
                    console.log(err, data);
                    return res.status(403);
                }
                User
                    .findByPk(token_manager.user_id)
                    .then((user) => {
                        const newAccessToken = generateAccessToken(user);
                        // const newRefreshToken = jwt.sign(data, process.env.REFRESH_TOKEN_SECRET);
                        // res.cookie("refreshToken", newRefreshToken, {
                        //     httpOnly: true,
                        //     secure: false,//when deployt set -> true
                        //     path: "/",
                        //     sameSite: "strict"
                        // });
                        TokenManagement.update({
                            access_token: newAccessToken,
                            type_token: process.env.TYPE_TOKEN,
                            access_token_secret: process.env.ACCESS_TOKEN_SECRET,
                            user_id: token_manager.user_id,
                            access_token_secret: bcrypt.hashSync(process.env.ACCESS_TOKEN_SECRET, bcrypt.genSaltSync(10), null),
                            refresh_token_secret: bcrypt.hashSync(process.env.REFRESH_TOKEN_SECRET, bcrypt.genSaltSync(10), null),
                            expired_at: Date.now() + 1000 * 60 * 60 * 24
                        }, {
                            where: {
                                refresh_token: token_manager.refresh_token || refreshToken
                            }
                        }).then(_ => {
                            return res.json({ accessToken: `${process.env.TYPE_TOKEN} ` + newAccessToken });
                        }).catch(err => res.status(400).send(err));
                    })
                    .catch((error) => {
                        return res.status(400).send(error);
                    });
            });
        })
        .catch((error) => res.status(400).send(error));
}

exports.logout = (req, res) => {
    const refreshToken = req.cookies.refreshToken;
    if (refreshToken == null) {
        return res.sendStatus(401).send({
            message: 'Authentication failed'
        });
    }
    TokenManagement
        .findByPk(refreshToken)
        .then((token_manager) => {
            if (token_manager) {
                token_manager.destroy({
                    where: {
                        refresh_token: refreshToken
                    }
                }).then(_ => {
                    res.status(200).send({
                        message: 'Logout successful'
                    });
                }).catch(err => res.status(400).send(err));
            }
        }).catch((error) => {
            res.status(400).send(error);
        });
}