//const UserController = require('./user/UserController');
const AuthController = require('./AuthController');
const UserController = require('./user/UserController');

const bodyParser = require('body-parser');
const express = require('express');
const app = express();

app.use(bodyParser.json());

app.use('/api/auth', AuthController);
app.use('/api/user', UserController);

//PORT: listen on port 3000 unless there exists a preconfigured port
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Listening on ${port}...`);
})
