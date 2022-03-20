'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('RolePermissions', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      role_id: {
        type: Sequelize.INTEGER
      },
      perm_id: {
        type: Sequelize.INTEGER
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
    await queryInterface.addConstraint('RolePermissions', {
      fields: ['role_id'],
      type: 'foreign key',
      name: 'fk_role_permissions_role', // optional
      references: {
        table: 'Roles',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
    await queryInterface.addConstraint('RolePermissions', {
      fields: ['perm_id'],
      type: 'foreign key',
      name: 'fk_role_permissions_permission', // optional
      references: {
        table: 'Permissiones',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.removeConstraint('RolePermissions', 'fk_role_permissions_permission');
    await queryInterface.dropTable('RolePermissions');
  }
};