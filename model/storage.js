const multer    = require('multer')
const path      = require('path')
const knex      = require('knex')(require('../knexfile'))
const linkData  = 'http://localhost:3000/avatar/'
const user      = require('./user') 

module.exports = {
  upload: multer({
     storage: multer.diskStorage({
       destination: './data/avatar',
       filename: (req, file, cb) => {
         cb(null, file.fieldname + path.extname(file.originalname))
       }
     }),

     limits: {fileSize: 10000000}
  }).single('avatarImg'),

  uploadAvatar: function(req, res) {
    this.upload(req, res, (err) => {
      if (err) return res.send({success:false, error: err.message})      
      user.updateAvatar(req.params.id, '/avatar/' + req.file.filename)
      return res.send({success: true, avatar: linkData + req.file.filename, error: err})
    })
  }
}