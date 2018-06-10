const partner = require('../model/partner');
const employ = require('../model/employ')

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
  }
}