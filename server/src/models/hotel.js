'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Hotel extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      Hotel.belongsToMany(models.Service, {
        through: 'ServiceDetail',
        as: 'service_of_hotel',
        foreignKey: 'hotel_id'
      });
    }
  }
  Hotel.init({
    hotel_details: {
      type: DataTypes.STRING,
      allowNull: false
    },
    hotel_price: {
      type: DataTypes.FLOAT,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'Hotel',
  });
  return Hotel;
};