const multer = require('multer')
const path = require('path')

// set storage engine
const storage = multer.diskStorage({
  destination: '../data/avatar',
  filename: (req, file, callback) => {
    callback(null, file.fieldname 
        + '-' + Date.now()
        + path.extname(filename.originalname))
  }
})

// init upload
const upload = multer({
  storage: storage,
  limits: {fileSize: 10000000} //10MB
}).single('avatarImg')

module.exports = {
  uploadAvatar: async function(req, res) {
    upload(req, res, (err) => {
      if (err) return Promise.reject(err)
      console.log("ahihi")
      console.log(req.file)
      return Promise.resolve(req.filename)
    })
  }
}