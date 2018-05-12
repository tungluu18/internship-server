const knex = require('knex')(require('../knexfile'))

module.exports = {
    getAll: async function() {
        return knex('admin').select()
    }
}