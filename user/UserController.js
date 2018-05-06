const express = require('express');
const router = express();
const bodyParser = require('body-parser');
const bcrypt = require('bcryptjs');                         //hash password
const knex = require('knex')(require('../knexfile'));       //database

const User = require('./User');
const db = require('../db/DbForUser');

// hash password
const salt = bcrypt.genSaltSync(10);
router.hashPassword = (password) => {
    return bcrypt.hashSync(password, salt);
}

router.use(bodyParser.json());

// CRUD User
router.post('/register', (req, res) => {
    var createdUser = router.createUser({
        username: req.body.username, password: req.body.password, type: "student"}
    ).then(res.sendStatus(200));                    
})

// Database 

router.createUser = (User) => {
    const hashedPassword = router.hashPassword(User.password);
    User.password = hashedPassword;
    // console.log(User);
    return knex('user').insert({
        username: User.username, 
        password: hashedPassword, 
        type: User.type
    });    
}



module.exports = router;
