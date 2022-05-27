import path from 'path';
const util = require("util");
const multer = require("multer");
const maxSize = 2 * 1024 * 1024;

let image_saved = null;

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, path.join(process.cwd(), 'src/public/uploads/image/'));
    },
    filename: (req, file, cb) => {
        image_saved = `image-${Date.now()}-${file.originalname}`;
        cb(null, `image-${Date.now()}-${file.originalname}`);
        // cb(null, file.originalname);
    },
});

const multerFilter = (req, file, cb) => {
    if (!file.originalname.match(/\.(png|jpg)$/)) {
        // upload only png and jpg format
        return cb(new Error('Please upload a Image type'));
    }
    cb(null, true);
};

let uploadFile = multer({
    storage: storage,
    // fileFilter: multerFilter,
    limits: { fileSize: maxSize }
}).single("file");

let uploadFileMiddleware = util.promisify(uploadFile);
module.exports = {
    uploadFileMiddleware,
    image_saved
};