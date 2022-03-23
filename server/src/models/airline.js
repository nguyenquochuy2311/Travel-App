'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Airline extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // Airline.belongsToMany(models.Service, {
      //   through: 'ServiceDetail',
      //   as: 'services_of_airline',
      //   foreignKey: 'airline_id'
      // });
    }
  }
  Airline.init({
    airline_details: {
      type: DataTypes.STRING,
      allowNull: false
    },
    airline_price: {
      type: DataTypes.FLOAT,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'Airline',
  });
  return Airline;
};