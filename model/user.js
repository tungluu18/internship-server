const knex = require('knex')(require('../knexfile'));
const secure = require('../control/secure');
const linkData = 'http://localhost:3000/data';

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
        }).then(() => {
            if (type == 'student') return knex('studenteditable').insert({'id':newId});
            return Promise.resolve();
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
    },   
    
    getAvatar: function(res, idUser) {
        let name = null, avatar = null, typeOfUser;
        knex('user').where({'id': idUser})
        .then((rows) => {                        
            if (rows.length == 0) return Promise.reject("id không tồn tại");                        

            typeOfUser = rows[0].type;
            if (rows[0].data != null) avatar = linkData + rows[0].avatar;
            return knex(`${typeOfUser}`).where({'id': idUser});                                        
        })
        .then((rows) => {
            if (rows.length != 0) name = rows[0].name;            
            res.send({'name':name, 'avatar':avatar});
        })    
        .catch((err) => {
            console.log(err)
            res.send(err);
        })    
    }
}