'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('TokenManagements', {
      refresh_token: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.STRING
      },
      access_token: {
        allowNull: false,
        unique: true,
        type: Sequelize.STRING
      },
      type_token: {
        allowNull: false,
        type: Sequelize.STRING
      },
      user_id: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      access_token_secret: {
        allowNull: false,
        type: Sequelize.STRING
      },
      refresh_token_secret: {
        allowNull: false,
        type: Sequelize.STRING
      },
      expired_at: {
        allowNull: false,
        type: Sequelize.DATE
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
    await queryInterface.addConstraint('TokenManagements', {
      fields: ['user_id'],
      type: 'foreign key',
      name: 'fk_token_manage_auth_user', // optional
      references: {
        table: 'Users',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.removeConstraint('TokenManagements', 'fk_token_manage_auth_user');
    await queryInterface.dropTable('TokenManagements');
  }
};