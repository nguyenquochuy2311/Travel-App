'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('AddressDetails', {
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
      address_id: {
        type: Sequelize.INTEGER,
        allowNull: false
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
    await queryInterface.addConstraint('AddressDetails', {
      fields: ['user_id'],
      type: 'foreign key',
      name: 'fk_address_details_user', // optional
      references: {
        table: 'Users',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
    await queryInterface.addConstraint('AddressDetails', {
      fields: ['address_id'],
      type: 'foreign key',
      name: 'fk_address_details_address', // optional
      references: {
        table: 'Addresses',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.removeConstraint('AddressDetails', 'fk_address_details_user');
    await queryInterface.removeConstraint('AddressDetails', 'fk_address_details_address');
    await queryInterface.dropTable('AddressDetails');
  }
};