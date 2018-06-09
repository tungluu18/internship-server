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
        app.get('/adasd', (req,res) => res.send("ahihi"))

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


        // testing....  
        app.get('/api/test/:id', (req, res) => userController.getType(req, res));
        
         // get thông tin sinh viên mà mình hướng dẫn theo nam
        app.get('/api/lecturer/studentfollow',(req, res)=>{
            lecturerController.getStudentFollow(req, res);
        });
         // get báo cáo của công ty về sinh viên mà mình hướng dẫn
        app.get('/api/lecturer/reportforstudent',(req,res)=>{
            lecturerController.getReportForStudent(req,res);
        });
        /// Đánh giá của giáo viên về sinh viên mà mình hướng dẫn
        app.post('/api/lecturer/addCommentAndMarkForStudent',jsonParser, (req,res)=>{
            lecturerController.addCommentAndMarkForStudent(req,res);
        });
        // Lấy điểm và đánh giá cảu sinh viên
        app.get('/api/lecturer/getMarkAndCommentForStudent',(req,res)=>{
            lecturerController.getMarkAndCommentForStudent(req,res);
        });
        // tải về file điểm và đánh giá
        app.get('/api/lecturer/downloadMarkAndComment',(req,res)=>{
            lecturerController.downloadMarkAndComment(req,res);
        });

        //Partner
        // Cập nhật đánh giá quá trình thực tập của sinh viên
        app.post('/api/partner/commentForStudent',jsonParser ,(req,res)=>{
            console.log('adasd');
            partnerController.commentForStudent(req,res);
        });
        app.get('/api/partner/seeProfileOfStudent',(req,res)=>{
            partnerController.seeProfileOfStudent(req,res);
        });

        
    }
}
