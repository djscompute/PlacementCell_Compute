const companyModel = require('../models/company_model');

const jwt = require('jsonwebtoken');

class companyService{
    static async registercompany(email,name,department){
        try{
            const createcompany = new companyModel({email,name,department});
            return await createcompany.save();
        }catch(err){
            throw err;
        }
    }

    static async checkcompany(email){
        try {
            return await companyModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }

    static async generatetoken(tokenData, secretKey, jwt_expiry){
        return jwt.sign(tokenData, secretKey, {expiresIn: jwt_expiry});
    }

    static async getAllCompanies() {
        try {
            return await companyModel.find({});
        } catch (error) {
            throw error;
        }
    }
    
    
}



module.exports = companyService;