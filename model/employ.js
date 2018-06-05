const knex = require('knex')(require('../knexfile'))

module.exports = {
  getAllEmployInfo: function() {
    return knex('employinfo').select()
  }
}