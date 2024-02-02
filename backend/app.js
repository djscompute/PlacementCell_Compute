// express js for routes
const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const app = express();

const studentRouter = require('./routes/student_routes');
const coordinatorRouter = require('./routes/coordinator_routes');
const companyRouter = require('./routes/company_routes');
const applicationRouter = require('./routes/application_routes');

app.use(bodyParser.json());
app.use('/student', studentRouter);
app.use('/coordinator', coordinatorRouter);
app.use('/company', companyRouter);
app.use('/application', applicationRouter);


module.exports = app;