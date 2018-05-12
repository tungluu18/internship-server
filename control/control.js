const express               = require('express')
const jsonParser            = require('body-parser').json()

const secure                = require('./secure')

const userModel             = require('../model/user')

const studentController     = require('./student')
const lecturerController    = require('./lecturer')
const partnerController     = require('./partner')
const adminController       = require('./admin')
const userController        = require('./user')

module.exports = {
    route: function(app) {        
        //xử lý yêu cầu xác thực khi login
        app.post('/api/auth', jsonParser, (req, res) => secure.authenticate(req, res))    

        //lấy avatar từ profile user
        app.get('/api/user/profile/avatar', secure.verifyToken, (req, res) => userController.getSidebar(req, res))

        // Đăng kí thêm tài khoản mới
        app.post('/api/register', jsonParser, secure.verifyToken, (req, res) => userController.add(req, res))

        //get thông tin user theo id
        app.get('/api/user', secure.verifyToken, (req, res) => userController.getById(req, res))

        //Xóa tài khoản
        app.post('/api/delete', jsonParser, secure.verifyToken, (req, res) => userModel.deleteById(req, res))

        // get thông tin tất cả sinh viên
        app.get('/api/admin/info/:userType', secure.verifyToken, (req, res) => userController.getAll(req, res))        
        
        //put thông tin update cho tài khoản
        app.put('/api/user/profile/update/:id', jsonParser, secure.verifyToken, (req, res) => userController.update(req, res))


        // testing....  
        app.get('/api/test/:id', (req, res) => userController.getType(req, res))     
    }
}
