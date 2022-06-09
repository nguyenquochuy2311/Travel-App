'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.addColumn('Addresses', 'country_id', {
      type: Sequelize.INTEGER
    });

    await queryInterface.addConstraint('Addresses', {
      fields: ['country_id'],
      type: 'foreign key',
      name: 'fk_addresses_countries',
      references: {
        table: 'Countries',
        field: 'id'
      },
      onDelete: 'set null',
      onUpdate: 'cascade'
    });
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.removeColumn('Addresses', 'country_id');
    await queryInterface.removeConstraint('Addresses', 'fk_addresses_countries');
  }
};
