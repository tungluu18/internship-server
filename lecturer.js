const knex = require('knex')(require('../knexfile'));
const json2xls = require('json2xls');
const fs = require('fs');

module.exports = {
  // Lấy thông tin sinh viên do giáo viên hướng dẫn theo năm.
  getStudentFollowMe: async function (lectureId, yearOfLecture) {
    const studentId = await knex('studentfollowme').where('lectureId', lectureId).andWhere('yearOfLecture', yearOfLecture);
    const idd = studentId.map(a => a.studentId);
    console.log(idd.length);
    if (idd.length == 0) {
      return Promise.reject(new Error("Bạn chưa nhận hướng dẫn sinh viên nào trong nam nay"));
    }
    var result = [];
    console.log('asdsadasd');
    for (var i = 0; i < idd.length; i++) {
      res = await knex.from('student').where('id', idd[i]).innerJoin('studentfollowme', 'student.id', 'studentfollowme.studentId').select('name', 'studentId')
      result.push(res[0]);
    }

    return Promise.resolve(result);
  },
  // Xem nhận xét của doanh nghiệp về quá trình thực tập của sinh viên mà mình hướng dẫn
  getReportForStudent: async function (lectureId) {
    try {
      const studentId = await knex('studentfollowme').where('lectureId', lectureId).select('studentId');
      if (studentId.length === 0) {
        return Promise.reject(new Error("Bạn chưa nhận hướng dẫn sinh viên nào"));
      }
      console.log(studentId);
      var id = studentId.map(a => a.studentId);
      console.log(id);
      var result = [];
      for (var i = 0; i < id.length; i++) {
        res = await knex('rateforstudent').where('studentId', id[i]);
        if (res.length !== 0) {
          result.push(res[0]);
        }
      }
      if (result.length == 0) {
        return Promise.reject(new Error("Sinh viên cua ban chưa được đánh giá"));
      }
      else {
        return Promise.resolve((result));
      }
    } catch (err) {
      return Promise.reject(new Error(err));
    }

  },
  /// cho điểm và đánh giá báo cáo toàn văn của sinh viên
  addCommentAndMarkForStudent: async function (lectureId, studentId, comment, mark) {
    try {
      const idOfStudent = await knex('studentfollowme').where('lectureId', lectureId).andWhere('studentId', studentId);
      if (idOfStudent.length === 0) {
        return Promise.reject(new Error("Bạn không có sinh viên để cho điểm"));
      }
      if (idOfStudent[0].linkOfReport === null) {
        return Promise.reject(new Error("Sinh viên chưa gửi báo cáo toàn văn, vì vậy bạn không thẻ cho điểm"));
      }
      await knex('studentfollowme').where('studentId', idOfStudent[0].studentId).update({
        'comment': comment,
        'mark': mark
      })
      Promise.resolve();
    } catch (err) {
      return Promise.reject(new Error(err));
    }

  },
  //in ra danh sách sinh viên mình hướng dẫn và điểm đánh giá tương ứng
  getMarkAndCommentForStudent: async function (lectureId) {
    try {
      const idOfStudent = await knex('studentfollowme').where('lectureId', lectureId);
      if (idOfStudent.length === 0) {
        return Promise.reject(new Error('Bạn chưa nhận hướng dẫn sinh viên nào'));
      }
      const idd = await idOfStudent.map(a => a.studentId);
      var result = [];
      for (var i = 0; i < idd.length; i++) {
        // get thông tin sinh viên và điểm
        const res = await knex.from('studentfollowme').where('studentId', idd[i]).innerJoin('student', 'studentfollowme.studentId', 'student.id').select('id', 'name', 'comment', 'Mark')        
        result.push(res[0]);
      }
      var xls = json2xls(result);
      await fs.writeFileSync('data/danhgiasinhvien/' + lectureId + '.xlsx', xls, 'binary');
      return Promise.resolve(result);
    }
    catch (err) {
      return Promise.reject(new Error(err));
    }
  },
  // tải thông tin điểm và đánh giá của sinh viên
  downloadCommentAndMarkForStudent: async function (lectureId) {
    const idOfStudent = await knex('studentfollowme').where('lectureId', lectureId);
    try {
      if (idOfStudent.length === 0) {
        return Promise.reject(new Error('Bạn chưa nhận hướng dẫn sinh viên nào'));
      }
      let dirname = __dirname
      dirname = dirname.replace('model', 'data\\danhgiasinhvien\\')
      var dir = dirname + lectureId + '.xlsx';
      return Promise.resolve(dir);
    } catch (errr) {
      return Promise.reject(new Error(err));
    }
  },
  // đánh giá báo cáo định kỳ của sinh viên
  commentForWeeklyReportOfStudent: async function (lecturerId, studentId, assignmentId, comment, score){
    const idOfReport = await knex('assignment').where('lecturerId', lecturerId).andWhere('studentId',studentId).andWhere('assignmentId', assignmentId);
    try{
      if (idOfReport.length === 0){
        return Promise.reject(new Error('Sinh viên chưa nộp báo cáo'));
      }
      await knex('assignment').where('assignmentId', idOfReport[0].assignmentId).update({
        'comment': comment,
        'score': score
      })
      Promise.resolve();
    }catch (err){
      return Promise.reject(new Error(err));
    }
  },
  // xem báo cáo định kỳ của sinh viên
  seeWeeklyReportOfStudent: async function(lecturerId, studentId, assignmentId){
    const idOfReport = await knex('assignment').where('lecturerId', lecturerId).andWhere('studentId',studentId).andWhere('assignmentId', assignmentId);
    try{
      if (idOfReport.length === 0){
        return Promise.reject(new Error('Sinh viên chưa nộp báo cáo'));
      }
      let dirname = __dirname
      dirname = dirname.replace('model', 'data/');
      console.log(dirname);
      dir = await knex('assignment').where('assignmentId', idOfReport[0].assignmentId).select('file','content');
      console.log(dir[0].file)
      dir[0].file = dirname + dir[0].file;
      console.log
      return Promise.resolve(dir[0]);
    }catch (err){
      return Promise.reject(new Error(err));
    }
  },
  // tải báo cáo định kỳ của sinh viên
  downloadWeeklyReportOfStudent: async function(lecturerId, studentId, assignmentId){
    const idOfReport = await knex('assignment').where('lecturerId', lecturerId).andWhere('studentId',studentId).andWhere('assignmentId', assignmentId);
    try{
      if (idOfReport.length === 0){
        return Promise.reject(new Error('Sinh viên chưa nộp báo cáo'));
      }
      let dirname = __dirname
      dirname = dirname.replace('model', 'data/');
      console.log(dirname);
      dir = await knex('assignment').where('assignmentId', idOfReport[0].assignmentId).select('file');
      console.log(dir[0].file)
      var dirc = dirname + dir[0].file;
      console.log
      return Promise.resolve(dirc);
    }catch (err){
      return Promise.reject(new Error(err));
    }
  }
  

}