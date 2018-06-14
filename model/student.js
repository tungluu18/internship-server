const knex = require('knex')(require('../knexfile'));
const _ = require('lodash');
const utilize = require('./utilize')
const storage = require('./storage')

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
    const newIndex = utilize.findNewIndex('assignment', 'assignmentId')
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
      const assignment = await utilize.getFirstElement('assignment', {assignmentId: assignmentId})      
      if (assignment.file != null) await storage.deleteFile(assignment.file)
      await knex('assignment')
        .where({assignmentId: assignmentId})
        .update({content: content, file: documentLink})            
    } catch (err) {
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
  }
}