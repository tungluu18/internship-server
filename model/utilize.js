const knex = require('knex')(require('../knexfile'))
const jwt  = require('jsonwebtoken')

module.exports = {
  findNewIndex: function(arr, id) {
    let newIndex = 1
    for (let element of arr) 
      if (element[id] !== newIndex) break; else newIndex++
    return newIndex
  },
  
  isExisted: async function(table, condition) {
    try {
      const get = await knex(table).select().where(condition)      
      return Promise.resolve(get.length > 0)
    } catch (err) {
      return Promise.resolve(true)
    }
  },

  getFirstElement: async function(table, condition) {
    try {
      const get = await knex(table).select().where(condition)
      if (get.length == 0) return Promise.resolve(null)
      return Promise.resolve(get[0])
    } catch (err) {
      return Promise.reject(err)
    }
  },

  getRequesterId: function(req) {
    return jwt.decode(req.headers['authorization']).id
  },

  formatDate: function(millisecond) {    
    const thisDate = new Date(Number(millisecond))    
    const year = thisDate.getFullYear()
    const month = thisDate.getMonth() + 1
    const day = thisDate.getDate()
    return year + '/' + month + '/' + day
  }
}