const router = require('express').Router();
const coordinatorcontroller = require("../controllers/coordinatorcontroller");

router.post('/registration', coordinatorcontroller.register);
router.post('/login', coordinatorcontroller.login);

module.exports = router;