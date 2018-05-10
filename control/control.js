const express = require('express');
const jsonParser = require('body-parser').json();

const secure = require('./secure');
const auth = require('./auth');

const userModel = require('../model/user');
const studentModel = require('../model/student');

module.exports = {
    route: function(app) {        
        //xử lý yêu cầu xác thực khi login
        app.post('/api/auth', jsonParser, (req, res) => auth.authenticate(req, res));        

        //lấy avatar từ profile user
        app.get('/api/user/profile/avatar', secure.verifyToken, (res) => userModel.getAvatar(req, res, req.query.id));

        // Đăng kí thêm tài khoản mới
        app.post('/api/register', jsonParser, secure.verifyToken, (req, res) => userModel.add(req.body.username, req.body.password, req.body.type, res));

        //Xóa tài khoản
        app.post('/api/delete', jsonParser, secure.verifyToken, (req, res) => userModel.deleteById(req, res));

        // get thông tin tất cả sinh viên
        app.get('/api/admin/info/student/', secure.verifyToken, (req, res) => studentModel.getAll(res));

        // testing....        
    }
}
