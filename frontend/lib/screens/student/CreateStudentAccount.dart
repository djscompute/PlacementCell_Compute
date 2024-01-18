import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:placement_cell/screens/optionscreen.dart';
import 'package:placement_cell/screens/student/homescreen.dart';
import 'package:placement_cell/screens/student/login_screen_student.dart';
import '../../utils/CompanyTextFields.dart';
import '../../utils/loginformfields.dart';

class CreateStudentAccount extends StatefulWidget {
  const CreateStudentAccount({super.key});

  @override
  State<CreateStudentAccount> createState() => _CreateStudentAccountState();
}

class _CreateStudentAccountState extends State<CreateStudentAccount> {
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _surNameEditingController =
      TextEditingController();
  final TextEditingController _middlenameEditingController =
      TextEditingController();
  final TextEditingController _department = TextEditingController();
  final TextEditingController _yearPassing = TextEditingController();
  final TextEditingController _sapidEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OptionScreen()));
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 40,
                  color: Color.fromRGBO(221, 221, 254, 1),
                ),
              )),

          Positioned(
            top: 110,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Student!",
                  style: GoogleFonts.montserrat(
                      fontSize: 28,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Create your account to get started!",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Positioned(
            top: 100,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CompanyTextFields(
                    text: "Name", controller: _nameEditingController),
                CompanyTextFields(
                    text: "Middle Name",
                    controller: _middlenameEditingController),
                CompanyTextFields(
                    text: "Last Name", controller: _surNameEditingController),
                CompanyTextFields(
                    text: "Email", controller: _emailEditingController),
                CompanyTextFields(
                    text: "Sapid", controller: _sapidEditingController),
                CompanyTextFields(text: "Branch", controller: _department),
                CompanyTextFields(
                    text: "Password", controller: _passwordEditingController),
                // NewFormFields('Middle Name', _middlenameEditingController),
                // NewFormFields('Last Name', _surNameEditingController),
                // NewFormFields('Email', _emailEditingController),
                // NewFormFields('Branch', _department),
                // NewFormFields('SAPID', _sapidEditingController),
                // NewFormFields('Year Of Passing', _yearPassing),
                // NewFormFields('Password', _passwordEditingController),
              ],
            ),
          ),

          registerbtn(
            email: _emailEditingController.text,
            sapid: _sapidEditingController.text,
            password: _passwordEditingController.text,
            name: _nameEditingController.text,
            surname: _surNameEditingController.text,
            middlename: _middlenameEditingController.text,
            yearPassing: '2025',
            branch: _department.text,
          ),

          //one line
        ],
      ),
    );
  }
}

class registerbtn extends StatelessWidget {
  final String name;
  final String middlename;
  final String surname;
  final String email;
  final String sapid;
  final String branch;
  final String yearPassing;
  final String password;

  registerbtn(
      {required this.email,
      required this.sapid,
      required this.password,
      required this.name,
      required this.middlename,
      required this.surname,
      required this.branch,
      required this.yearPassing});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 40,
      right: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ElevatedButton(
          onPressed: () async {
            print("button pressed");
            if (email.isNotEmpty && sapid.isNotEmpty && password.isNotEmpty) {
              print('Button clicked');
              try {
                var regBody = {
                  "name": name,
                  "middlename": middlename,
                  "surname": surname,
                  "department": branch,
                  "email": email,
                  "yearPassing": int.parse(yearPassing),
                  "Sapid": int.parse(sapid),
                  "password": password
                };
// email, Sapid, yearPassing, name, middlename, surname, department, password
                var response = await http.post(
                  Uri.parse("http://192.168.193.65:3000/student/registration"),
                  headers: {"Content-Type": "application/json"},
                  body: jsonEncode(regBody),
                );

                var jsonResponse = jsonDecode(response.body);

                if (jsonResponse['status'] == true) {
                  print("registered successfully");

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPageStudent()),
                  );
                } else {
                  print("Something went wrong");
                }
              } catch (error) {
                print("An error occurred: $error");
              }
            }
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.lightBlueAccent),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
            child: Text(
              "Register!",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
