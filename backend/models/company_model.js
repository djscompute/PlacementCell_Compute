const mongoose = require('mongoose'); 
const db = require('../configuration/db');
const bcrypt = require('bcrypt');

const { Schema } = mongoose;

const companySchema = new Schema({
    email:{
        type:String,
        lowercase:true,
        required : true,
        unique: true,
    }, 
    name:{
        type:String,
        required : true,
    },      
    department:{
        type:String,
        required : true,
    },
    studentsApplied:{
        type:[Number],
        required : false,
    },

    
});

const companyModel = db.model('company', companySchema);

module.exports = companyModel;