const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const secretCode = "vietnamvodich";
const tokenExpiration = 86400;
const _ = require("lodash");
const knex = require('knex')(require('../knexfile'));

module.exports = {
  validUserPass: function (username, password) {
    if (_.trim(username) == "")
      return { success: false, token: "", error: { message: "Chưa nhập username" } };
    if (_.trim(password) == "")
      return { success: false, token: "", error: { message: "Chưa nhập password" } };
    if (username.length > 30)
      return { success: false, token: "", error: { message: "username dài quá 30 kí tự" } };
    if (password.length > 30)
      return { success: false, token: "", error: { message: "password dài quá 30 kí tự" } };

    return { success: true, payload: {}, error: null };
  },

  authenticate: function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
    const result = this.validUserPass(username, password);

    if (result.success == false) res.send(result);

    knex('user').where('username', username).then((result) => {
      if (result.length == 0) return res.send({ success: false, token: "", error: { message: "username không tồn tại" } });

      if (this.compare(password, result[0].password)) {
        return res.send({ success: true, token: this.createUserToken(result[0], expiresIn = tokenExpiration), error: null });
      }

      return res.send({ success: false, token: "", error: { message: "Nhập sai password" } });
    })
  },

  encrypt: function (str) {
    const salt = bcrypt.genSaltSync(10);
    return bcrypt.hashSync(str, salt);
  },

  compare: function (raw, hash) {
    return bcrypt.compareSync(raw, hash);
  },

  createUserToken: function (user, expire) {
    return jwt.sign({
      id: user.id,
      userType: user.type,
      expiresIn: tokenExpiration
    }, secretCode, {
        expiresIn: tokenExpiration
      });
  },

  verifyToken: function (req, res, next) {
    // lấy header từ request
    const token = req.headers['authorization'];
    //console.log(token);
    // verify token
    if (typeof token !== 'undefined') { // header của request không gửi kèm token
      jwt.verify(token, secretCode, (err, authData) => {
        if (err)
          res.sendStatus(403);
        else next();
      })
    } else res.sendStatus(403);
  }
}