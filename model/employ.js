const knex = require('knex')(require('../knexfile'))
const user = require('./user')
const fulltextseachlight = require('full-text-search-light') 

module.exports = {
  getAllEmployInfo: async function() {
    try {
      const employInfos = await knex('employinfo').select()
      for (e of employInfos) {
        const [partnerName, partnerAvatar] = await Promise.all([user.getName(e.partnerId), user.getAvatar(e.partnerId)])
        e.partnerName = partnerName
        e.partnerAvatar = partnerAvatar
      }
      return Promise.resolve(employInfos)
    } catch (err) {
      return Promise.reject(err)
    }    
  },


  getByFilter: async function(filter, keyword) {
    let search = new fulltextseachlight()
    if (filter == 'partner') filter = 'partnerName'
    if (filter == 'content') filter = 'plaintext'
    let filterSearch = (key, val) => (key == filter || key == 'employId')
    try {
      const employInfos = await this.getAllEmployInfo()    
      for (e of employInfos) search.add(e, filterSearch)
      let searchResult = search.search(keyword)
      let res = []
      for (let i = 0, j = 0; j < searchResult.length; ++j) {
        while (employInfos[i].employId != searchResult[j].employId) ++i
        res.push(employInfos[i++])
      }
      return Promise.resolve(res)
    } catch (err) {
      return Promise.reject(err)
    }
  }
}