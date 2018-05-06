const knex = require('knex')('../knexfile');

module.exports = {
    findUser
}

function addUser(username, password, type) {
    return knex('user').insert({
        username,
        password,
        type
    })
}

function findUser(username, password) {
    
}