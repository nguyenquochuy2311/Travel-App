'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class ServiceDetail extends Model {

        static associate(models) {
            ServiceDetail.belongsTo(models.Service, {
                as: 'service',
                foreignKey: 'service_id'
            });

            ServiceDetail.belongsTo(models.Airline, {
                as: 'airline',
                foreignKey: 'airline_id'
            });

            ServiceDetail.belongsTo(models.Car, {
                as: 'car',
                foreignKey: 'car_id'
            });

            ServiceDetail.belongsTo(models.Hotel, {
                as: 'hotel',
                foreignKey: 'hotel_id'
            });

            ServiceDetail.belongsTo(models.Restaurant, {
                as: 'restaurant',
                foreignKey: 'restaurant_id'
            });
        }
    }
    ServiceDetail.init({
        service_id: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        airline_id: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        car_id: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        hotel_id: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        restaurant_id: {
            type: DataTypes.INTEGER,
            allowNull: true
        }
    }, {
        sequelize,
        modelName: 'ServiceDetail',
    });
    return ServiceDetail;
};