const _ = require('lodash');

module.exports = {
    validUserPass: function(username, password) {
        if (_.trim(username) == "") 
            return {success:false, payload:{}, error:{message:"Chưa nhập username"}};
        if (_.trim(password) == "")
            return {success:false, payload:{}, error:{message:"Chưa nhập password"}};
        if (username.length > 30) 
            return {success:false, payload:{}, error:{message:"username dài quá 30 kí tự"}};
        if (password.length > 30)
            return {success:false, payload:{}, error:{message:"password dài quá 30 kí tự"}};

        return {success:true, payload:{}, error:null};
    }
}