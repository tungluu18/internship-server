const knex = require('knex')(require('../knexfile'));
const secure = require('../control/secure');

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

    getType: async function(id) {
        try {
            const result = await knex('user').where('id', id)           
            if (result.length == 0) return Promise.reject(new Error("id không tồn tại"))
            return Promise.resolve(result[0].type)
        } catch (err) {                        
            return Promise.reject(new Error(err))
        }
    },

    getAvatar: async function(id) {
        try{            
            const result = await knex(`user`).where('id', id)
            if (result.length == 0) return Promise.reject(new Error("id không tồn tại"))
            return Promise.resolve(result[0].avatar)
        } catch (err) {
            //console.log("ahihi")
            return Promise.reject(new Error(err))
        }
    },

    getName: async function(id) {
        try {
            const typeOfUser = await this.getType(id)
            const result = await knex(`${typeOfUser}`).where('id', id)
            if (result.length == 0) return Promise.reject(new Error("id không tồn tại"))
            return Promise.resolve(result[0].name)
        } catch (err) {
            //console.log("ahihi")
            return Promise.reject(new Error(err))
        }
    },

    getById: async function(id) {
        return knex('user').where('id', id)
        /*knex('user').where('id', id)
        .then((result) => callback(null, result))
        .catch((err) => callback(err, null));*/
    },    
       
    getByType: async function(type) {
        return knex(`${type}`).select()
    },

    update: async function(requesterId, id, info) {        
        const studentFixed = ['name', 'mssv', 'class', 'khoa', 'nganh', 'diachi', 'ngaysinh', 'vnumail', 'GPA', 'namtotnghiep']
        const studentEditable = ['email', 'skypeID', 'facebook', 'phone', 'vitri', 'kynang', 'chungchi', 'kinhnghiem', 'sothich', 'dinhhuong', 'ghichu']        
        
        try {
            const typeOfUser = await this.getType(id)
            const typeOfRequester = await this.getType(requesterId)

            if (typeOfRequester == 'admin' && typeOfUser == 'admin') 
                return Promise.reject(new Error("Thay đổi không hợp lệ"))
            
            //student can only update his/her editable properties
            if (typeOfUser == 'student' && typeOfRequester == 'student')                 
                for (p of studentFixed) info[p] = undefined                

            await knex(`${typeOfUser}`).where('id', id).update(info)
            return Promise.resolve()
        } catch (err) {
            return Promise.reject(new Error("Thông tin không hợp lệ"))
        }
    }
}