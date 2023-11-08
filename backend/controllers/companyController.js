const companyService = require('../services/company_services');

exports.registercompany = async(req,res,next)=>{
    try {
        const {email,name,department} = req.body;
        const successRes = await companyService.registercompany(email, name, department);

        res.json({ status: true, message: "🎉 Company registered successfully! 🌟" });
    } catch (error) {
        throw error;
    }
}

exports.addStudentToCompany = async (req, res, next) => {
    try {
        const { companyEmail, studentSapid } = req.body;
        const updatedCompany = await companyService.addStudentToCompany(companyEmail, studentSapid);

        if (updatedCompany === "Company not found") {
            res.status(404).json({ status: false, message: "❌ Company not found! 😔" });
        } else {
            res.status(200).json({ status: true, message: "🎉 Student added to company successfully! 🌟", company: updatedCompany });
        }
    } catch (error) {
        throw error;
    }
}


exports.getAllCompanies = async (req, res, next) => {
    try {
        const allCompanies = await companyService.getAllCompanies();
        res.status(200).json({ status: true, message: "🎉 All companies retrieved successfully! 🌟", companies: allCompanies });
    } catch (error) {
        throw error;
    }
}
