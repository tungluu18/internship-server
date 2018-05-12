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
        const editable = {
            email: info.email,
            skypeID: info.skypeID,
            facebook: info.facebook,
            phone: info.phone,
            vitri: info.vitri,
            kynang: info.kynang,
            chungchi: info.chungchi,
            kinhnghiem: info.kinhnghiem,
            sothich: info.sothich,
            dinhhuong: info.dinhhuong,
            ghichu: info.ghichu
        }

        info.email = info.skypeID = info.facebook
        = info.phone = info.vitri = info.kynang
        = info.chungchi = info.kinhnghiem = info.sothich
        = info.dinhhuong = info.ghichu = undefined;

        knex('student').where('id', id).update(info)
        .then(() => knex('studenteditable').where('id', id).update(editable))
        .then(() => callback(null))
        .catch((err) => {
            //console.log(err);
            callback(err);
        });
    }
}