const knex = require('knex')(require('../knexfile'))
const striptags = require('striptags')
const user = require('./user')
const utilize = require('./utilize')

module.exports = {    
  add: async function(partnerId, title, content, expireDate) {
    try {
      const rows = await knex('employInfo').select()
      const employId = utilize.findNewIndex(rows, 'employId')
      if (expireDate == null || Date.parse(expireDate) == NaN || Date.parse(expireDate) < Date.now()) 
        return Promise.reject(new Error('Định dạng ngày không đúng'))

      await knex('employInfo').insert({
        partnerId: partnerId,     employId: employId, 
        title: title,                   
        content: content,         plaintext: striptags(content),  
        postedDate: Date.now(),   expireDate: Date.parse(expireDate)
      })
    } catch (err) {
      return Promise.reject(err)
    }
  }
}