const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const secretCode = "vietnamvodich";
const tokenExpiration = 86400;

module.exports = {
    encrypt: function(str) {
        const salt = bcrypt.genSaltSync(10);
        return bcrypt.hashSync(str, salt);
    },
    compare: function(raw, hash) {
        return bcrypt.compareSync(raw, hash);
    },
    createUserToken: function(user, expire) {
        return jwt.sign({
            id: user.id, 
            userType: user.type, 
            expiresIn: tokenExpiration
        }, secretCode, {
            expiresIn : tokenExpiration
        });
    },
    verifyToken: function(req, res, next) {
        // lấy header từ request
        const token = req.headers['authorization'];
        console.log(token);
        // verify token
        if (typeof token !== 'undefined') { // header của request không gửi kèm token
            jwt.verify(token, secretCode, (err, authData) => {
                if (err) {
                    res.sendStatus(403);                    
                } else {
                    next();
                }
            })
        } else {
            res.sendStatus(403);
        }
    }
}