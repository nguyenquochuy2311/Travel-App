'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Car extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      Car.belongsToMany(models.Service, {
        through: 'ServiceDetail',
        as: 'service_of_car',
        foreignKey: 'car_id'
      });
    }
  }
  Car.init({
    car_details: {
      type: DataTypes.STRING,
      allowNull: false
    },
    car_price: {
      type: DataTypes.FLOAT,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'Car',
  });
  return Car;
};