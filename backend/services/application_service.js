const ApplicationModel = require('../models/application_model');
const multer = require('multer');

class ApplicationService {
  static async createApplication(data, resumeFile) {
    try {
      const { companyId, companyName, studentSapid, nameStudent, middlenameStudent, surnameStudent, studentBranch, studentGpa, student10th, student12th } = data;
  
      // Check if resumeFile is provided and has buffer and mimetype properties
      // if (!resumeFile || !resumeFile.buffer || !resumeFile.mimetype) {
      //   throw new Error('Invalid or missing resume file');
      // }
  
      const newApplication = new ApplicationModel({
        companyId,
        companyName,
        studentSapid,
        nameStudent,
        middlenameStudent,
        surnameStudent,
        studentBranch,
        studentGpa,
        student10th,
        student12th,
        studentResume: {
          data: resumeFile.buffer,
          contentType: resumeFile.mimetype,
        },
      });
  
      return await newApplication.save();
    } catch (err) {
      throw err;
    }
  }
  

  static async getApplications() {
    try {
      return await ApplicationModel.find({});
    } catch (error) {
      throw error;
    }
  }

  static async uploadResume(req, res) {
    try {
      const storage = multer.memoryStorage();
      const upload = multer({ storage: storage }).single('resume');

      upload(req, res, async (err) => {
        if (err) {
          throw err;
        } else {
          res.send({
            filename: req.file.originalname,
            buffer: req.file.buffer,
            mimetype: req.file.mimetype,
          });
        }
      });
    } catch (error) {
      throw error;
    }
  }

  static async getApplicationsByCompanyId(companyId) {
    try {
      return await ApplicationModel.find({ companyId });
    } catch (error) {
      throw error;
    }
  }

  static async getApplicationsByStudentSapid(studentSapid) {
    try {
      return await ApplicationModel.find({ studentSapid });
    } catch (error) {
      throw error;
    }
  }
}

module.exports = ApplicationService;
