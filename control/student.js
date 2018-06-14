const student   = require('../model/student');
const employ    = require('../model/employ')
const utilize   = require('../model/utilize')
const user      = require('../model/user')
const knex      = require('knex')(require('../knexfile'))

module.exports = {
  search: async function(req, res) {
   const keyword = req.query.keyword 
   const filter = req.query.filterBy
   const requesterId = utilize.getRequesterId(req)
   try {
    let result = (keyword == "") ? (await employ.getAllEmployInfo())
                : (await employ.getByFilter(filter, keyword))
    for (e of result) e.following = await student.isFollowing(requesterId, e.employId)
    res.send({res: result})
   } catch (err) {
    res.send({error: err.message})
   } 
  },

  toggleFollow : async function(req, res) {
    const requesterId = utilize.getRequesterId(req)
    const employId = req.params.employId
    try {
      const [isStudentExisted, isEmployExisted] = await Promise.all([
        utilize.isExisted('student', {id: requesterId}),
        utilize.isExisted('employInfo', {employId: employId})
      ])
      if (!isStudentExisted) return res.send({success: false, error: "Sinh viên không hợp lệ"})
      if (!isEmployExisted) return res.send({success: false, error: "Bài đăng tuyển dụng không tồn tại"})

      if (await utilize.isExisted('following', {studentId: requesterId, employId: employId})) {
        // đang follow -> unfollow
        await student.unfollow(requesterId, employId)     
        res.send({following: false})
      } else {
        // đang unfollow -> follow
        await student.follow(requesterId, employId) 
        res.send({following: true})
      }
    } catch (err) {
      res.send({error: err.message})
    }
  },
  
  getFollowing: async function(req, res) {
    const studentId = utilize.getRequesterId(req)
    try {
      const following = await student.getFollowing(studentId)
      res.send({success: true, res: following})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },

  registerInternship: async function(req, res) {
    const studentId = utilize.getRequesterId(req)
    const lecturerId = req.body.lecturerId
    const partnerId = req.body.partnerId
    const internshipTermId = req.body.internshipTermId
    try {
      let [studentExist, lecturerExist, partnerExist, internshipTermExist] 
        = await Promise.all([
          utilize.isExisted('student', {id: studentId}),
          utilize.isExisted('lecturer', {id: lecturerId}),
          utilize.isExisted('partner', {id: partnerId}),          
          utilize.isExisted('internshipterm', {internshipTermId: internshipTermId})
      ])      
      if (partnerId == 0) partnerExist = true
      if (!studentExist || !partnerExist || !lecturerExist || !internshipTermExist)
        return res.send({success: false, error: 'Không hợp lệ'})
      if (partnerId != 0 && !await utilize.isExisted('following', {studentId: studentId, partnerId: partnerId, status: 'Accepted'}))
        return res.send({success: false, error: 'Sinh vien phải đăng kí đối tác mà mình đã được nhận'})
      await student.registerLecturer(studentId, lecturerId)
      await student.registerInternship(studentId, lecturerId, partnerId, internshipTermId)        
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },

  getInternship: async function(req, res) {
    const studentId = utilize.getRequesterId(req)
    if (!await utilize.isExisted('student', {id: studentId})) 
      return res.send({success: false, error: 'Sinh viên không hợp lệ'})
    try {
      let result = await student.getInternship(studentId)
      for (e of result) {
        if (e.partnerId) e.partnerName = await user.getName(e.partnerId)
        e.lecturerName = await user.getName(e.lecturerId)
        const internshipTerm = await knex('internshipterm').select().where({internshipTermId: e.internshipTermId})        
        e.internshipTermName = internshipTerm[0].name
      }
      res.send({success: true, res: result})
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
      student.createAssignment(studentId, lecturerId)
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
  },

  registerLecturer: async function(req, res) {
    const studentId = utilize.getRequesterId(req)
    const lecturerId = req.query.lecturerId    
    try {
      const [studentExist, lecturerExist] = await Promise.all([
          utilize.isExisted('student', {id: studentId}),
          utilize.isExisted('lecturer', {id: lecturerId})
      ])
      if (!studentExist) return res.send({success: false, error: 'Sinh viên không có trong hệ thống'})
      if (!lecturerExist) return res.send({success: false, error: 'Giảng viên không có trong hệ thống'})
      await student.registerLecturer(studentId, lecturerId)
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },

  getLecturer: async function(req, res) {
    const studentId = utilize.getRequesterId(req)
    try {
      if (!await utilize.isExisted('student', {id: studentId}))
        return res.send({success: false, error: 'Sinh viên không hợp lệ'})
      const lecturerId = await student.getLecturer(studentId)
      const lecturer = await user.getProfile(lecturerId)
      res.send({success: true, res: lecturer})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  }
}