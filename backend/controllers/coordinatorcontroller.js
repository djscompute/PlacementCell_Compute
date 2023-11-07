const coordinatorService = require('../services/coordinator_services');
const studentModel = require('../models/student_model');
exports.register = async(req,res,next)=>{
    try {
        const {email,Sapid,name,middlename,surname,department,password} = req.body;
        const successRes =await coordinatorService.registercoordinator(email,Sapid,name,middlename,surname,department,password);

        res.json({status:true,success:"coordinator registered successfully"});
    } catch (error) {
        throw error;
    }
}

exports.login = async(req,res,next)=>{
    try {
        const {email,Sapid,password} = req.body;
        const coordinator = await coordinatorService.checkcoordinator(email);

        if (!coordinator){
            throw new Error("coordinator not found");
        }

        const ismatch = coordinator.comparePassword(password);

        if(ismatch === false){
            throw new Error("Password invalid");
        }

        let tokenData = {_id:coordinator._id, email:coordinator.email};

        const token = await coordinatorService.generatetoken(tokenData, "secretKey",'1h');
        res.status(200).json({status:true, token:token})

    } catch (error) {
        throw error;
    }
}

