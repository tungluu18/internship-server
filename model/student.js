const knex = require('knex')(require('../knexfile'));
const _ = require('lodash');

module.exports = {
    getAll: function(callback) {
        let result = [];        
        let fixed = [], editable = [];        
        knex('student').select()
        .then((rows) => {                                    
            fixed = rows;            
            return knex('studenteditable').select();            
        })
        .then((rows) => {
            editable = rows;                        
            for (var i = 0; i < fixed.length; ++i) result.push(_.assignIn(fixed[i], editable[i]));            
            callback(null, result);
        })
        .catch((err) => {
            console.log("ahihi");
            callback(err, null);            
        })
    },

    update: function(id, info, callback) {
        //console.log(info);
        knex('student').where('id', id).update(info)
        .then(() => {
            callback(null);
        })
        .catch((err) => {
            //console.log(err);
            callback(err);
        });
    }
}