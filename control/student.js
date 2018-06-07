const student   = require('../model/student');
const employ    = require('../model/employ')
const jwt       = require('jsonwebtoken')

module.exports = {
  search: async function(req, res) {
   const keyword = req.query.keyword 
   const filter = req.query.filter
   try {
    let result = (keyword == "") ? (await employ.getAllEmployInfo())
                : (await employ.getByFilter(filter, keyword))
    res.send({res: result})
   } catch (err) {
    res.send({error: err.message})
   } 
  },

  follow: async function(req, res) {
    const requesterId = jwt.decode(req.headers['authorization']).id
    const employId = req.body.employId
    try {
      await student.follow(requesterId, employId)
      res.send({success:true, error: null})
    } catch (err) {
      res.send({success:false, error: err.message})
    }
  },

  unfollow: async function(req, res) {
    const requesterId = jwt.decode(req.headers['authorization']).id
    const employId = req.body.employId
    try {
      await student.unfollow(requesterId, employId)
      res.send({success: true, error: null})
    } catch (err) {
      res.send({'success':false, error: err.message})
    }
  }
}