const partner = require('../model/partner');

module.exports = {
    getAll: function(res) {
        partner.getAll((err, result) => {
            if (err) res.sendStatus(500);
            res.send(result);
        })
    }
}