'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Payments', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      booking_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      payment_amount: {
        type: Sequelize.FLOAT,
        allowNull: false,
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
    await queryInterface.addConstraint('Payments', {
      fields: ['booking_id'],
      type: 'foreign key',
      name: 'fk_payments_booking', // optional
      references: {
        table: 'Bookings',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.removeConstraint('Payments', 'fk_payments_booking');
    await queryInterface.dropTable('Payments');
  }
};