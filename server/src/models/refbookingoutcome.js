'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class RefBookingOutcome extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            RefBookingOutcome.hasMany(models.Booking, {
                foreignKey: 'outcome_id',
                as: 'bookings'
            });
        }
    }
    RefBookingOutcome.init({
        outcome: {
            type: DataTypes.STRING,
            allowNull: false
        }
    }, {
        sequelize,
        modelName: 'RefBookingOutcome',
    });
    return RefBookingOutcome;
};