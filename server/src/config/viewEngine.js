import express from "express";

let configViewEngine = (app) => {
    app.use(express.static("./src/public")); // get image/file on server
    app.set("view engine", "ejs"); //ejs = blade (PHP) = jsp (JAVA)

    app.set("views", "./src/views"); //
}

module.exports = configViewEngine;