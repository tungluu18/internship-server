exports.User = function(username, password, type) {
    this.username = username,    
    this.password = password,
    this.type = type
}

exports.validInput = function(input) {
    if (!input.username.trim()) 
        return {success: "false", data: {}, error:"username trong"};

    if (!input.password.trim()) 
        return {success:"false", data:{}, error:"password trong"};

    if (input.username.trim().length > 30) 
        return {success:"false", data:{}, error:"username dai hon 30 ki tu"};

    if (input.password.trim().length > 30) 
        return {success:"false", data:{}, error:"password dai hon 30 ki tu"};

    return {success:"true", data:{}, error:null};
}