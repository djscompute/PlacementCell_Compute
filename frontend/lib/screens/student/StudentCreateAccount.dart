import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:placement_cell/screens/optionscreen.dart';
import 'package:placement_cell/screens/student/StudentLoginScreen.dart';
import 'package:placement_cell/utils/CompanyTextFields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CreateStudentAccount extends StatefulWidget {
  const CreateStudentAccount({Key? key}) : super(key: key);

  @override
  State<CreateStudentAccount> createState() => _CreateStudentAccountState();
}

class _CreateStudentAccountState extends State<CreateStudentAccount> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _sapidController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OptionScreen()),
                );
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
                color: Color.fromRGBO(221, 221, 254, 1),
              ),
            ),
          ),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Create your account to get started!",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            bottom: 0,
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CompanyTextFields(
                  text: "Name",
                  controller: _nameController,
                ),
                CompanyTextFields(
                  text: "Middle Name",
                  controller: _middleNameController,
                ),
                CompanyTextFields(
                  text: "Last Name",
                  controller: _lastNameController,
                ),
                CompanyTextFields(
                  text: "Email",
                  controller: _emailController,
                ),
                CompanyTextFields(
                  text: "Sapid",
                  controller: _sapidController,
                ),
                CompanyTextFields(
                  text: "Branch",
                  controller: _branchController,
                ),
                CompanyTextFields(
                  text: "Password",
                  controller: _passwordController,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 40,
            right: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ElevatedButton(
                onPressed: () async {
                  print("button pressed");

                  if (_emailController.text.isNotEmpty &&
                      _sapidController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    print('Button clicked');
                    try {
                      var response = await _registerStudent();

                      var jsonResponse = jsonDecode(response.body);

                      if (jsonResponse['status'] == true) {
                        print("registered successfully");

                        // Show success dialog
                        _showSuccessDialog();
                      } else {
                        print("Something went wrong");
                      }
                    } catch (error) {
                      print("An error occurred: $error");
                    }
                  }
                },
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.lightBlueAccent),
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
          ),
        ],
      ),
    );
  }

  Future<http.Response> _registerStudent() async {
    var regBody = {
      "name": _nameController.text,
      "middlename": _middleNameController.text,
      "surname": _lastNameController.text,
      "department": _branchController.text,
      "email": _emailController.text,
      "yearPassing": 2025, // Assuming this is an int
      "Sapid": _sapidController.text,
      "password": _passwordController.text,
    };

    return await http.post(
      Uri.parse("http://192.168.242.65:3000/student/registration"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody),
    );
  }

  // Function to show a success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: LottieBuilder.network(
            'https://lottie.host/e3418798-02d3-45ca-b741-93a272044228/hCKpIC8lWE.json',
          ),
          actions: [],
        );
      },
    );

    // Delayed navigation after showing the dialog
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPageStudent()),
      );
    });
  }
}
