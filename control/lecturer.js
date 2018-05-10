const lecturer = require('../model/lecturer');

module.exports = {
    getAll: function(res) {
        lecturer.getAll((err, result) => {
            if (err) res.sendStatus(500);
            res.send(result);
        })
    }
}