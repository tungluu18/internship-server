const lecturer = require('../model/lecturer');
const http = require('http'),
fs = require('fs'),
path = require('path');

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
  // đánh giá báo cáo toàn văn của sinh viên
  addCommentAndMarkForStudent: async function (req, res) {
    try {
      const lectureId = await req.query.lectureId;
      const studentId = await req.query.studentId;
      const comment = await req.body.comment;
      const mark = await req.body.mark;
      //console.log(lectureId)
      //console.log(studentId);
      //console.log(comment);
      //console.log(mark);
      if (lectureId === undefined || studentId === undefined) {
        return res.send({ error: "Chưa có tên " });
      }
      if (comment === undefined || mark === undefined) {
        console.log("sai comment")
        return res.send({ error: "Bạn chưa nhập đủ thông tin cho sinh viên" });
      }
      if (mark < 0 || mark > 10) {
        console.log("sai ddiem");
        return res.send({ error: "Điểm phải nằm trong khoảng từ 0-10" });
      }
      // if (comment === null) {
      //   res.send({ error: "Chưa nhập đánh giá sinh viên" })
      // }
      await lecturer.addCommentAndMarkForStudent(lectureId, studentId, comment, mark)
      return res.send({success: true, error: null})      
    } catch (err) {      
      res.send({success: false, error: err.message});
    }
  },
  // Xem báo cáo định kỳ của sinh viên
  seeWeeklyReportOfStudent: async function(req,res){
    try{
      let lecturerId = await req.query.lecturerId;
      let studentId = await req.query.studentId;
      let assignmentId = await req.query.assignmentId;
      if (lecturerId === undefined || studentId === undefined || assignmentId === undefined){
        return res.send(404);
      }
      var tempFile= await lecturer.seeWeeklyReportOfStudent(lecturerId,studentId,assignmentId);
      console.log(tempFile);
      
      await res.send(tempFile);
    }catch(err){
      return res.send({error: err.message});
    }
  },
  // Tải báo cáo định kỳ của sinh viên
  downloadWeeklyReportOfStudent: async function(req,res){
    try{
      let lecturerId = await req.query.lecturerId;
      let studentId = await req.query.studentId;
      let assignmentId = await req.query.assignmentId;
      if (lecturerId === undefined || studentId === undefined || assignmentId === undefined){
        return res.send(404);
      }
      var tempFile= await lecturer.downloadWeeklyReportOfStudent(lecturerId,studentId,assignmentId);
      console.log(tempFile);
      
      await res.download(tempFile);
    }catch(err){
      return res.send({error: err.message});
    }
  },
  //đánh giá báo cáo định kỳ của sinh viên: 
  commentForWeeklyReportOfStudent: async function(req, res){
    try{
      let lecturerId = await req.query.lecturerId;
      let studentId = await req.query.studentId;
      let assignmentId = await req.query.assignmentId;
      let comment =req.body.comment;
      let score = req.body.score;

      if (lecturerId === undefined || studentId === undefined || assignmentId === undefined){
        return res.send(404);
      }

      if (comment === undefined || score === undefined) {
        console.log("sai comment")
        return res.send({ error: "Bạn chưa nhập đủ thông tin cho sinh viên" });
      }

      if (score < 0 || score > 10) {
        console.log("sai ddiem");
        return res.send({ error: "Điểm phải nằm trong khoảng từ 0-10" });
      }

      await lecturer.commentForWeeklyReportOfStudent(lecturerId, studentId, assignmentId, comment, score)
      return res.send({success: true, error: null})

    }catch (err){
      res.send({error: err.message});
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
  }
  


}