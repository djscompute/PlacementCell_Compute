const studentModel = require('../models/user_model');
const jwt = require('jsonwebtoken');

class studentService{
    static async registerstudent(email,Sapid,password){
        try{
            const createstudent = new studentModel({email, Sapid,password});
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