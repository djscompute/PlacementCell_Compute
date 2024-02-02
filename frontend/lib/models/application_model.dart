class Application {
  final String companyId;
  final String companyName;
  final int studentSapid;
  final String nameStudent;
  final String middlenameStudent;
  final String surnameStudent;
  final String studentBranch;
  final double studentGpa;
  final int student10th;
  final int student12th;
  final String studentResume;

  Application({
    required this.companyId,
    required this.companyName,
    required this.studentSapid,
    required this.nameStudent,
    required this.middlenameStudent,
    required this.surnameStudent,
    required this.studentBranch,
    required this.studentGpa,
    required this.student10th,
    required this.student12th,
    required this.studentResume,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      companyId: json['companyId'],
      companyName: json['companyName'],
      studentSapid: json['studentSapid'],
      nameStudent: json['nameStudent'],
      middlenameStudent: json['middlenameStudent'],
      surnameStudent: json['surnameStudent'],
      studentBranch: json['studentBranch'],
      studentGpa: json['studentGpa'].toDouble(),
      student10th: json['student10th'],
      student12th: json['student12th'],
      studentResume: json['studentResume'],
    );
  }
}
