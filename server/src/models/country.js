'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Country extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            Country.hasMany(models.Address, {
                foreignKey: 'country_id',
            });
        }
    }
    Country.init({
        country_name: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true
        },
        country_image: {
            type: DataTypes.STRING,
            allowNull: false,
        }
    }, {
        sequelize,
        modelName: 'Country',
    });
    return Country;
};