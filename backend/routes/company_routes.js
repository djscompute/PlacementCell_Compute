const router = require('express').Router();
const companyController = require("../controllers/companyController");

router.post('/registration', companyController.registercompany);
router.get('/findallCompanies', companyController.getAllCommpanies);

module.exports = router;
