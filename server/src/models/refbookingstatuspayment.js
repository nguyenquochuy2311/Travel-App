'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class RefBookingStatusPayment extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      RefBookingStatusPayment.hasMany(models.Booking, {
        foreignKey: 'status_pay',
        as: 'bookings_of_status_pay'
      });
    }
  }
  RefBookingStatusPayment.init({
    status_description: {
      type: DataTypes.STRING,
      allowNull: false,
    }
  }, {
    sequelize,
    modelName: 'RefBookingStatusPayment',
  });
  return RefBookingStatusPayment;
};