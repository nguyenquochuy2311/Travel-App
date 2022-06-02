'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class AddressDetail extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      AddressDetail.belongsTo(models.User, {
        as: 'user',
        foreignKey: 'user_id'
      });
      AddressDetail.belongsTo(models.Address, {
        as: 'address',
        foreignKey: 'address_id'
      });
    }
  }
  AddressDetail.init({
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    address_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'AddressDetail',
  });
  return AddressDetail;
};