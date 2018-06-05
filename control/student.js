const student   = require('../model/student');
const employ    = require('../model/employ')
const fulltextseachlight = require('full-text-search-light') 

module.exports = {
  search: async function(req, res) {
    const keyword = req.params.keyword
    const search = new fulltextseachlight()
    const filter = (key, value) => (key == 'employId' || key == 'plaintext' || key == 'title')

    try {
      const EmployInfo = await employ.getAllEmployInfo()
      for (e of EmployInfo) search.add(e, filter)      
      const searchResult = search.search(keyword)
      const result = []
      for (var i = 0, j = 0; j < searchResult.length; ++j) {
        while (EmployInfo[i].employId != searchResult[j].employId) ++i
        result.push(EmployInfo[i++])
      }
      res.send({res: result})
    } catch (err) {
      res.send({error: err.message})
    }
  },

  getAllEmployInfo: async function(req, res) {
    try {
      const result = await employ.getAllEmployInfo()
      //console.log(result)
      res.send({res: result}) 
    } catch (err) {
      res.send({error: err.message})
    }    
  }
}