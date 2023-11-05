const mongoose = require('mongoose'); 
const db = require('../configuration/db');
const bcrypt = require('bcrypt');

const { Schema } = mongoose;

const studentSchema = new Schema({
    email:{
        type:String,
        lowercase:true,
        required : true,
        unique: true,
    },
    Sapid: {
        type: Number, // Numeric field
        required: true,
        unique: true, // Ensures uniqueness
        validate: {
            validator: function(v) {
                // Check if the Sapid is exactly 10 digits
                return /^\d{11}$/.test(v.toString());
            },
            message: 'Sapid should have exactly 10 digits.'
        }
    }, 
    name:{
        type:String,
        required : true,
    },   
    middlename:{
        type:String,
        required : true,
    },   
    surname:{
        type:String,
        required : true,
    },  
    department:{
        type:String,
        required : true,
    },  
    password:{
        type:String,
        required : true,
    },
});

studentSchema.pre('save', async function(){
    try {
        var student = this;
        const salt = await(bcrypt.genSalt(10));
        const hashpassword = await bcrypt.hash(student.password, salt);

        student.password = hashpassword;
    } catch (error) {
        throw error;
    }
})

studentSchema.methods.comparePassword = async function(studentPassword){
    try{
        const ismatch = await bcrypt.comparePassword(studentPassword, this.password);
        return ismatch;
    }catch (error){

    }
}

const studentModel = db.model('student', studentSchema);

module.exports = studentModel;