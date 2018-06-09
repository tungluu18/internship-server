const lecturer = require('../model/lecturer');
const http = require('http'),
    fs = require('fs'),
    path = require('path');
module.exports = {
    
    getStudentFollow: async function(req, res){
        try{
            let lectureID = await req.query.id; // Id của lecture
            let yearofLecture = await req.query.year; // Năm hướng dẫn thực tập
        
            if (lectureID === undefined) return  res.send(404);
            if (yearofLecture === undefined) {
                yearofLecture = 2018;
            }
            console.log(yearofLecture);
            // trả về sinh viên mà lecture đã hướng dẫn theo năm
            await lecturer.getStudentFollowMe(lectureID, yearofLecture).then(r =>{
                res.send(r);
            });
            // }).catch(e =>{
            //     console.log(e.messenge);
            //     res.send(e.messenge);
            // });        
        }catch(err){
            res.send({success: false,
                     error: err.messenge});
        }
    },
    // Xem report của doanh nghiệp về sinh viên mình hướng dẫn (Những sinh viên đã có đánh giá)
    getReportForStudent:async function(req, res){
        try{
            console.log("Đã nhận được yêu cầu xem report của doanh nghiệp về sinh viên");
            let lectureId = await req.query.id;
            if (lectureId === undefined ){
                return res.send(404);
            }
            await lecturer.getReportForStudent(lectureId).then( r =>{
                res.status(200);
                res.send(r);
            });
        }catch(err){
            res.send(err.messenge);
        }
    },
    addCommentAndMarkForStudent:async function(req, res){
        try{
            const lectureId = await req.query.lectureId;
            const studentId = await req.query.studentId;
            const comment = await req.body.comment;
            const mark = await req.body.mark;
            console.log(lectureId)
            console.log(studentId);
            console.log(comment);
            console.log(mark);
            if (lectureId === undefined || studentId === undefined){
                res.send({error: "Chưa có tên "});
            }
            if(comment === undefined || mark === undefined){
                console.log("sai comment")
                res.send({error: "Bạn chưa nhập đủ thông tin cho sinh viên"});
            }
            if (mark< 0 || mark > 10){
                console.log("sai ddiem");
                res.send({error: "Điểm phải nằm trong khoảng từ 0-10"});
            }
            await lecturer.addCommentAndMarkForStudent(lectureId, studentId, comment, mark).then(()=>{
                console.log("Ok")    
                res.send({success: true, 
                            error : null})
            }).catch(e=>{
                res.send(e.messenge);
            })
        }catch(err){
            res.send(err.messenge);
        }
    },
    // xuất thông tin sinh viên hướng dẫn ra file excel
    getMarkAndCommentForStudentToXlss: async function(req,res){
        try{
            let lecturerId = await req.query.lecturerId; // lấy id của lecturer
            console.log(lecturerId);
            if (lecturerId === undefined){
                return res.send(404);
            }
            await lecturer.getMarkAndCommentForStudentToXlsx(lecturerId).then( r =>{
                res.send(r);  
            });
        }catch(err){
            res.send(err.messenge);
        }
    },
    // download điểm và đánh giá thông tin của sinh viên mà mình quản lý
    downloadMarkAndComment: async function(req,res){
        try{
            let lecturerId = await req.query.lecturerId;
            if (lecturerId === undefined){
                return res.send(404);
            }
            var dir = await lecturer.downloadCommentAndMarkForStudent(lecturerId).then(r=>{
                return r;
            });
            await res.download(dir);
            res.status(200);
        }
        catch (err){
            res.send(err.messenge);
        }
    }

}