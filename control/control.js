const express               = require('express')
const jsonParser            = require('body-parser').json()
const secure                = require('./secure')
const userModel             = require('../model/user')
const userController        = require('./user')

module.exports = {
    route: function(app) {        
        //xử lý yêu cầu xác thực khi login
        app.post('/api/auth', jsonParser, (req, res) => secure.authenticate(req, res))    

        //lấy avatar từ profile user
        app.get('/api/user/profile/avatar', secure.verifyToken, (req, res) => userController.getSidebar(req, res))

        // Đăng kí thêm tài khoản mới
        app.post('/api/admin/createUser', jsonParser, secure.verifyToken, (req, res) => userController.add(req, res))

        //get thông tin user theo id
        app.get('/api/user', secure.verifyToken, (req, res) => userController.getById(req, res))

        //Xóa tài khoản
        app.delete('/api/user/profile/delete/:id', jsonParser, secure.verifyToken, (req, res) => userController.delete(req, res))

        // get thông tin tất cả sinh viên
        app.get('/api/admin/info/:userType', secure.verifyToken, (req, res) => userController.getAll(req, res))        
        
        //put thông tin update cho tài khoản
        app.put('/api/user/profile/update/:id', jsonParser, secure.verifyToken, (req, res) => userController.update(req, res))

        //sửa password
        app.put('/api/user/changePassword/:id', jsonParser, secure.verifyToken, (req, res) => userController.updatePassword(req, res))

        // testing....  
        app.get('/api/test/:id', (req, res) => userController.getType(req, res))     
    }
}
