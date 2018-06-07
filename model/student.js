const knex = require('knex')(require('../knexfile'));
const _ = require('lodash');

module.exports = {
  follow: async function(studentId, employId) {
    try {
      const followed = await knex('following').select()
        .where('studentId', studentId).andWhere('employId', employId)
      if (followed.length > 0) 
        return Promise.reject(new Error("Đã follow"))

      const partnerId = (await knex('employinfo').select()
        .where('employId', employId))[0].partnerId

      await knex('following').insert({
        'studentId': studentId, 
        'employId': employId, 
        'partnerId': partnerId
      })
    } catch (err) {
      return Promise.reject(err)
    }
  },

  unfollow: async function(studentId, employId) {
    try {
      const followed = await knex('following').select()
        .where('studentId', studentId).andWhere('employId', employId)
      if (followed.length == 0) 
        return Promise.reject(new Error("Không thành công"))

      await knex('following').where({
        'studentId': studentId, 
        'employId': employId
      }).del()
    } catch (err) {
      return Promise.reject(err)
    }
  }
}