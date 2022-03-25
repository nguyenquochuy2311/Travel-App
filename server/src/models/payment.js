'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Payment extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // Payment.belongsTo(models.Booking, {
      //   foreignKey: 'booking_id',
      //   as: 'payment_of_booking'
      // });
    }
  }
  Payment.init({
    booking_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    payment_amount: {
      type: DataTypes.FLOAT,
      allowNull: false
    },
    other_details: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Payment',
  });
  return Payment;
};