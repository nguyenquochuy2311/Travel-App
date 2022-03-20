'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('ServiceDetails', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      service_id: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      airline_id: {
        type: Sequelize.INTEGER,
        allowNull: true
      },
      car_id: {
        type: Sequelize.INTEGER,
        allowNull: true
      },
      hotel_id: {
        type: Sequelize.INTEGER,
        allowNull: true
      },
      restaurant_id: {
        type: Sequelize.INTEGER,
        allowNull: true
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('ServiceDetails');
  }
};