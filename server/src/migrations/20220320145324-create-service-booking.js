'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('ServiceBookings', {
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
      booking_id: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      booking_start_date: {
        type: Sequelize.DATEONLY,
        allowNull: false
      },
      booking_end_date: {
        type: Sequelize.DATEONLY,
        allowNull: false
      },
      other_details: {
        type: Sequelize.STRING
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
    await queryInterface.addConstraint('ServiceBookings', {
      fields: ['booking_id'],
      type: 'foreign key',
      name: 'fk_service_bookings_booking', // optional
      references: {
        table: 'Bookings',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
    await queryInterface.addConstraint('ServiceBookings', {
      fields: ['service_id'],
      type: 'foreign key',
      name: 'fk_service_bookings_service', // optional
      references: {
        table: 'Services',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.removeConstraint('ServiceBookings', 'fk_service_bookings_service');
    await queryInterface.removeConstraint('ServiceBookings', 'fk_service_bookings_booking');
    await queryInterface.dropTable('ServiceBookings');
  }
};