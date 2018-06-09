const jwt     = require('jsonwebtoken');
const user    = require('../model/user')
const partner = require('../model/partner')

module.exports = {
  addEmployInfo: async function(req, res) {
    const token = req.headers['authorization']
    const requesterId = jwt.decode(token).id
    try {
      const requesterType = await user.getType(requesterId)
      if (requesterType != 'partner') return res.send({success:false, error:"Không có quyền đăng bài"})
      await partner.add(requesterId, req.body.title, req.body.content, req.body.expireDate)  
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  }
}