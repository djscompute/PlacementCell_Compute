const applicationService = require('../services/application_service');

exports.createApplication = async (req, res, next) => {
  try {
    const {
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
    } = req.body;

    // Assuming 'resume' is a file uploaded using multer
    const resumeFile = req.file;

    const successRes = await applicationService.createApplication(
      {
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
      },
      resumeFile
    );

    res.json({ status: true, success: 'Application created successfully' });
  } catch (error) {
    throw error;
  }
};

exports.getApplications = async (req, res, next) => {
  try {
    const allApplications = await applicationService.getApplications();
    res.status(200).json({ status: true, applications: allApplications });
  } catch (error) {
    throw error;
  }
};

exports.getApplicationsByCompanyId = async (req, res, next) => {
  try {
    const { companyId } = req.params;
    const applications = await applicationService.getApplicationsByCompanyId(companyId);
    res.status(200).json({ status: true, applications: applications });
  } catch (error) {
    throw error;
  }
};

exports.getApplicationsByStudentSapid = async (req, res, next) => {
  try {
    const { studentSapid } = req.params;
    const applications = await applicationService.getApplicationsByStudentSapid(studentSapid);
    res.status(200).json({ status: true, applications: applications });
  } catch (error) {
    throw error;
  }
};
