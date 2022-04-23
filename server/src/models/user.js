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
                as: 'role',
                foreignKey: 'role_id'
            });
            // User.belongsToMany(models.Address, {
            //     through: 'AddressDetail',
            //     as: 'addresses_of_user',
            //     foreignKey: 'user_id'
            // });
            // User.hasMany(models.Booking, {
            //     foreignKey: 'user_id',
            //     as: 'bookings_of_user'
            // });
        }
    };
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
        role_id: DataTypes.INTEGER,
        user_avatar: {
            type: DataTypes.BLOB,
        }
    }, {
        sequelize,
        modelName: 'User',
    });

    return User;
};