const admin = require('../model/admin')
const utilize = require('../model/utilize')

module.exports = {
  createInternshipTerm: async function(req, res) {
    const name = req.body.name
    // date format : yyyy/mm/dd
    const startTime = Date.parse(req.body.startTime)
    const endTime = Date.parse(req.body.endTime)    
    if (isNaN(startTime) || isNaN(endTime) || startTime > endTime) 
      return res.send({success: false, error: 'Ngày tháng không hợp lệ'})
    try {
      await admin.createInternshipTerm(name, startTime, endTime)      
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },

  updateInternshipTerm: async function(req, res) {
    const internshipTermId = req.params.internshipTermId
    const name = req.body.name
    // date format : yyyy/mm/dd
    const startTime = Date.parse(req.body.startTime)
    const endTime = Date.parse(req.body.endTime)    
    if (!isNaN(startTime) && !isNaN(endTime) && startTime > endTime) 
      return res.send({success: false, error: 'Ngày tháng không hợp lệ'})
    if (!await utilize.isExisted('internshipterm', {internshipTermId: internshipTermId}))
      return res.send({success: false, error: 'Đợt thực tập bạn yêu cầu chỉnh sửa không tồn tại'})
    try {
      await admin.updateInternshipTerm(internshipTermId, name, startTime, endTime)
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },

  getAllInternshipTerm: async function(req, res) {
    try {
      const result = await admin.getAllInternshipTerm()
      res.send({res: result})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  }
}