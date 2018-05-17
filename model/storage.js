const multer    = require('multer')
const path      = require('path')
const knex      = require('knex')(require('../knexfile'))
const fs        = require('fs')
const folder    = './data/'

module.exports = {
  uploadAvatar: multer({
    storage: multer.diskStorage({
      destination: folder + 'avatar/',
      filename: (req, file, callback) => {
        callback(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
      }
    }),
    limits: {fileSize: 10000000} // file avatar nặng không quá 10MB
  }),  

  deleteFile: function(filename) {
    fs.unlink(folder + filename, err => console.log(err))
  }  
}