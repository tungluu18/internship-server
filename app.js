const express = require('express');
const app = express();


// setting CORS
app.use((req, res, next) => {   // hỗ trợ nhận request post/get chứa cookie dạng json từ client
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Content-Type,X-Requested-With,Authorization');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
    next();
});  


// public folder
app.use(express.static('data'));


// Hỗ trợ đọc cookie từ client
const cookieParser = require('cookie-parser')
app.use(cookieParser()); 


// routing 
require("./control/control").route(app);

// PORT: listen on port 3000 unless there exists a preconfigured port
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Listening on ${port}...`);
})