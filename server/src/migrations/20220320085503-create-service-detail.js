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
    await queryInterface.addConstraint('ServiceDetails', {
      fields: ['service_id'],
      type: 'foreign key',
      name: 'fk_service_details_service', // optional
      references: {
        table: 'Services',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
    await queryInterface.addConstraint('ServiceDetails', {
      fields: ['airline_id'],
      type: 'foreign key',
      name: 'fk_service_details_airline', // optional
      references: {
        table: 'Airlines',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'set null'
    });
    await queryInterface.addConstraint('ServiceDetails', {
      fields: ['car_id'],
      type: 'foreign key',
      name: 'fk_service_details_car', // optional
      references: {
        table: 'Cars',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'set null'
    });
    await queryInterface.addConstraint('ServiceDetails', {
      fields: ['hotel_id'],
      type: 'foreign key',
      name: 'fk_service_details_hotel', // optional
      references: {
        table: 'Hotels',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'set null'
    });
    await queryInterface.addConstraint('ServiceDetails', {
      fields: ['restaurant_id'],
      type: 'foreign key',
      name: 'fk_service_details_restaurant', // optional
      references: {
        table: 'Restaurants',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'set null'
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.removeConstraint('ServiceDetails', 'fk_service_details_restaurant');
    await queryInterface.removeConstraint('ServiceDetails', 'fk_service_details_car');
    await queryInterface.removeConstraint('ServiceDetails', 'fk_service_details_airline');
    await queryInterface.removeConstraint('ServiceDetails', 'fk_service_details_service');
    await queryInterface.dropTable('ServiceDetails');
  }
};