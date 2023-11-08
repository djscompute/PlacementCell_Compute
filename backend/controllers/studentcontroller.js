const studentService = require('../services/student_services');

exports.register = async (req, res, next) => {
    try {
        const { email, Sapid, yearPassing, name, middlename, surname, department, password } = req.body;
        const successRes = await studentService.registerstudent(email, Sapid, yearPassing, name, middlename, surname, department, password);

        res.json({ status: true, success: "student registered successfully" });
    } catch (error) {
        throw error;
    }
}

exports.login = async (req, res, next) => {
    try {
        const { email, Sapid, password } = req.body;
        const student = await studentService.checkstudent(email);

        if (!student) {
            throw new Error("student not found");
        }

        const ismatch = student.comparePassword(password);

        if (ismatch === false) {
            throw new Error("Password invalid");
        }

        let tokenData = { _id: student._id, email: student.email, name: student.name, department: student.department };

        const token = await studentService.generatetoken(tokenData, "secretKey", '1h');
        res.status(200).json({ status: true, token: token });
    } catch (error) {
        throw error;
    }
}

exports.getAllStudents = async (req, res, next) => {
    try {
        const allStudents = await studentService.getAllStudents();
        res.status(200).json({ status: true, students: allStudents });
    } catch (error) {
        throw error;
    }
}

