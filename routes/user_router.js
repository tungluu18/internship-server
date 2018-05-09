const knex = require('knex')(require('../knexfile'));

module.exports = {
    getAvatar: function(req, res, idUser) {
        knex('user').where({'id': idUser})
        .then((rows) => {                        
            if (rows.length == 0) return res.sendStatus(400);
            const typeOfUser = rows[0].type;
            console.log(typeOfUser);
            return knex(`${typeOfUser}`).where({'id': idUser});                                        
        })
        .then((rows) => {
            if (rows.length == 0) return res.sendStatus(400);
            return res.send({name: rows[0].name, avatar: 'https://www.tvnz.co.nz/one-news/entertainment/ted-2-movie-review-6352528'});                
        })
    }
}