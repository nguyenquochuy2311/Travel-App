'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ServiceBooking extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  ServiceBooking.init({
    service_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    booking_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    booking_start_date: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    booking_end_date: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    other_details: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'ServiceBooking',
  });
  return ServiceBooking;
};