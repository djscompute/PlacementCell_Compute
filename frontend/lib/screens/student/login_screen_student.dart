import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/screens/optionscreen.dart';
import 'package:placement_cell/screens/student/homescreen.dart';
import 'package:placement_cell/utils/loginformfields.dart';

class LoginPageStudent extends StatefulWidget {
  const LoginPageStudent({super.key});

  @override
  State<LoginPageStudent> createState() => _LoginPageStudentState();
}

class _LoginPageStudentState extends State<LoginPageStudent> {
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _sapidEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(1, 1, 24, 10),
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
                    LoginFormFields('Email', _emailEditingController),

                    // sapid

                    LoginFormFields('SAPID', _sapidEditingController),

                    // apssword
                    LoginFormFields('Password', _passwordEditingController),
                  ],
                )),
          ),

          const loginbtn(),

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
                                builder: (context) => StudentHomeScreen()));
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
}

class loginbtn extends StatelessWidget {
  const loginbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 70,
      left: 40,
      right: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudentHomeScreen()));
          },
          style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Color.fromRGBO(1, 1, 24, 10)),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
            child: Text(
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
    );
  }
}
