const knex = require('knex')(require('../knexfile'))
const utilize = require('./utilize')

module.exports = {
  createInternshipTerm: async function(name, startTime, endTime) {
    try {
      const rows = await knex('internshipterm').select('internshipTermId')      
      const newIndex = utilize.findNewIndex(rows, 'internshipTermId')
      await knex('internshipterm').insert({internshipTermId: newIndex, name: name, 
                            startTime: startTime, endTime: endTime})
      return Promise.resolve(true)
    } catch (err) {
      return Promise.reject(err)
    }
  },

  updateInternshipTerm: async function(internshipTermId, name, startTime, endTime) {
    let updateVer = {name, startTime, endTime}    
    if (name == null) updateVer.name = undefined
    if (isNaN(startTime)) updateVer.startTime = undefined
    if (isNaN(endTime)) updateVer.endTime = undefined
    try {
      await knex('internshipterm').update(updateVer)
        .where({internshipTermId: internshipTermId})      
    } catch (err) {
      return Promise.reject(err)
    }
  },

  getAllInternshipTerm: async function() {
    try {
      const result = await knex('internshipterm').select()
      for (let e of result) {
        e.startTime = utilize.formatDate(e.startTime)
        e.endTime = utilize.formatDate(e.endTime)
      }
      return Promise.resolve(result)
    } catch (err) {
      return Promise.reject(err)
    }
  }
}