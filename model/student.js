const knex = require('knex')(require('../knexfile'));

module.exports = {
    getAll: function(callback) {
        let result = [];        
        knex('student').select()
        .then((rows) => {                        
            for (Element of rows) result.push({fixed:Element, editable:{}});
            return knex('studenteditable').select();            
        })
        .then((rows) => {
            for (Element of rows) Element.id = undefined;
            for (var i = 0; i < result.length; ++i) result[i].editable = rows[i];                        
            callback(null, result);
        })
        .catch((err) => {
            callback(err, null);            
        })
    }
}