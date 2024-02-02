const router = require('express').Router();
const applicationController = require('../controllers/applicationController');
const multer = require('multer');

// Set up multer storage for file uploads (adjust destination and filename as needed)
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

router.post('/createApplication', upload.single('resume'), applicationController.createApplication);
router.get('/getApplications', applicationController.getApplications);
router.get('/getApplicationsByCompanyId/:companyId', applicationController.getApplicationsByCompanyId);
router.get('/getApplicationsByStudentSapid/:studentSapid', applicationController.getApplicationsByStudentSapid);

module.exports = router;
