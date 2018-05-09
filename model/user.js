const knex = require('knex')(require('../knexfile'));
const secure = require('../control/secure');
module.exports = {
    add(username, password, type, res) {                    
        password = secure.encrypt(password);
        let newId = 1;
        knex('user').select().then((rows) => {                        
            //console.log(rows);
            for (let element of rows) {
                //console.log(element.id);
                if (element.id != newId) break; else newId++;           
            }
            for (let element of rows) if (element.username === username) return Promise.reject("Username đã tồn tại");                        
            //console.log(newId);
            return knex('user').insert({'id':newId, 'username':username, 'password':password, 'type':type});
        }).then (() => {            
            //console.log(newId);
            return knex(`${type}`).insert({'id':newId});
        }).then (() => {
            res.send("Tạo tài khoản thành công");                              
        }).catch((err) => {
            console.log(err);
            res.send(err);
        });
    },

    deleteById(req, res) {        
        knex('user').where({'id':req.body.id}).delete().then(() => {
            res.send("Xóa thành công");
        }).catch ((err) => {
            res.status(400);
            console.log(err);
            res.send(err);
        })
    }    
}