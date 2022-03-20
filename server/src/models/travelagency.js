'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class TravelAgency extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      TravelAgency.hasMany(models.Booking, {
        foreignKey: 'travel_agency_id',
        as: 'bookings_of_travel_agency'
      });
    }
  }
  TravelAgency.init({
    travel_agency_details: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'TravelAgency',
  });
  return TravelAgency;
};