const router = require('express').Router();
const companyController = require("../controllers/companyController");

router.post('/registration', companyController.registercompany);
router.get('/findallCompanies', companyController.getAllCompanies);
router.post('/applyCompany', companyController.addStudentToCompany);

module.exports = router;
