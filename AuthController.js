const express = require('express');
const router = express();
const bodyParser = require('body-parser');
const knex = require('knex')(require('./knexfile'));    //database
const bcrypt = require('bcryptjs');                     //hash
const jwt = require('jsonwebtoken');                    //create token

const config = require('./config');
const User = require('./user/User');
const UserController = require('./user/UserController');

router.use(bodyParser.json());

router.post('/', (req, res) => {    
    var inputValidation = User.validInput({username:req.body.username, password:req.body.password});

    if (inputValidation.success === "false") {
        res.status(400);
        return res.send(inputValidation);
    }

    knex('user').where('username', req.body.username).select().then((data) => {
        // khong tim duoc username
        if (!data.length) {
            return res.send({success:"false", data:{}, error:"username khong ton tai"})
        }
        console.log(data);
        //ton tai username, kiem tra password
        for (var i = 0; i < data.length; ++i) {
            if (bcrypt.compareSync(req.body.password, data[i].password)) {
                //kiem tra hash thay mat khau dung
                //tao token va tra lai ket qua
                const token = jwt.sign({id: req.body.username }, config.secret, {
                    expiresIn: 86400 // expires in 24 hours
                });
                return res.send({
                    success:"true", 
                    data:{
                        token: token,
                        typeUser: data[i].type
                    },
                    error:null
                });
            }
        }

        return res.send({success:"false", data:{}, error:"password khong dung"});
    });     
})

module.exports = router;