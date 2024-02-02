class Company {
  final String email;
  final String nameCompany;
  final List<String> department;
  final List<int> studentsApplied;
  final List<int> studentsSelected;

  Company({
    required this.studentsSelected,
    required this.email,
    required this.nameCompany,
    required this.department,
    required this.studentsApplied,
  });

  // Factory method to create a Company object from the JSON data
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      email: json['email'],
      nameCompany: json['name'],
      department: List<String>.from(json['department']),
      studentsApplied: List<int>.from(json['studentsApplied']),
      studentsSelected: List<int>.from(json['studentsSelected']),
    );
  }
}
