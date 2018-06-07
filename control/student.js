const student   = require('../model/student');
const employ    = require('../model/employ')

module.exports = {
  search: async function(req, res) {
   const keyword = req.body.keyword 
   const filter = req.body.filter
   try {
    let result = (keyword == "") ? (await employ.getAllEmployInfo())
                : (await employ.getByFilter(filter, keyword))
    res.send({res: result})
   } catch (err) {
    res.send({error: err.message})
   } 
  }
}