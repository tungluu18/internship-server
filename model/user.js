const knex = require('knex')(require('../knexfile'));
const secure = require('../control/secure');
const linkData = 'http://localhost:3000';

const student = require('./student');

module.exports = {
    add(username, password, type, callback) {                    
        if (type !== 'student' && type !== 'admin' && type !== 'lecturer' && type !=='partner')
            return callback('Loại tài khoản không hợp lệ');

        password = secure.encrypt(password);
        let newId = 1;

        knex('user').select().then((rows) => {                        
            for (let element of rows) if (element.id != newId) break; else newId++;                       
            for (let element of rows) if (element.username === username) return Promise.reject("Username đã tồn tại");                        
            return knex('user').insert({'id':newId, 'username':username, 'password':password, 'type':type});
        }).then (() => {            
            return knex(`${type}`).insert({'id':newId});
        }).then(() => {
            if (type == 'student') return knex('studenteditable').insert({'id':newId});            
            return Promise.resolve();
        }).then (() => {
            callback(null, null);
        }).catch((err) => {
            console.log(err);
            callback(err, null);
        });
    },

    deleteById(req, res) {        
        knex('user').where({'id':req.body.id}).delete().then(() => {
            res.send("Xóa thành công");
        }).catch ((err) => {
            res.sendstatus(200);
        })
    },   
    
    getType: function(id, callback) {
        knex('user').where('id', id)
        .then((rows) => {
            if (rows.length === 0) callback(err, null);            
            callback(null, rows[0].type);
        })
        .catch((err) => callback(err, null))
    },

    getType2: async function(id) {
        try {
            let result = await knex('user').where('id', id)
            if (result.length == 0) return Promise.reject(new Error("id không tồn tại"))
            return Promise.resolve(result[0].type)
        } catch (err) {            
            return Promise.reject(new Error("id không tồn tại"))
        }
    },

    getById: function(id, callback) {
        knex('user').where('id', id)
        .then((result) => callback(null, result))
        .catch((err) => callback(err, null));
    },

    getAvatar: function(id, callback) {
        let name = null, avatar = null, typeOfUser;
        knex('user').where({'id': id})
        .then((rows) => {                                    
            if (rows.length == 0) return Promise.reject("id không tồn tại");                        
            typeOfUser = rows[0].type;
            if (rows[0].avatar != null) avatar = linkData + rows[0].avatar;
            return knex(`${typeOfUser}`).where({'id': id});                                        
        })
        .then((rows) => {            
            if (rows.length != 0) name = rows[0].name;  
            callback(null, {'name':name, 'avatar':avatar});
        })    
        .catch((err) => {            
            callback(err, null);
        })    
    },

    update: function(id, info, callback) {
        info.id = undefined;
        knex('user').where('id', id)
        .then((rows) => {            
            switch(rows[0].type) {
                case 'student' : student.update(id, info, (err) => callback(err))
                case 'lecturer' : lecturer.update(id, info)
                //case 'partner' : partner.update(id, info, (err) => {callback(err);});
                //case 'admin' : admin.update(id, info, (err) => {if (err) callback(err);})
            }                        
        })
        .catch((err) => {
            //console.log(err);
            callback(err);            
        })
    }
}