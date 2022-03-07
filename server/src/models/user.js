'use strict';
const {
    Model
} = require('sequelize');
const bcrypt = require('bcryptjs');

module.exports = (sequelize, DataTypes) => {
    class User extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            User.belongsTo(models.Role, {
                foreignKey: 'role_id'
            });
        }
    }
    User.init({
        user_fullname: {
            type: DataTypes.STRING,
            allowNull: false
        },
        user_email: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true
        },
        user_phone: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true
        },
        user_password: {
            type: DataTypes.STRING,
            allowNull: false
        },
        role_id: DataTypes.INTEGER
    }, {
        sequelize,
        modelName: 'User',
    });
    // User.beforeSave(async(user, options) => {
    //     if (user.password) {
    //         user.password = bcrypt.hashSync(user.password, bcrypt.genSaltSync(10), null);
    //     }
    // });
    // User.prototype.comparePassword = function (passw, cb) {
    //     bcrypt.compare(passw, this.password, function (err, isMatch) {
    //         if (err) {
    //             return cb(err);
    //         }
    //         cb(null, isMatch);
    //     });
    // };
    return User;
};