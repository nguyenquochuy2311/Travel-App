'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Service extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // Service.belongsToMany(models.Airline, {
      //   through: 'ServiceDetail',
      //   as: 'airlines_of_service',
      //   foreignKey: 'service_id'
      // });

      // Service.belongsToMany(models.Car, {
      //   through: 'ServiceDetail',
      //   as: 'cars_of_service',
      //   foreignKey: 'service_id'
      // });

      // Service.belongsToMany(models.Hotel, {
      //   through: 'ServiceDetail',
      //   as: 'hotels_of_service',
      //   foreignKey: 'service_id'
      // });

      // Service.belongsToMany(models.Restaurant, {
      //   through: 'ServiceDetail',
      //   as: 'restaurants_of_service',
      //   foreignKey: 'service_id'
      // });

      // Service.belongsToMany(models.Booking, {
      //   through: 'ServiceBooking',
      //   as: 'bookings_of_service',
      //   foreignKey: 'service_id'
      // });
    }
  }
  Service.init({
    service_name: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'Service',
  });
  return Service;
};