import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/screens/optionscreen.dart';
import 'package:placement_cell/screens/student/StudentCreateAccount.dart';
import 'package:placement_cell/screens/student/StudentHomeScreen.dart';
import 'package:placement_cell/utils/loginformfields.dart';

class LoginPageStudent extends StatefulWidget {
  const LoginPageStudent({super.key});

  @override
  State<LoginPageStudent> createState() => _LoginPageStudentState();
}

class _LoginPageStudentState extends State<LoginPageStudent> {
  bool isLoading = false;

  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _sapidEditingController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordEditingController.dispose();
    _emailEditingController.dispose();
    _sapidEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            top: 120,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back.",
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Login to get Started!",
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // login forms
          Positioned(
            top: 225,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(221, 221, 254, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 30, 10, 30),
                      child: Text(
                        "Login",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    NewFormFields('Email', _emailEditingController),

                    // sapid

                    NewFormFields('SAPID', _sapidEditingController),

                    // apssword
                    NewFormFields('Password', _passwordEditingController),
                  ],
                )),
          ),

          Positioned(
            bottom: 70,
            left: 40,
            right: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ElevatedButton(
                onPressed: isLoading ? null : () => _handleLogin(),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromRGBO(1, 1, 24, 10)),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                  child: isLoading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.lightBlueAccent),
                        )
                      : Text(
                          "Login!",
                          style: GoogleFonts.montserrat(
                            color: Colors.lightBlueAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ),

          //one line
          Positioned(
              bottom: 40,
              left: 40,
              right: 40,
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(24, 23, 24, 10)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateStudentAccount()));
                      },
                      child: Text(" Create one!",
                          style: GoogleFonts.montserrat(
                            color: Color.fromRGBO(1, 1, 24, 10),
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void _handleLogin() async {
    setState(() {
      isLoading = true;
    });

    try {
      var email = _emailEditingController.text;
      var sapid = _sapidEditingController.text;
      var password = _passwordEditingController.text;

      // Check if email, sapid, and password are not empty
      if (email.isEmpty || sapid.isEmpty || password.isEmpty) {
        print("Please fill in all the fields");
        return;
      }

      // Check if sapid is a valid numeric string
      if (!sapid.trim().contains(RegExp(r'^\d+$'))) {
        print("Invalid SAPID: '$sapid'");
        // Handle the error, maybe show a message to the user
        return;
      }

      var regBody = {
        "email": email,
        "Sapid": int.parse(sapid),
        "password": password,
      };

      var response = await http.post(
        Uri.parse("http://192.168.193.65:3000/student/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse != null && jsonResponse['status'] == true) {
        // Extract student details directly from the response
        var studentDetails = jsonResponse['student'];

        if (studentDetails != null) {
          String name = studentDetails['name'];
          String department = studentDetails['department'];

          int sapid = int.parse(_sapidEditingController.text);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentHomeScreen(
                sapid: sapid,
                name: name,
                department: department,
              ),
            ),
          );
        } else {
          print("Student details not found in the response");
        }
      } else {
        print("Login failed: ${jsonResponse['message']}");
      }
    } catch (error) {
      print("An error occurred: $error");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
