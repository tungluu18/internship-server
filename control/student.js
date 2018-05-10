const student = require('../model/student');

module.exports = {
    getAll: function(res) {        
        student.getAll((err, result) => {
            if (err) res.sendStatus(404);
            else {
                res.send(result);
            }
        })
    }
}