const user = require('../model/user');
const jwt = require('jsonwebtoken');

const linkData = 'http://localhost:3000';

module.exports = {
    getById: async function(req, res) {       
        try{
            if (req.query.id === undefined) return res.sendStatus(404)
            const result = await user.getById(req.query.id)
            if (result.length == 0) res.send({success: false, error: "id không tồn tại"})
            res.send(result[0])
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

    add: function(req, res) {
        const username = req.body.username;
        const password = req.body.password;
        const type     = req.body.type;
        
        if (username === undefined || password === undefined || type === undefined) {
            return res.send({error:"Tài khoản chưa đủ Tên tài khoản, Mật khẩu, Loại tài khoản."});
        }

        user.add(username, password, type, (err, result) => {
            if (err) return res.send({error:err});
            return res.send("Tạo tài khoản thành công");
        })
    },
    
    update: async function(req, res) {                
        const id = req.params.id                       
        const decoded = jwt.decode(req.headers['authorization'])
        
        try {
            const typeOfUser = await user.getType(decoded.id);
            // if (id != decoded.id && typeOfUser != 'admin') 
            //    return res.send({success: false, error: "không có quyền sửa tài khoản"})

            await user.update(decoded.id, id, req.body)
            res.send({success: true});
        } catch (err) {
            res.send({success:false, error: err.message})
        }
    }    
} 