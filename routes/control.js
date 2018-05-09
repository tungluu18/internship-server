const express = require('express');
const jsonParser = require('body-parser').json();
const authRouter = require('./auth');
const userRouter = require('./user_router');

module.exports = {
    route: function(app) {        
        //xử lý yêu cầu xác thực khi login
        app.post('/api/auth', jsonParser, (req, res) => authRouter.authenticate(req, res));        

        //lấy avatar từ profile user
        app.get('/api/user/profile/avatar', (req, res) => {
            console.log(req.query.id);
            userRouter.getAvatar(req, res, req.query.id);
        })
    }
}
