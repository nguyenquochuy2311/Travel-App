import Helper from '../../utils/helper';
const helper = new Helper();

const passport = require('passport');
require('../../middleware/passport')(passport);

const Service = require('../../models/service').Service;
const Country = require('../../models/country').Country;
const Airline = require('../../models/airline').Airline;
const Car = require('../../models/car').Car;
const Hotel = require('../../models/hotel').Hotel;
const Restaurant = require('../../models/restaurant').Restaurant;

// Retrieve all "Table" from the database.
const findAll = (req, res) => {
    Service
        .findAll({
            include: [{
                model: Country,
                as: 'country'
            }]
        })
        .then((services) => res.status(200).send(services))
        .catch((error) => {
            console.log(error);
            res.status(400).send(error);
        });
};

module.exports = {
    findAll
};