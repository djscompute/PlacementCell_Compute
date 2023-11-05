const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb://127.0.0.1:27017/TPOCompute').on('open', ()=>{
    console.log("mongodb connection done");
}).on('error', ()=>{
    console.log("mongodb connection error");
});

module.exports = connection;