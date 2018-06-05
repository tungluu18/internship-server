const knex = require('knex')(require('../knexfile'))
const striptags = require('striptags')

module.exports = {  
  findNewId: function(rows) {
    let newId = 1
    for (let element of rows) {
      if (element.employId !== newId) break
      newId++
    }
    return newId
  },

  add: async function(companyId, title, content) {
    try {
      const rows = await knex('employInfo').select()
      const employId = this.findNewId(rows)
      const date = Date.now()            
      await knex('employInfo').insert({
        'companyId': companyId,           'employId': employId, 
        'title': title,                   'content': content, 
        'plaintext': striptags(content),  'date_create': date  
      })
    } catch (err) {
      return Promise.reject(err)
    }
  }
}