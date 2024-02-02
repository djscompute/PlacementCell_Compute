const mongoose = require('mongoose');
const db = require('../configuration/db');

const {Schema} = mongoose;

const applicationSchema = new Schema({
    companyId :{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'company',
        required: true,
    },

    companyName : {
        type: String,
        required: true,
    },

    studentSapid : {
        type: Number, 
        required: true,
    },

    nameStudent : {
        type: String,
        required: true,
    },

    middlnameStudent : {
        type: String,
        required : true,
    },

    surnameStudent : {
        type: String,
        required : true,
    },

    studentBranch:{
        type: String,
        required : true,
    },

    studentGpa : {
        type: Number,
        required  : true,
    },

    student10th : {
        type: Number,
        required  : true,
    },

    student12th : {
        type: Number,
        required  : true,
    },

    studentResume : {
        data: Buffer, // Store binary data
        contentType: String,
    }
    
});

const  applicationModel = db.model('application', applicationSchema);

module.exports = applicationModel;