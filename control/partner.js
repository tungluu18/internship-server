const partner = require('../model/partner');
const employ = require('../model/employ')
const utilize = require('../model/utilize')
const jwt = require('jsonwebtoken')
const user = require('../model/user')

module.exports = {
  addEmployInfo: async function (req, res) {
    const token = req.headers['authorization']
    const requesterId = jwt.decode(token).id
    try {
      const requesterType = await user.getType(requesterId)
      if (requesterType != 'partner') return res.send({ success: false, error: "Không có quyền đăng bài" })
      await partner.add(requesterId, req.body.title, req.body.content, req.body.expireDate)
      res.send({ success: true, error: null })
    } catch (err) {
      console.log(err)
      res.send({ success: false, error: err.message })
    }
  },

  commentForStudent: async function (req, res) {
    try {
      let partnerId = req.query.partnerId;
      let studentId = req.query.studentId;
      let mark = req.body.mark;
      let comment = req.body.comment;

      if (partnerId === undefined || studentId === undefined) {
        return res.send({ error: "Chưa điền đầy đủ thông tin" });
      }
      if (comment === undefined || mark === undefined) {
        console.log("sai comment")
        res.send({ error: "Bạn chưa nhập đủ thông tin cho sinh viên" });
      }
      if (mark < 0 || mark > 10) {
        console.log("sai ddiem");
        res.send({ error: "Điểm phải nằm trong khoảng từ 0-10" });
      }

      await partner.addCommentAndMarkForStudent(partnerId, studentId, comment, mark)      
      res.send({success: true, error: null})
    } catch (err) {      
      res.send({success: false, error: err.message});
    }
  },

  seeProfileOfStudent: async function (req, res) {
    try {
      let partnerId = await req.query.partnerId;
      console.log(partnerId)
      if (partnerId === undefined) return res.send(404);

      // trả về profile sinh viên
      const r = await partner.seeProfileOfStudent(partnerId)
      res.send({res: r});      
    } catch (err) {
      res.send({success: false, err: err.message});
    }
  },

  editEmployInfo: async function(req, res) {
    const title = req.body.title
    const content = req.body.content
    const expireDate = req.body.expireDate
    try {
      await employ.update(req.params.employId, title, content, expireDate)
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },

  getFollower: async function(req, res) {    
    try {
      const partnerId = utilize.getRequesterId(req)
      const result = await partner.getFollower(partnerId)
      return res.send({res: result})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },

  judgeFollow: async function(req, res) {
    try {
      const partnerId = utilize.getRequesterId(req)
      const followingId = req.params.followingId
      const judgement = req.body.judgement
      if (! await utilize.isExisted('following', {followingId: followingId, partnerId: partnerId}))
        return res.send({success: false, error: 'Truy vấn không hợp lệ'})
      await partner.judgeFollow(followingId, judgement)
      res.send({success: true, error: null})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },
  // lấy danh sách các sinh viên thực tập tại công ty
  getInternship: async function(req, res) {
    const partnerId = utilize.getRequesterId(req)
    try {
      const result = await partner.getInternship(partnerId)  
      res.send({success: true, res: result})
    } catch (err) {
      res.send({success: false, error: err.message})
    }
  },
  // đánh giá kết quả thực tập cho một sinh viên
  judgeInternship: async function(req, res) {
    const partnerId = utilize.getRequesterId(req)
    const internId = req.params.internId
    const comment = req.body.comment
    if (comment == "") return res.send({success: false, error: 'Bạn chưa nhập nội dung đánh giá'})
    try {
      if (!await utilize.isExisted('intern', {partnerId: partnerId, internId: internId}))
        return res.send({success: false, error: 'Không có quyền đánh giá sinh viên thực tập này'})
      await partner.judgeInternship(internId, comment)
      res.send({success: true, error: null})
    } catch(err) {
      res.send({success: false, error: err.message})
    }
  }
}