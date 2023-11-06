// express js for routes
const express = require('express');
const bodyParser = require('body-parser');

const app = express();

const studentRouter = require('./routes/student_routes');
const coordinatorRouter = require('./routes/coordinator_routes');


app.use(bodyParser.json());
app.use('/student', studentRouter);
app.use('/coordinator', coordinatorRouter);


module.exports = app;