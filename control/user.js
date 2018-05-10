const user = require('../model/user');

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
    }
} 