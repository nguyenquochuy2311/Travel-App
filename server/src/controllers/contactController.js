import express from "express";
import db from "../models/index";

const Contacts = db.contact;

exports.getContacts = (req, res) => {
    // const title = req.query.title;
    // condition = title ? { title: { [Op.like]: `%${title}%` } } : null;
    Contacts.findAll()
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error."
            });
        });
};

