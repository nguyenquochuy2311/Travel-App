'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class TokenManagement extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      TokenManagement.belongsTo(models.User, {
        as: 'user',
        foreignKey: 'user_id'
      });
    }
  }
  TokenManagement.init({
    refresh_token: {
      allowNull: false,
      primaryKey: true,
      type: DataTypes.STRING
    },
    access_token: {
      allowNull: false,
      unique: true,
      type: DataTypes.STRING
    },
    type_token: {
      allowNull: false,
      type: DataTypes.STRING
    },
    user_id: {
      allowNull: false,
      type: DataTypes.INTEGER
    },
    access_token_secret: {
      allowNull: false,
      type: DataTypes.STRING
    },
    refresh_token_secret: {
      allowNull: false,
      type: DataTypes.STRING
    },
    expired_at: {
      allowNull: false,
      type: DataTypes.DATE
    }
  }, {
    sequelize,
    modelName: 'TokenManagement',
  });
  return TokenManagement;
};