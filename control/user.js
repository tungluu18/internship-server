const user      = require('../model/user')
const jwt       = require('jsonwebtoken')
const secure    = require('./secure')
const linkData  = 'http://localhost:3000'

module.exports = {
    getById: async function(req, res) {       
        try{
            if (req.params.id === undefined) return res.send({success: false, error: "không có id"})
            const result = await user.getProfile(req.params.id)
            res.send({sucess: true, data: result, error: null})
        } catch (err) {
            res.send({success: false, error: err.message})
        }
    },
    
    getAll: async function(req, res) {
        try {
            const result = await user.getByType(req.params.userType)
            res.send(result)
        } catch (err) {
            res.send({success: false, err: error.message})
        }   
    },

    getSidebar: async function(req, res) {
        try {            
            let result = {avatar: await user.getAvatar(req.query.id), 
                            name: await user.getName(req.query.id)}         
            if (result.avatar != null) result.avatar = linkData + result.avatar
            res.send(result)
        } catch (err) {            
            res.send({success: false, error: err.message})
        }
    },

    add: async function(req, res) {
        const username = req.body.username
        const password = req.body.password
        const type     = req.body.type
        
        if (username === undefined || password === undefined || type === undefined) 
            return res.send({error:"Tài khoản chưa đủ Tên tài khoản, Mật khẩu, Loại tài khoản."})
        
        try {
            const newId = await user.add(username, password, type)            
            res.send({success: true, error: null, id: newId, 'type': type})
        } catch (err) {
            res.send({success: false, error: err.message})
        }
    },
    
    delete: async function(req, res) {
        try {
            await user.deleteById(req.params.id)    
            res.send({success: true, error: null})
        } catch (err) {
            res.send({success: false, error: err.message})
        }        
    },

    update: async function(req, res) {                
        const id        = req.params.id                       
        const decoded   = jwt.decode(req.headers['authorization'])
        try {
            const typeOfUser = await user.getType(decoded.id);
            if (id != decoded.id && typeOfUser != 'admin') 
                return res.send({success: false, error: "không có quyền sửa tài khoản"})
            await user.update(decoded.id, id, req.body)
            res.send({success: true});
        } catch (err) {
            res.send({success:false, error: err.message})
        }
    },

    updatePassword: async function(req, res) {        
        const id = req.params.id     
        const requesterId = jwt.decode(req.headers['authorization']).id        
        try {
            const [_user, requesterType] = await Promise.all([user.getById(id), user.getType(requesterId)])            
            if (requesterType != 'admin' && !secure.compare(req.body.password, _user.password))
                return res.send({success: false, error: "Mật khẩu cũ không đúng"}) 
            if (req.body.newPassword != req.body.validateNewPassword) 
                return res.send({success: false, error: "Mật khẩu mới nhập chưa chính xác"})
            await user.updatePassword(id, req.body.newPassword)
            res.send({success: true, error: null})
        } catch (err) {
            res.send({success: false, error: err.message})
        }    
    }
} 