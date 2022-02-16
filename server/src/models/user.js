'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class User extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here

        }
    };
    User.init({
        user_fullname: DataTypes.STRING,
        user_email: DataTypes.STRING,
        user_phone: DataTypes.STRING,
        user_password: DataTypes.STRING,
        user_birthday: DataTypes.DATEONLY,
        user_lastlogin: DataTypes.DATE
    }, {
        sequelize,
        modelName: 'User',
        tableName: 'Users',
    });
    return User;
};