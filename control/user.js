const user = require('../model/user');
const student = require('./student');
//const lecturer = require('./lecturer');
//const partner = require('./partner');
//const admin = require('./admin');
const jwt = require('jsonwebtoken');

module.exports = {
    getById: function(req, res) {       
        if (req.query.id === undefined) return res.sendStatus(404);
        user.getById(req.query.id, (err, result) => {
            if (err) res.send({error:err});
            res.send(result[0]);
        })  
    },
    
    getAvatar: function(req, res) {
        user.getAvatar(req.query.id, (err, result) => {              
            if (err) res.send({error:err});
            res.send(result);
        })
    },

    add: function(req, res) {
        const username = req.body.username;
        const password = req.body.password;
        const type     = req.body.type;
        
        if (username === undefined || password === undefined || type === undefined) {
            res.send({error:"Tài khoản chưa đủ Tên tài khoản, Mật khẩu, Loại tài khoản."});
        }

        user.add(username, password, type, (err, result) => {
            if (err) res.send({error:err});
            res.send({error:"Tạo tài khoản thành công"});
        })
    },

    update: function(req, res) {        
        const id = req.params.id;                        
        const decoded = jwt.decode(req.headers['authorization']);
        
        user.getType(id, (err, type) => {
            if (err) {
                res.send({error:err});
                return;
            }
            
            if (type == 'admin' || id == decoded.id) {                
                user.update(id, req.body, (err) => {                                        
                    if (err) {                        
                        //console.log(err);                         
                        res.sendStatus(404); 
                    } else res.sendStatus(200);                    
                })
            }
            else res.sendStatus(404);
        })
    },

    getType: async function(req, res) {
        try {
            let type = await user.getType2(req.params.id);
            res.send(type);
        } catch (err) {            
            res.send({success: false, error: err.message})
        }
    }
} 