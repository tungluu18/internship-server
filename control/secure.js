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
    createUserToken: function(user, expire) {
        return jwt.sign({id: user.id, userType: user.type, expiresIn: expire}, secretCode, {expiresIn : 86400});
    },
    verifyUserToken: function(token) {
        try {
            return jwt.verify(token, secretCode);
        } catch(err) {
            return null;
        }
    }
}