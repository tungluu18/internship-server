const knex = require('knex')(require('../knexfile'));
const _ = require('lodash');
const utilize = require('./utilize')
const storage = require('./storage')
const user = require('./user')

module.exports = {
  follow: async function(studentId, employId) {
    try {      
      const partnerId = (await utilize.getFirstElement('employinfo', {employId: employId})).partnerId  
      await knex('following').insert({
        studentId: studentId, 
        employId: employId, 
        partnerId: partnerId
      })
    } catch (err) {
      return Promise.reject(err)
    }
  },

  unfollow: async function(studentId, employId) {
    try {
      await knex('following').where({
        studentId: studentId, 
        employId: employId
      }).del()
    } catch (err) {
      return Promise.reject(err)
    }
  },

  isFollowing: async function(studentId, employId) {
    try {
      if (await utilize.isExisted('following', {studentId: studentId, employId: employId}))
        return Promise.resolve(true)
      else 
        return Promise.resolve(false)
    } catch (err) {
      return Promise.reject(err)
    }
  },
  
  getFollowing: async function(studentId) {
    try {
      let following = await knex('following').select()
                          .join('employinfo', 'following.employId', 'employinfo.employId')
                          .where({studentId: studentId})
      for (let e of following) {
        e.content = undefined
        e.partnerName = await user.getName(e.partnerId)
        e.partnerAvatar = 'http://localhost:3000' + await user.getAvatar(e.partnerId)
      }
      return Promise.resolve(following)
    } catch (err) {
      return Promise.reject(err)
    }
  },

  internWithLecturer: async function(studentId, lecturerId) {
    try {
      const intern = await utilize.getFirstElement('intern', {studentId: studentId})
      if (intern == null) 
        await knex('intern').insert({studentId: studentId, lecturerId: lecturerId})
      else if (intern.lecturerId != lecturerId)       
        await knex('intern')
          .where({studentId: studentId})
          .update({lecturerId: lecturerId})
    } catch (err) {
      return Promise.reject(new Error('student hoặc lecturer không tồn tại'))
    }
  },

  createAssignment: async function(studentId, lecturerId) {
    const newIndex = utilize.findNewIndex(await knex('assignment').select('assignmentId'), 'assignmentId')        
    try {
      await knex('assignment').insert({
        assignmentId: newIndex, 
        studentId: studentId, 
        lecturerId: lecturerId
      })
      return Promise.resolve(newIndex)
    } catch (err) {
      return Promise.reject(err)
    }
  },

  uploadAssignment: async function(assignmentId, content, documentLink) {    
    try {
      if (documentLink == null) documentLink = undefined
      if (content == null) content == undefined
      const assignment = await utilize.getFirstElement('assignment', {assignmentId: assignmentId})      
      if (documentLink && assignment.file) await storage.deleteFile(assignment.file)
      await knex('assignment')
        .where({assignmentId: assignmentId})
        .update({content: content, file: documentLink})            
    } catch (err) {
      console.log(err)
      return Promise.reject(err)
    }
  },

  getAssignment: async function(studentId, type) {
    try {
      const finalAssignment = await knex('intern').select('assignmentId').whereNotNull('assignmentId')
      const finalAssignmentId = finalAssignment.map(e => e.assignmentId)
      let result = (type == 'weekly')
                    ? await knex('assignment').select().where({studentId: studentId}).whereNotIn('assignmentId', finalAssignmentId)
                    : await knex('assignment').select().where({studentId: studentId}).whereIn('assignmentId', finalAssignmentId)
      for (let e of result) if (e.file) e.file = 'http://localhost:3000' + e.file
      return Promise.resolve(result)
    } catch (err) {
      console.log(err)
      return Promise.reject(err)
    }
  },

  deleteAssignment: async function(assignmentId) {
    try {
      const finalAssignment = await knex('intern').select('assignmentId').whereNotNull('assignmentId')
      const finalAssignmentId = finalAssignment.map(e => e.assignmentId)
      for (let e of finalAssignmentId) if (e == assignmentId) {
        await knex('intern').where({assignmentId: assignmentId}).update({assignmentId: null})        
        break
      }

      const assignment = await utilize.getFirstElement('assignment', {assignmentId: assignmentId})
      if (assignment && assignment.file) await storage.deleteFile(assignment.file)
      await knex('assignment').where({assignmentId: assignmentId}).del()
      return Promise.resolve()
    } catch (err) {
      console.log(err)
      return Promise.reject(err)
    }
  },

  registerLecturer: async function(studentId, lecturerId) {
    try {
      if (await utilize.isExisted('studentfollowme', {studentId: studentId})) 
        await knex('studentfollowme').update({
          lecturerId: lecturerId
        }).where({studentId: studentId})
      else 
        await knex('studentfollowme').insert({studentId: studentId, lecturerId: lecturerId})
      return Promise.resolve()
    } catch (err) {
      return Promise.reject(err)
    }
  },

  getLecturer: async function(studentId) {
    try {
      const x = await utilize.getFirstElement('studentfollowme', {studentId: studentId})
      if (x == null) return Promise.reject(new Error('Sinh viên chưa đăng kí giảng viên'))
      return Promise.resolve(x.lecturerId)      
    } catch (err) {
      return Promise.reject(err)
    }
  },

  registerInternship: async function(studentId, lecturerId, partnerId, internshipTermId) {
    try {
      if (await utilize.isExisted('intern', {studentId : studentId, internshipTermId: internshipTermId}))
        await knex('intern').update({lecturerId: lecturerId, partnerId: partnerId})
          .where({studentId: studentId, internshipTermId: internshipTermId})
      else 
        await knex('intern').insert({studentId: studentId, lecturerId: lecturerId, 
          partnerId: partnerId, internshipTermId: internshipTermId})
      return Promise.resolve()
    } catch (err) {
      return Promise.reject(err)
    }
  },

  getInternship: async function(studentId) {
    try {
      const res = await knex('intern').select().where({studentId: studentId})
      return Promise.resolve(res)
    } catch (err) {
      return Promise.reject(err)
    }
  },

  getPartnerReview: async function(studentId, partnerId) {
    if (studentId == null) studentId = undefined
    if (partnerId == null) partnerId = undefined
    try {
      let condition = {}
      if (partnerId != null) condition.partnerId = partnerId
      if (studentId != null) condition.studentId = studentId
      let result = await knex('intern').select().where(condition)      
      for (let e of result) {
        [e.studentName, e.studentAvatar] = await Promise.all([
          user.getName(e.studentId), user.getAvatar(e.studentId)
        ])
        e.studentAvatar = 'http://localhost:3000' + e.studentAvatar
        if (e.partnerId) {
          [e.partnerName, e.partnerAvatar] = await Promise.all([
            user.getName(e.partnerId), user.getAvatar(e.partnerId)
          ])
          e.partnerAvatar = 'http://localhost:3000' + e.partnerAvatar
        }
        e.internshipTermName = (await knex('internshipterm').select().where({internshipTermId: e.internshipTermId}))[0].name
      }
      return Promise.resolve(result[0])
    } catch(err) {
      console.log(err)
      return Promise.reject(err)
    }
  }
}