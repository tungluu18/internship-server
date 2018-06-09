const knex = require('knex')(require('../knexfile'));
const secure = require('../control/secure');

const student = require('./student');

module.exports = {
    add: async function(username, password, type) {                    
        if (type !== 'student' && type !== 'admin' && type !== 'lecturer' && type !=='partner')
            return Promise.reject('Loại tài khoản không hợp lệ')
        try {
            const rows = await knex('user').select()

            //tìm id cho user mới khi chèn vào bảng : số nhỏ nhất chưa xuất hiện trong tập 'id'
            let newId = 1;
            for (let element of rows) if (element.id != newId) break; else newId++                       

            for (let element of rows) if (element.username === username) return Promise.reject(new Error("Username đã tồn tại"))
            await knex('user').insert({
                'id':newId, 'type':type, 
                'username':username, 'password': secure.encrypt(password)})
            await knex(`${type}`).insert({'id': newId})
            return Promise.resolve()
        } catch (error) {
            return Promise.reject(err)
        }        
    },

    deleteById: function(id) {        
        return knex('user').where('id', id).delete()
    },       

    getType: async function(id) {
        try {
            const result = await knex('user').where('id', id)           
            if (result.length == 0) return Promise.reject("id không tồn tại")
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

    getById: function(id) {
        return knex('user').where('id', id)        
    },    
       
    getByType: function(type) {
        return knex(`${type}`).select()
    },

    update: async function(requesterId, id, info) {        
        const studentFixed = ['name', 'mssv', 'class', 'khoa', 'nganh', 'diachi', 'ngaysinh', 'vnumail', 'GPA', 'namtotnghiep']
        const studentEditable = ['email', 'skypeID', 'facebook', 'phone', 'vitri', 'kynang', 'chungchi', 'kinhnghiem', 'sothich', 'dinhhuong', 'ghichu']        
        
        try {
            const typeOfUser = await this.getType(id)
            const typeOfRequester = await this.getType(requesterId)

            if (typeOfUser == 'admin' && id != requesterId) //admin không được update profile của admin khác
                return Promise.reject(new Error("Thay đổi không hợp lệ"))
            
            //student chỉ có thể update các thông tin trong tập editable
            if (typeOfUser == 'student' && typeOfRequester == 'student')                 
                for (p of studentFixed) info[p] = undefined                
            info['id'] = id       //'info' rỗng khi chèn vào bảng sẽ báo lỗi 
            await knex(`${typeOfUser}`).where('id', id).update(info)
            return Promise.resolve()
        } catch (err) {
            return Promise.reject(new Error("Thông tin không hợp lệ"))
        }
    }
}