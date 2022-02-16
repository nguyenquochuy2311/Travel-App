const db = require("../../models");
const Role = db.role;
const Op = db.Sequelize.Op;
// Create and Save a new "Table"
exports.create = (req, res) => {
    // const title = req.query.title;
    // var condition = title ? { title: {
    //         [Op.like]: `%${title}%` } } : null;
    Role.findAll()
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving Role."
            });
        });
};
// Retrieve all "Table" from the database.
exports.findAll = (req, res) => {

};
// Find a single "Table" with an id
exports.findOne = (req, res) => {

};
// Update a "Table" by the id in the request
exports.update = (req, res) => {

};
// Delete a "Table" with the specified id in the request
exports.delete = (req, res) => {

};
// Delete all "Table" from the database.
exports.deleteAll = (req, res) => {

};
// Find all published "Table"
exports.findAllPublished = (req, res) => {

};