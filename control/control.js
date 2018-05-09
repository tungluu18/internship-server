const express = require('express');
const jsonParser = require('body-parser').json();
const authRouter = require('./auth');
const userRouter = require('./user_router');
const userModel = require('../model/user');

module.exports = {
    route: function(app) {        
        //xử lý yêu cầu xác thực khi login
        app.post('/api/auth', jsonParser, (req, res) => authRouter.authenticate(req, res));        

        //lấy avatar từ profile user
        app.get('/api/user/profile/avatar', (req, res) => userRouter.getAvatar(req, res, req.query.id));

        // Đăng kí thêm tài khoản mới
        app.post('/api/register', jsonParser, (req, res) => userModel.add(req.body.username, req.body.password, req.body.type, res));

        //Xóa tài khoản
        app.post('/api/delete', jsonParser, (req, res) => userModel.deleteById(req, res));
    }
}
