const util = require("util");
const multer = require("multer");
const maxSize = 2 * 1024 * 1024;
const staticPath = require("../config/pathStaticFile.js");

let getFileSaved;

const imageFilter = (req, file, cb) => {
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/jpg' || file.mimetype === 'image/png') {
        cb(null, true);
    } else {
        cb("Please upload only images.", false);
    }
};

let storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, staticPath.__image);
    },
    filename: (req, file, cb) => {
        getFileSave = `${Date.now()}-travel-${file.originalname}`;
        cb(null, `${Date.now()}-travel-${file.originalname}`);
    },
});

let uploadFile = multer({
    storage: storage,
    fileFilter: imageFilter,
    limits: { fileSize: maxSize }
}).single("file");

let uploadFileMiddleware = util.promisify(uploadFile);

module.exports = {
    uploadFileMiddleware,
    getFileSaved
};