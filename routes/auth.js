const express = require('express');
const bodyParser = require('body-parser');
const validInput = require('./validInput');
const knex = require('knex')(require('../knexfile'));
const secure = require('./secure');

const router = express();
router.use(bodyParser.json());

router.post('/', (req, res, next) => {
    const username = req.body.username;
    const password = req.body.password;
    const result = validInput.validUserPass(username, password);    

    if (result.success == false) {
        res.status(400);
        return res.send(result);
    }

    //return res.send("ahihi");

    knex('user').where('username', username).then((result) => {
        if (result.length == 0) return res.send({success:false, payload:{}, error:"username khong ton tai"});        
        
        if (secure.compare(password, result[0].password)) {
            return res.send({success:true, payload:{
                token: secure.createUserToken(username),
                typeUser: result[0].type,
                expiresIn:86400                    
            }, error:null});                        
        }

        return res.send({success:false, payload:{}, error:"mat khau sai"});
    });    
})

module.exports = router;
