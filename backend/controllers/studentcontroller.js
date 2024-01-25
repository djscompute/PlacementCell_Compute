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

        // Instead of returning just the token, return the student details
        res.status(200).json({
            status: true,
            student: {
                email: student.email,
                name: student.name,
                middlename: student.middlename,
                surname: student.surname,
                department: student.department,
                Sapid: student.Sapid,
                yearPassing: student.yearPassing,
            }
        });
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

exports.uploadPdf = async (req, res, next) => {
    try {
        await studentService.uploadPdf(req, res);
    } catch (error) {
        throw error;
    }
}
