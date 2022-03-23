'use strict';
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.createTable('Users', {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: Sequelize.INTEGER
            },
            user_fullname: {
                type: Sequelize.STRING,
                allowNull: false
            },
            user_email: {
                type: Sequelize.STRING,
                allowNull: false,
                unique: true
            },
            user_phone: {
                type: Sequelize.STRING,
                allowNull: false,
                unique: true
            },
            user_password: {
                type: Sequelize.STRING,
                allowNull: false
            },
            role_id: {
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
        await queryInterface.addConstraint('Users', {
            fields: ['role_id'],
            type: 'foreign key',
            name: 'fk_users_role', // optional
            references: {
                table: 'Roles',
                field: 'id'
            },
            onDelete: 'set null',
            onUpdate: 'cascade'
        });
    },
    async down(queryInterface, Sequelize) {
        await queryInterface.removeConstraint('Users', 'fk_users_role');
        await queryInterface.dropTable('Users');
    }
};