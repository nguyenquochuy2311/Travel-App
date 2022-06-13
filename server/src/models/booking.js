'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Booking extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            Booking.belongsTo(models.User, {
                foreignKey: 'user_id',
                as: 'user',
            });
            Booking.belongsTo(models.TravelAgency, {
                foreignKey: 'travel_agency_id',
                as: 'travel_agency'
            });
            Booking.belongsTo(models.RefBookingOutcome, {
                foreignKey: 'outcome_id',
                as: 'outcome'
            });
            Booking.belongsTo(models.RefBookingStatusPayment, {
                foreignKey: 'status_payment_id',
                as: 'payment_status'
            });
            Booking.hasMany(models.Payment, {
                foreignKey: 'booking_id',
                as: 'payments'
            });
        }
    }
    Booking.init({
        user_id: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        travel_agency_id: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        outcome_id: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        status_payment_id: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        booking_details: DataTypes.STRING
    }, {
        sequelize,
        modelName: 'Booking',
    });
    return Booking;
};