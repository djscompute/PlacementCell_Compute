const companyService = require('../services/company_services');

exports.registercompany = async(req,res,next)=>{
    try {
        const {email,name,department} = req.body;
        const successRes =await companyService.registercompany(email,name,department);

        res.json({status:true,success:"company registered successfully"});
    } catch (error) {
        throw error;
    }
}

exports.getAllCommpanies = async (req, res, next) => {
    try {
        const getAllCommpanies = await companyService.getAllCompanies();
        res.status(200).json({ status: true, students: getAllCommpanies });
    } catch (error) {
        throw error;
    }
}
