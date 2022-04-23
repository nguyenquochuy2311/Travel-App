import path from 'path';

let __static = path.join(process.cwd(), 'src/public');

let __uploads = path.join(__static, 'uploads');

module.exports = {
    __image: path.join(__uploads, 'image')
};