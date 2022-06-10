'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Service extends Model {
        static associate(models) {
            Service.belongsTo(models.Country, {
                as: 'country',
                foreignKey: 'country_id'
            });
        }
    }
    Service.init({
        service_name: {
            type: DataTypes.STRING,
            allowNull: false
        },
        country_id: DataTypes.INTEGER
    }, {
        sequelize,
        modelName: 'Service',
    });
    return Service;
};