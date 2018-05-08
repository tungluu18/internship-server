const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const secretCode = "vietnamvodich";

module.exports = {
    encrypt: function(str) {
        const salt = bcrypt.genSaltSync(10);
        return bcrypt.hashSync(str, salt);
    },
    compare: function(raw, hash) {
        return bcrypt.compareSync(raw, hash);
    },
    createUserToken: function(username) {
        return jwt.sign({id : username}, secretCode, {expiresIn : 86400});
    },
    verifyUserToken: function(token) {
        try {
            return jwt.verify(token, secretCode);
        } catch(err) {
            return null;
        }
    }
}