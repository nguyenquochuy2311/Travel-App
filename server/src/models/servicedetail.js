'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ServiceDetail extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
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