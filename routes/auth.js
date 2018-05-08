const express = require('express');
const bodyParser = require('body-parser').json();
const validInput = require('./validInput');
const knex = require('knex')(require('../knexfile'));
const secure = require('./secure');

const router = express();
router.use(bodyParser);
// setting CORS
router.use((req, res, next) => {   // hỗ trợ nhận request post/get chứa cookie dạng json từ client
    res.header('Access-Control-Allow-Origin', 'http://localhost:3001');
    res.header('Access-Control-Allow-Headers', 'Content-Type,X-Requested-With');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
    next();
}); 

router.post('/', (req, res, next) => {
    const username = req.body.username;
    const password = req.body.password;
    const result = validInput.validUserPass(username, password);    

    if (result.success == false) {
        res.status(400);
        return res.send(result);
    }
    
    knex('user').where('username', username).then((result) => {
        if (result.length == 0) return res.send({success:false, payload:{}, error:"username khong ton tai"});        
        
        if (secure.compare(password, result[0].password)) {
            return res.send({success:true, payload:{
                token: secure.createUserToken(username),
                userType: result[0].type,
                expiresIn:86400                    
            }, error:null});                        
        }

        return res.send({success:false, payload:{}, error:"mat khau sai"});
    });    
})

module.exports = router;
