'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Bookings', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      user_id: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      outcome_id: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      status_pay: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      travel_agency_id: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      booking_details: {
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
    await queryInterface.addConstraint('Bookings', {
      fields: ['user_id'],
      type: 'foreign key',
      name: 'fk_bookings_user', // optional
      references: {
        table: 'Users',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
    await queryInterface.addConstraint('Bookings', {
      fields: ['outcome_id'],
      type: 'foreign key',
      name: 'fk_bookings_outcome', // optional
      references: {
        table: 'RefBookingOutComes',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
    await queryInterface.addConstraint('Bookings', {
      fields: ['status_pay'],
      type: 'foreign key',
      name: 'fk_bookings_status_payment', // optional
      references: {
        table: 'RefBookingStatusPayments',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
    await queryInterface.addConstraint('Bookings', {
      fields: ['travel_agency_id'],
      type: 'foreign key',
      name: 'fk_bookings_travel_agency', // optional
      references: {
        table: 'TravelAgencies',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.removeConstraint('Bookings', 'fk_bookings_user');
    await queryInterface.removeConstraint('Bookings', 'fk_bookings_outcome');
    await queryInterface.removeConstraint('Bookings', 'fk_bookings_travel_agency');
    await queryInterface.removeConstraint('Bookings', 'fk_bookings_status_payment');
    await queryInterface.dropTable('Bookings');
  }
};