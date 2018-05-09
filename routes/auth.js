const validInput = require('./validInput');
const knex = require('knex')(require('../knexfile'));
const secure = require('./secure');

module.exports = {
    authenticate: function(req, res) {
        const username = req.body.username;
        const password = req.body.password;
        const result = validInput.validUserPass(username, password);    
    
        if (result.success == false) {
            res.status(400);
            return res.send(result);
        }
        
        knex('user').where('username', username).then((result) => {
            if (result.length == 0) return res.send({success:false, token:"", error:{message:"username không tồn tại"}});        
            
            if (secure.compare(password, result[0].password)) {
                return res.send({success:true, token: secure.createUserToken(result[0], expiresIn=86400), error:null});
            }
    
            return res.send({success:false, token:"", error:{message:"Nhập sai password"}});
        })
    }
}
