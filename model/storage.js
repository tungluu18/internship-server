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
    fileFilter: function(req, file, callback) {
      const allowFileTypes = /jpg|jpeg|png|gif/
      const extname = path.extname(file.originalname).toLowerCase()
      if (!allowFileTypes.test(extname) || !allowFileTypes.test(file.mimetype)) 
        callback('Only allows image files');
      else 
        callback(null, true)      
    },
    limits: {fileSize: 10000000} // file avatar nặng không quá 10MB
  }),  

  uploadDocument: multer({
    storage: multer.diskStorage({
      destination: folder + 'document/',
      filename: (req, file, callback) => {
        callback(null, '[' + Date.now() + ']' + file.originalname)
      } 
    }),    
    fileFilter: function(req, file, callback) {
      const allowFileTypes = /pdf|doc|docx|rar|zip/
      const extname = path.extname(file.originalname).toLowerCase()
      if (!allowFileTypes.test(extname) || !allowFileTypes.test(file.mimetype)) 
        callback('Only allows file : doc, docx, pdf, rar, zip');
      else 
        callback(null, true)      
    },
    limits: {fileSize: 10000000} // file document nặng không quá 10MB
  }),
  
  deleteFile: function(filename) {
    fs.unlink(folder + filename, (err) => {
      if (err) console.log('ahihi' + err)
    })
  }  
}