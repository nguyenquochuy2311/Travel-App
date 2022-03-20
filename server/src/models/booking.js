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
      Booking.belongsToMany(models.Service, {
        through: 'ServiceBooking',
        as: 'services_of_booking',
        foreignKey: 'booking_id'
      });
      Booking.belongsTo(models.TravelAgency, {
        foreignKey: 'travel_agency_id',
        as: 'travel_agency_of_booking'
      });
      Booking.belongsTo(models.RefBookingOutcome, {
        foreignKey: 'outcome_id',
        as: 'ref_outcome_of_booking'
      });
      Booking.belongsTo(models.RefBookingStatusPayment, {
        foreignKey: 'status_pay',
        as: 'ref_payment_status_of_booking'
      });
      Booking.belongsTo(models.RefBookingStatusPayment, {
        foreignKey: 'status_pay',
        as: 'status_payment_of_booking'
      });
      Booking.hasMany(models.Payment, {
        foreignKey: 'booking_id',
        as: 'payments_of_booking'
      });
    }
  }
  Booking.init({
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    outcome_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    status_pay: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    travel_agency_id: {
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