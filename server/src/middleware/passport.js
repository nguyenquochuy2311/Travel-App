const JwtStrategy = require('passport-jwt').Strategy,
    ExtractJwt = require('passport-jwt').ExtractJwt;

// load up the user model
const User = require('../models').User;
const config = require('../config/authConfig');
require('dotenv').config();

module.exports = function (passport) {
    const opts = {
        jwtFromRequest: ExtractJwt.fromAuthHeaderWithScheme(`${process.env.TYPE_TOKEN}`),
        secretOrKey: process.env.ACCESS_TOKEN_SECRET
    };
    passport.use('jwt', new JwtStrategy(opts, function (jwt_payload, done) {
        User
            .findByPk(jwt_payload.id)
            .then((user) => { return done(null, user); })
            .catch((error) => { return done(error, false); });
    }));
};