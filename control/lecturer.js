const lecturer = require('../model/lecturer');
const http = require('http'),
  fs = require('fs'),
  path = require('path');
const utilize = require('../model/utilize')

module.exports = {
  getStudentFollow: async function (req, res) {
    try {
      let lectureID = await req.query.id; // Id của lecture
      let yearofLecture = await req.query.year; // Năm hướng dẫn thực tập

      if (lectureID === undefined) return res.send(404);
      if (yearofLecture === undefined) {
        yearofLecture = 2018;
      }
      console.log(yearofLecture);
      // trả về sinh viên mà lecture đã hướng dẫn theo năm
      await lecturer.getStudentFollowMe(lectureID, yearofLecture).then(r => {
        res.send(r);
      });
      // }).catch(e =>{
      //     console.log(e.messenge);
      //     res.send(e.messenge);
      // });        
    } catch (err) {
      res.send({
        success: false,
        error: err.messenge
      });
    }
  },
  // Xem report của doanh nghiệp về sinh viên mình hướng dẫn (Những sinh viên đã có đánh giá)
  getReportForStudent: async function (req, res) {
    try {
      console.log("Đã nhận được yêu cầu xem report của doanh nghiệp về sinh viên");
      let lectureId = await req.query.id;
      if (lectureId === undefined) {
        return res.send(404);
      }
      await lecturer.getReportForStudent(lectureId).then(r => {
        res.status(200);
        res.send(r);
      });
    } catch (err) {
      res.send(err.messenge);
    }
  },
  judgeAssignment: async function (req, res) {
    try {
      const assignmentId = req.params.assignmentId
      const lecturerId = utilize.getRequesterId(req)

      const comment = await req.body.comment;
      const score = await req.body.score;
      // if (lectureId === undefined || studentId === undefined) {
      //   res.send({ error: "Chưa có tên " });
      // }
      if (comment === undefined || score === undefined) 
        return res.send({success: false, error: "Bạn chưa nhập đủ thông tin cho sinh viên" })
      if (score < 0 || score > 10) 
        return res.send({success: false, error: "Điểm phải nằm trong khoảng từ 0-10" })
      if (!await utilize.isExisted('assignment', {lecturerId: lecturerId, assignmentId: assignmentId}))
        return res.send({success: false, error: 'bạn không thể chấm điểm báo cáo này'})
      await lecturer.judgeAssignment(assignmentId, comment, score)
      res.send({success: true, error: null})      
    } catch (err) {      
      res.send({success: false, error: err.message});
    }
  },
  // xuất thông tin sinh viên hướng dẫn ra file excel
  getMarkAndCommentForStudent: async function (req, res) {
    try {
      let lecturerId = await req.query.lecturerId; // lấy id của lecturer
      if (lecturerId === undefined) {
        return res.send(404);
      }
      const r = await lecturer.getMarkAndCommentForStudent(lecturerId)
      res.send({res: r});      
    } catch (err) {
      res.send({success: false, error: err.message});
    }
  },
  // download điểm và đánh giá thông tin của sinh viên mà mình quản lý
  downloadMarkAndComment: async function (req, res) {
    try {
      let lecturerId = await req.query.lecturerId;
      if (lecturerId === undefined) {
        return res.send(404);
      }
      var dir = await lecturer.downloadCommentAndMarkForStudent(lecturerId)
      await res.download(dir);
      res.status(200);
    }
    catch (err) {
      res.send({error: err.message});
    }
  },
  // Lấy các sinh viên mình đang hướng dẫn thực tập
  getStudent: async function(req, res) {
    const lectureId = utilize.getRequesterId(req)
    try {
      const result = await lecturer.getStudent(lectureId)
      res.send({success: true, res: result})
    } catch (err) {
      console.log(err)
      res.send({success: false, error: err.message})
    }
  },
  // Lấy các báo cáo sinh viên nộp cho mình
  getAssignment: async function(req, res) {
    const lecturerId = utilize.getRequesterId(req)
    const studentId = req.query.studentId
    const type = req.query.type
    try {
      const result = await lecturer.getAssignment(lecturerId, studentId, type)
      res.send({success: true, res: result})
    } catch (err) {
      console.log(err)
      res.send({success: false, error: null})
    }   
  }

}