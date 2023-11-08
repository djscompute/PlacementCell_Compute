const router = require('express').Router();
const studentcontroller = require("../controllers/studentcontroller");

router.post('/registration', studentcontroller.register);
router.post('/login', studentcontroller.login);
router.get('/allstudents', studentcontroller.getAllStudents); 


module.exports = router;
