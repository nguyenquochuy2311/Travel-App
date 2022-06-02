const uploadFileMiddleware = require("../../middleware/upload");

async function upload(req, res) {
    try {
        await uploadFileMiddleware(req, res);
        if (req.file == undefined) {
            throw new Error("Please upload a file!");
        }
        return req.file.originalname;
    } catch (err) {
        if (err.code == "LIMIT_FILE_SIZE") {
            throw new Error("File size cannot be larger than 2MB!");
        } else {
            throw new Error(err.message);
        }
    }
};

const upload_v2 = async (req, res) => {
    try {
        await uploadFileMiddleware(req, res);
        console.log(req.file);
        if (req.file == undefined) {
            return res.status(400).send({ message: "Please upload a file!" });
        }
        res.status(200).send({
            message: "Uploaded the file successfully: " + req.file.originalname
        });
    } catch (err) {
        res.status(500).send({
            message: `Could not upload the file: ${req.file.originalname}. ${err}`
        });
    }
};

const getListFiles = (req, res) => {
    const directoryPath = staticPath.__image;
    fs.readdir(directoryPath, function (err, files) {
        if (err) {
            res.status(500).send({
                message: "Unable to scan files!",
            });
        }
        let fileInfos = [];
        files.forEach((file) => {
            fileInfos.push({
                name: file,
                url: baseUrl + file,
            });
        });
        res.status(200).send(fileInfos);
    });
};

const download = (req, res) => {
    const fileName = req.params.name;
    const directoryPath = staticPath.__image;
    res.download(directoryPath + fileName, fileName, (err) => {
        if (err) {
            res.status(500).send({
                message: "Could not download the file. " + err,
            });
        }
    });
};


module.exports = {
    upload,
    upload_v2,
    getListFiles,
    download,
};