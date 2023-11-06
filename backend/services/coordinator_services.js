const coordinatorModel = require('../models/coordinator_model');
const jwt = require('jsonwebtoken');

class coordinatorService{
    static async registercoordinator(email,Sapid,name,middlename,surname,department,password){
        try{
            const createcoordinator = new coordinatorModel({email,Sapid,name,middlename,surname,department,password});
            return await createcoordinator.save();
        }catch(err){
            throw err;
        }
    }

    static async checkcoordinator(email){
        try {
            return await coordinatorModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }

    static async generatetoken(tokenData, secretKey, jwt_expiry){
        return jwt.sign(tokenData, secretKey, {expiresIn: jwt_expiry});
    }
}



module.exports = coordinatorService;