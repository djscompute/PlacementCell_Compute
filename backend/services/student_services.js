const studentModel = require('../models/student_model');
const jwt = require('jsonwebtoken');

class studentService{
    static async registerstudent(email,Sapid,name,middlename,surname,department,password){
        try{
            const createstudent = new studentModel({email,Sapid,name,middlename,surname,department,password});
            return await createstudent.save();
        }catch(err){
            throw err;
        }
    }

    static async checkstudent(email){
        try {
            return await studentModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }

    static async generatetoken(tokenData, secretKey, jwt_expiry){
        return jwt.sign(tokenData, secretKey, {expiresIn: jwt_expiry});
    }
}



module.exports = studentService;