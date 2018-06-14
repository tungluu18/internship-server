const express = require('express')
const jsonParser = require('body-parser').json()

const secure = require('./secure')
const studentController = require('./student')
const lecturerController = require('./lecturer')
const partnerController = require('./partner')
const adminController = require('./admin')
const userController = require('./user')

const userModel = require('../model/user')
const storage = require('../model/storage')
const employ = require('../model/employ')

module.exports = {
  route: function (app) {
    app.use(jsonParser)
    // xử lý yêu cầu xác thực khi login
    app.post('/api/auth', (req, res) => {
      secure.authenticate(req, res)
    })
    /*=====================================================================================================================================*/
    /*=============================================== USER' S FUNCTIONS ===================================================================*/
    /*=====================================================================================================================================*/
    // lấy avatar từ profile user
    app.get('/api/user/profile/avatar', secure.verifyToken, (req, res) => {
      userController.getSidebar(req, res)
    })
    // Đăng kí thêm tài khoản mới
    app.post('/api/admin/createUser', secure.verifyToken, (req, res) => {
      userController.add(req, res)
    })
    // get thông tin user theo id
    app.get('/api/user', secure.verifyToken, (req, res) => {
      userController.getById(req, res)
    })
    // Xóa tài khoản
    app.delete('/api/user/profile/delete/:id', secure.verifyToken, (req, res) => {
      userController.delete(req, res)
    })
    // get thông tin tất cả
    app.get('/api/admin/info/:userType', secure.verifyToken, (req, res) => {
      userController.getAll(req, res)
    })
    // get thông tin 1 id
    app.get('/api/user/profile/:id', (req, res) => {
      userController.getById(req, res)
    })
    // put thông tin update cho tài khoản
    app.put('/api/user/profile/update/:id', secure.verifyToken, (req, res) => {
      userController.update(req, res)
    })
    // sửa password
    app.put('/api/user/changePassword/:id', secure.verifyToken, (req, res) => {
      userController.updatePassword(req, res)
    })
    // sửa avatar
    app.use('/api/user/profile/:id/avatar', storage.uploadAvatar.single('avatarImg'), (err, req, res, next) => {
      if (err) {
        console.log(err)
        return res.send({ success: false, error: err.message });
      }
      next()
    })
    app.put('/api/user/profile/:id/avatar', (req, res) => {
      userController.updateAvatar(req, res)
    })   
    // gửi tin nhắn
    app.post('/api/message/send', (req, res) => {
      userController.sendMessage(req, res)
    })
    // xem tin nhắn
    app.get('/api/message/view', (req, res) => {
      userController.getMessageByFilter(req, res)
    })
    // nhận tin nhắn
    app.get('/api/message/view/:messageId', (req, res) => {
      userController.receiveMessage(req, res)
    })
    // lấy tất cả thông tin 
    app.get('/api/profile/:type', (req, res) => {
      userController.getByType(req, res)
    })
    /*=====================================================================================================================================*/
    /*=============================================== STUDENT' S FUNCTIONS ================================================================*/
    /*=====================================================================================================================================*/
    // follow và unfollow 
    app.put('/api/employInfo/:employId', secure.verifyToken, (req, res) => {
      studentController.toggleFollow(req, res)
    })
    // xem trạng thái ứng tuyển
    app.get('/api/student/following', secure.verifyToken, (req, res) => {
      studentController.getFollowing(req, res)
    })
    // chức năng tìm kiếm
    app.get('/api/search', (req, res) => {
      studentController.search(req, res)
    })
    // lấy html từng bài đăng cụ thể
    app.get('/api/employInfo/:employId', (req, res) => {
      employ.getById(req, res)
    })
    // Upload Báo cáo 
    app.post('/api/student/upload/document', storage.uploadDocument.single('document'), (err, req, res, next) => {
      if (err) {
        console.log(err)
        return res.send({ success: false, error: err.message })
      }
      next()
    })
    app.post('/api/student/upload/document', (req, res) => {
      studentController.uploadAssignment(req, res)
    })
    // đăng kí giảng viên hướng dẫn
    app.post('/api/student/registerLecturer', secure.verifyToken, (req, res) => {
      studentController.registerLecturer(req, res)
    })
    // xem giảng viên hướng dẫn
    app.get('/api/student/lecturer', secure.verifyToken, (req, res) => {
      studentController.getLecturer(req, res)
    }) 
    // đăng kí thực tập
    app.post('/api/student/internship/register', secure.verifyToken, (req, res) => {
      studentController.registerInternship(req, res)
    })
    // xem các đợt thực tập đã đăng kí
    app.get('/api/student/internship', secure.verifyToken, (req, res) => {
      studentController.getInternship(req, res)
    })

    /*=====================================================================================================================================*/
    /*=============================================== LECTURER' S FUNCTIONS ================================================================*/
    /*=====================================================================================================================================*/
    // get thông tin sinh viên mà mình hướng dẫn theo nam
    app.get('/api/lecturer/studentfollow', (req, res) => {
      lecturerController.getStudentFollow(req, res);
    });
    // get báo cáo của công ty về sinh viên mà mình hướng dẫn
    app.get('/api/lecturer/reportforstudent', (req, res) => {
      lecturerController.getReportForStudent(req, res);
    });
    /// Đánh giá của giáo viên về sinh viên mà mình hướng dẫn
    app.post('/api/lecturer/addCommentAndMarkForStudent', jsonParser, (req, res) => {
      lecturerController.addCommentAndMarkForStudent(req, res);
    });
    // Lấy điểm và đánh giá của sinh viên
    app.get('/api/lecturer/getMarkAndCommentForStudent', (req, res) => {
      lecturerController.getMarkAndCommentForStudent(req, res);
    });
    // tải về file điểm và đánh giá
    app.get('/api/lecturer/downloadMarkAndComment', (req, res) => {
      lecturerController.downloadMarkAndComment(req, res);
    });

    /*=====================================================================================================================================*/
    /*=============================================== PARTNER' S FUNCTIONS ================================================================*/
    /*=====================================================================================================================================*/
    // Cập nhật đánh giá quá trình thực tập của sinh viên
    app.post('/api/partner/commentForStudent', secure.verifyToken, (req, res) => {
      partnerController.commentForStudent(req, res);
    });
    app.get('/api/partner/seeProfileOfStudent', secure.verifyToken, (req, res) => {
      partnerController.seeProfileOfStudent(req, res);
    });
    // thêm bài đăng tuyển dụng cho partner
    app.post('/api/employInfo/create', secure.verifyToken, (req, res) => {
      partnerController.addEmployInfo(req, res)
    })
    // chỉnh sửa bài đăng tuyển dụng
    app.put('/api/employInfo/edit/:employId', secure.verifyToken, (req, res) => {
      partnerController.editEmployInfo(req, res)
    })
    // xóa bài đăng tuyển dụng
    app.delete('/api/employInfo/delete/:employId', secure.verifyToken, (req, res) => {
      try{
        employ.delete(req.params.employId)
        res.send({success: true, error: null})
      } catch (err) {
        res.send({success: false, error: err.message})
      }
    })
    // kiểm tra tất cả các student đang follow mình
    app.get('/api/partner/following', (req, res) => {
      partnerController.getFollower(req, res)
    })
    // partner xác nhận sinh viên được nhận hay không
    app.put('/api/partner/following/:followingId', (req, res) => {
      partnerController.judgeFollow(req, res)
    })
    // lấy tất cả các sinh viên đang thực tập tại công ty mình
    app.get('/api/partner/internship', (req, res) => {
      partnerController.getInternship(req, res)
    })
    
    /*=====================================================================================================================================*/
    /*================================================= ADMIN' S FUNCTIONS ================================================================*/
    /*=====================================================================================================================================*/
    app.post('/api/admin/internshipTerm/create', (req, res) => {
      adminController.createInternshipTerm(req, res)
    })  
    app.put('/api/admin/internshipTerm/update/:internshipTermId', (req, res) => {
      adminController.updateInternshipTerm(req, res)
    })
    app.get('/api/admin/internshipTerm', (req, res) => {
      adminController.getAllInternshipTerm(req, res)
    })
  }
}
