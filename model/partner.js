const knex = require('knex')(require('../knexfile'));
const user = require('./user')
const utilize = require('./utilize')
const striptags = require('striptags')

module.exports = {
  add: async function (partnerId, title, content, expireDate) {
    try {
      const rows = await knex('employInfo').select()
      const employId = utilize.findNewIndex(rows, 'employId')
      if (expireDate == null || Date.parse(expireDate) == NaN)
        return Promise.reject(new Error('Định dạng ngày không đúng'))

      await knex('employInfo').insert({
        partnerId: partnerId, employId: employId,
        title: title,
        content: content, plaintext: striptags(content),
        postedDate: Date.now(), expireDate: Date.parse(expireDate)
      })
    } catch (err) {
      console.log(err)
      return Promise.reject(err)
    }
  },

  addCommentAndMarkForStudent: async function (partnerId, studentId, comment, mark) {
    try {
      const idOfStudent = await knex('rateforstudent').where('partnerId', partnerId).andWhere('studentId', studentId);
      if (idOfStudent.length === 0) {
        return Promise.reject(new Error("Sinh viên này không thuộc công ty của bạn"));
      }
      await knex('rateforstudent').where('studentId', idOfStudent[0].studentId).update({
        comment: comment, mark: mark
      })
      return Promise.resolve();
    } catch (err) {
      return Promise.reject(new Error(err));
    }
  },
  
  seeProfileOfStudent: async function (partnerId) {
    try {
      const studentId = await knex('rateforstudent').where('partnerId', partnerId).select('studentId');
      const idd = studentId.map(a => a.studentId);
      console.log(idd.length);
      if (idd.length === 0) {
        return Promise.reject(new Error("Chưa có sinh viên đăng ký thực tập ở công ty bạn"));
      }
      var result = [];
      console.log('asdsadasd');
      for (var i = 0; i < idd.length; i++) {
        res = await knex.from('student').where('id', idd[i]).innerJoin('studentfollowme', 'student.id', 'studentfollowme.studentId');
        result.push(res[0]);
      }
      return Promise.resolve(result);
    } catch (err) {
      return Promise.reject(new Error(err));
    }
  },

  getFollower: async function(partnerId) {
    try {
      let result = await knex('following').select()
                        .join('student', 'student.id', 'following.studentId')                        
                        .where({partnerId: partnerId})
      for (let e of result) e.avatarLink = 'http://localhost:3000' + await user.getAvatar(e.studentId)
      return Promise.resolve(result)
    } catch (err) {
      return Promise.reject(err)
    }
  },

  judgeFollow: async function(followingId, judgement) {
    try {
      await knex('following').update({status: judgement}).where({followingId: followingId})
      return Promise.resolve()
    } catch (err) {
      return Promise.reject(err)
    }
  },

  getInternship: async function(partnerId) {
    try {
      let result = await knex('intern').select()              
              .join('student', 'intern.studentId', 'student.id')
              .where('partnerId', partnerId)
      for (let e of result) {
        [e.studentName, e.studentAvatar] = await Promise.all([
          user.getName(e.studentId), user.getAvatar(e.studentId) 
        ])
        e.studentAvatar = 'http://localhost:3000' + e.studentAvatar
        e.internshipTermName = (await knex('internshipterm').select().where({internshipTermId: e.internshipTermId}))[0].name
      }
      return Promise.resolve(result)
    } catch (err) {
      return Promise.reject(err)
    }
  },

  judgeInternship: async function(internId, comment) {
    try {
      await knex('intern').where({internId: internId}).update({partnerComment: comment})
      return Promise.resolve()
    } catch (err) {
      return Promise.reject(err)
    }
  }
}