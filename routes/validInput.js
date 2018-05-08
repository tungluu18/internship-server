const _ = require('lodash');

module.exports = {
    validUserPass: function(username, password) {
        if (_.trim(username) == "") 
            return {success:false, payload:{}, error:"username trong"};
        if (_.trim(password) == "")
            return {success:false, payload:{}, error:"password trong"};
        if (username.length > 30) 
            return {success:false, payload:{}, error:"username qua dai"};
        if (password.length > 30)
            return {success:false, payload:{}, error:"password qua dai"};

        return {success:true, payload:{}, error:null};
    }
}