const knex = require('knex')(require('../knexfile'))
const striptags = require('striptags')
const user = require('./user')
const utilize = require('./utilize')

module.exports = {    
  add: async function(partnerId, title, content) {
    try {
      const rows = await knex('employInfo').select()
      const employId = utilize.findNewIndex(rows, 'employId')
      const date = Date.now()    
      await knex('employInfo').insert({
        'partnerId': partnerId,           'employId': employId, 
        'title': title,                   'content': content, 
        'plaintext': striptags(content),  'date_create': date        
      })
    } catch (err) {
      return Promise.reject(err)
    }
  }
}