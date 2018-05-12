const admin = require('../model/admin')

module.exports = {
    getAll: async function (res) {
        try{
            let result = await admin.getAll()
            res.send(result)
        } catch (err) {
            res.send({success:false, error: err})
        }
    }
}