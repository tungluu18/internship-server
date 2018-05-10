const knex = require('knex')(require('../knexfile'));

module.exports = {
    getAll: function(callback) {
        knex('partner').select()
        .then((result) => {callback(null, result)})
        .catch((err) => {callback(err, null)});
    }
}