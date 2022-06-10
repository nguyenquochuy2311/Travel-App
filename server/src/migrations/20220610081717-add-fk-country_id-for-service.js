'use strict';

module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.addColumn('Services', 'country_id', {
            type: Sequelize.INTEGER
        });

        await queryInterface.addConstraint('Services', {
            fields: ['country_id'],
            type: 'foreign key',
            name: 'fk_services_countries',
            references: {
                table: 'Countries',
                field: 'id'
            },
            onDelete: 'set null',
            onUpdate: 'cascade'
        });
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.removeColumn('Services', 'country_id');
        await queryInterface.removeConstraint('Services', 'fk_services_countries');
    }
};