const knex = require('knex')(require('../knexfile'));
const json2xls = require('json2xls');
const fs = require('fs');
const user = require('./user')
const utilize = require('./utilize')

module.exports = {
  // Lấy thông tin sinh viên do giáo viên hướng dẫn theo năm.
  getStudentFollowMe: async function (lectureId, yearOfLecture) {
    const studentId = await knex('studentfollowme').where('lectureId', lectureId).andWhere('yearOfLecture', yearOfLecture).select('studentId');
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
  judgeAssignment: async function (assignmentId, comment, score) {    
    try {
      const assignment = await utilize.getFirstElement('assignment', {assignmentId: assignmentId})
      if (assignment.file == null) return Promise.reject(new Error('Sinh viên chưa nộp báo cáo'))      
      await knex('assignment').where({assignmentId: assignmentId}).update({
        'comment': comment,
        'score': score
      })
      return Promise.resolve();
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
  // Lấy các sinh viên mình đang hướng dẫn thực tập
  getStudent: async function(lecturerId) {
    try {
      let students = await knex('intern').select().where({lecturerId, lecturerId})
      for (let e of students) {
        e.studentName = await user.getName(e.studentId)
        e.studentAvatar = 'http://localhost:3000' + await user.getAvatar(e.studentId)
        if (e.partnerId) e.partnerName = await user.getName(e.partnerId)
        e.internshipTermName = (await utilize.getFirstElement('internshipterm', {
          internshipTermId: e.internshipTermId})).name
        e.partnerName = (e.partnerId) ? await user.getName(e.partnerId) : 'Đại học Công Nghệ'
      }
      return students
    } catch (err) {
      console.log(err)
      return Promise.reject(err)
    }
  },
  // Lấy các báo cáo sinh viên nộp cho mình
  getAssignment: async function(lecturerId, studentId, type) {
    try {
      const finalAssignment = await knex('intern').select('assignmentId').whereNotNull('assignmentId')
      const finalAssignmentId = finalAssignment.map(e => e.assignmentId)      
      let assignments = await knex('assignment').select().where({lecturerId: lecturerId})
      if (type =='final')
        assignments = assignments.filter(e => utilize.inArray(finalAssignmentId, e.assignmentId))
      else 
        assignments = assignments.filter(e => !utilize.inArray(finalAssignmentId, e.assignmentId))
      for (let e of assignments) {
        e.studentName = await user.getName(e.studentId)
        if (e.file) e.file = 'http://localhost:3000' + e.file
      }
      return Promise.resolve(assignments)
    } catch (err) {
      console.log(err)
      return Promise.reject(err)
    }
  }
}