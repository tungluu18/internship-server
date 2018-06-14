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
    app.get('/api/user/profile/:id', secure.verifyToken, (req, res) => {
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
    app.put('/api/user/profile/:id/avatar', secure.verifyToken, (req, res) => {
      userController.updateAvatar(req, res)
    })   
    // gửi tin nhắn
    app.post('/api/message/send', secure.verifyToken, (req, res) => {
      userController.sendMessage(req, res)
    })
    // xem tin nhắn
    app.get('/api/message/view', secure.verifyToken, (req, res) => {
      userController.getMessageByFilter(req, res)
    })
    // nhận tin nhắn
    app.get('/api/message/view/:messageId', secure.verifyToken, (req, res) => {
      userController.receiveMessage(req, res)
    })
    // lấy tất cả thông tin 
    app.get('/api/profile/:type', secure.verifyToken, (req, res) => {
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
    app.get('/api/search', secure.verifyToken, (req, res) => {
      studentController.search(req, res)
    })
    // lấy html từng bài đăng cụ thể
    app.get('/api/employInfo/:employId', secure.verifyToken, (req, res) => {
      employ.getById(req, res)
    })
    // Upload Báo cáo 
    app.post('/api/student/assignment', storage.uploadDocument.single('document'), (err, req, res, next) => {
      if (err) {
        console.log(err)
        return res.send({ success: false, error: err})
      }
      next()
    })
    app.post('/api/student/assignment', secure.verifyToken, (req, res) => {
      studentController.createAssignment(req, res)
    })
    // lấy tất cả các báo cáo đã nộp
    app.get('/api/student/assignment', secure.verifyToken, (req, res) => {
      studentController.getAssignment(req, res)
    })
    // sửa báo cáo đã nộp
    app.put('/api/student/assignment/:assignmentId', storage.uploadDocument.single('document'), (err, req, res, next) => {
      console.log("dmm")
      console.log(req)
      if (err) {
        console.log(err)
        return res.send({success: false, 
          error: err})
      }
      next()
    })
    app.put('/api/student/assignment/:assignmentId', secure.verifyToken, (req, res) => {
      studentController.editAssignment(req, res)
    })
    // xóa báo cáo đã nộp
    app.delete('/api/student/assignment/:assignmentId', secure.verifyToken, (req, res) => {
      studentController.deleteAssignment(req, res)
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
    // lấy thông tin các sinh viên mà mình hướng dẫn
    app.get('/api/lecturer/student', secure.verifyToken, (req, res) => {
      lecturerController.getStudent(req, res)
    })
    // get thông tin sinh viên mà mình hướng dẫn theo nam
    app.get('/api/lecturer/studentfollow', secure.verifyToken, (req, res) => {
      lecturerController.getStudentFollow(req, res);
    });
    // get báo cáo của công ty về sinh viên mà mình hướng dẫn
    app.get('/api/lecturer/reportforstudent', secure.verifyToken, (req, res) => {
      lecturerController.getReportForStudent(req, res);
    });    
    // Lấy điểm và đánh giá của sinh viên
    app.get('/api/lecturer/getMarkAndCommentForStudent', (req, res) => {
      lecturerController.getMarkAndCommentForStudent(req, res);
    });
    // tải về file điểm và đánh giá
    app.get('/api/lecturer/downloadMarkAndComment', (req, res) => {
      lecturerController.downloadMarkAndComment(req, res);
    });
    // lấy các báo cáo của sinh viên nộp cho mình
    app.get('/api/lecturer/assignment', secure.verifyToken, (req, res) => {
      lecturerController.getAssignment(req, res)
    })
    /// Đánh giá của giảng viên về báo cáo của sinh viên
    app.put('/api/lecturer/assignment/judge/:assignmentId', secure.verifyToken, (req, res) => {
      lecturerController.judgeAssignment(req, res);
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
    app.put('/api/partner/internship/judge/:internId', secure.verifyToken, (req, res) => {
      partnerController.judgeInternship(req, res)
    })
    // Lấy các nhận xét của doanh nghiệp cho sinh viên
    app.get('/api/internReview', (req, res) => {
      studentController.getPartnerReview(req, res)
    })
    /*=====================================================================================================================================*/
    /*================================================= ADMIN' S FUNCTIONS ================================================================*/
    /*=====================================================================================================================================*/
    app.post('/api/admin/internshipTerm/create', secure.verifyToken, (req, res) => {
      adminController.createInternshipTerm(req, res)
    })  
    app.put('/api/admin/internshipTerm/update/:internshipTermId', secure.verifyToken, (req, res) => {
      adminController.updateInternshipTerm(req, res)
    })
    app.get('/api/admin/internshipTerm', secure.verifyToken, (req, res) => {
      adminController.getAllInternshipTerm(req, res)
    })
  }
}
