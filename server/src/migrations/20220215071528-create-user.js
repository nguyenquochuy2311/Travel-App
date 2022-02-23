'use strict';
module.exports = {
    up: async(queryInterface, Sequelize) => {
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
            user_birthday: {
                type: Sequelize.DATEONLY,
                allowNull: false
            },
            user_lastlogin: {
                type: Sequelize.DATE,
                allowNull: false
            },
            // user_role: {
            //   type: Sequelize.INTEGER
            // },
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
    down: async(queryInterface, Sequelize) => {
        await queryInterface.dropTable('Users');
    }
};