const express = require('express');
const jsonParser = require('body-parser').json();

const secure = require('./secure');

const userModel = require('../model/user');
const studentRouter = require('./student');
const lecturerRouter = require('./lecturer');
const partnerRouter = require('./partner');
const userRouter = require('./user');

module.exports = {
    route: function(app) {        
        //xử lý yêu cầu xác thực khi login
        app.post('/api/auth', jsonParser, (req, res) => secure.authenticate(req, res));        

        //lấy avatar từ profile user
        app.get('/api/user/profile/avatar', secure.verifyToken, (req, res) => userRouter.getAvatar(req, res));

        // Đăng kí thêm tài khoản mới
        app.post('/api/register', jsonParser, secure.verifyToken, (req, res) => userRouter.add(req, res));

        //get thông tin user theo id
        app.get('/api/info/user', secure.verifyToken, (req, res) => userRouter.getById(req, res));

        //Xóa tài khoản
        app.post('/api/delete', jsonParser, secure.verifyToken, (req, res) => userModel.deleteById(req, res));

        // get thông tin tất cả sinh viên
        app.get('/api/admin/info/student', secure.verifyToken, (req, res) => studentRouter.getAll(res));

        // get thông tin tất cả giảng viên
        app.get('/api/admin/info/lecturer', secure.verifyToken, (req, res) => lecturerRouter.getAll(res));

        // get thông tin tất cả đối tác
        app.get('/api/admin/info/partner', secure.verifyToken, (req, res) => partnerRouter.getAll(res));

        // testing....        
    }
}
