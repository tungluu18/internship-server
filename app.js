const express = require('express');
const app = express();

// routing 
const authRoute = require("./routes/auth");
app.use('/api/auth', authRoute);

// setting CORS
app.use((req, res, next) => {   // hỗ trợ nhận request post/get chứa cookie dạng json từ client
    res.header('Access-Control-Allow-Origin', 'http://localhost:3001');
    res.header('Access-Control-Allow-Headers', 'Content-Type,X-Requested-With');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
    next();
});  

const cookieParser = require('cookie-parser')
app.use(cookieParser());  // hộ trợ đọc cookie từ client

//PORT: listen on port 3000 unless there exists a preconfigured port
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Listening on ${port}...`);
})
