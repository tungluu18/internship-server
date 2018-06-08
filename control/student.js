const student   = require('../model/student');
const employ    = require('../model/employ')
const utilize   = require('../model/utilize')

module.exports = {
  search: async function(req, res) {
   const keyword = req.query.keyword 
   const filter = req.query.filterBy
   try {
    let result = (keyword == "") ? (await employ.getAllEmployInfo())
                : (await employ.getByFilter(filter, keyword))
    res.send({res: result})
   } catch (err) {
    res.send({error: err.message})
   } 
  },

  follow: async function(req, res) {
    const requesterId = utilize.getRequesterId(req)
    const employId = req.body.employId
    try {
  await student.follow(requesterId, employId)
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },

  unfollow: async function(req, res) {
    const requesterId = utilize.getRequesterId(req)
    const employId = req.body.employId
    try {
      await student.unfollow(requesterId, employId)
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },

  internWithLecturer: async function(req, res) {
    const requesterId = utilize.getRequesterId(req)
    const lecturerId = req.body.lecturerId
    try {
      await student.internWithLecturer(requesterId, lecturerId)
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },

  delInternWithLecturer: async function(req, res) {
    
  },

  createAssignment: async function(req, res) {
    const studentId = req.body.studentId
    const lecturerId = req.body.lecturerId
    try {

      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },
  
  uploadAssignment: async function(req, res) {
    const documentLink = '/document/' + req.file.filename
    let assignmentId          
    try {
      if (req.body.assignmentId == -1)  //create new assignment
        assignmentId = await student.createAssignment(req.body.studentId, req.body.lecturerId)
      else 
        assignmentId = req.body.assignmentId
      student.uploadAssignment(assignmentId, req.body.content, documentLink)
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  }
}