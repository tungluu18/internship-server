const knex = require('knex')(require('../knexfile'));

module.exports = {
    getAll: function(callback) {
        knex('lecturer').select()
        .then((results) => {callback(null, results);}) 
        .catch((err) => {callback(err, null);})
    }
}