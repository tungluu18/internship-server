const multer = require('multer')
const path = require('path')

module.exports = {
  storage:  multer.diskStorage({
    destination: './data/avatar',
    filename: (req, file, callback) => {
      callback(null, file.fieldname 
          + '-' + Date.now()
          + path.extname(filename.originalname))
    }
  }),

  upload : multer({
      storage: this.storage,
      limits: {fileSize: 10000000}
  }).single('avatarImg'),

  uploadAvatar: async function(req, res) {
    console.log(req.file)
    this.upload(req, res, (err) => {
      if (err) return Promise.reject(err)
      console.log("ahihi")
      console.log(req.file)
      return Promise.resolve(req.filename)
    })
  }
}