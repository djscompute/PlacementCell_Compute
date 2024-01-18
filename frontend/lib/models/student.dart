class User {
  String id;
  String email;
  int sapid;
  int yearPassing;
  String name;
  String middleName;
  String surname;
  String department;
  String password;
  int v;

  User({
    required this.id,
    required this.email,
    required this.sapid,
    required this.yearPassing,
    required this.name,
    required this.middleName,
    required this.surname,
    required this.department,
    required this.password,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      sapid: json['Sapid'],
      yearPassing: json['yearPassing'],
      name: json['name'],
      middleName: json['middlename'],
      surname: json['surname'],
      department: json['department'],
      password: json['password'],
      v: json['__v'],
    );
  }
}
