const studentModel = require('../models/student_model');
const CompanyModel = require('../models/company_model');
const jwt = require('jsonwebtoken');
const multer = require('multer');
const PdfModel = require('../models/pdf_model');
class studentService{
    static async registerstudent(email,Sapid,yearPassing,name,middlename,surname,department,password){
        try{
            const createstudent = new studentModel({email,Sapid,yearPassing,name,middlename,surname,department,password});
            return await createstudent.save();
        }catch(err){
            throw err;
        }
    }

    static async checkstudent(email){
        try {
            return await studentModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }

    static async getAllStudents() {
        try {
            return await studentModel.find({});
        } catch (error) {
            throw error;
        }
    }

    static async uploadPdf(req, res) {
        try {
          const storage = multer.diskStorage({
            destination: (req, file, cb) => {
              cb(null, 'uploads/');
            },
            filename: (req, file, cb) => {
              cb(null, Date.now() + '-' + file.originalname);
            },
          });
    
          const upload = multer({ storage: storage }).single('pdf');
    
          upload(req, res, async (err) => {
            if (err) {
              throw err;
            } else {
              const pdf = new PdfModel({
                filename: req.file.filename,
                path: req.file.path,
              });
    
              await pdf.save();
              res.send('File uploaded successfully!');
            }
          });
        } catch (error) {
          throw error;
        }
      }
    
}

module.exports = studentService;