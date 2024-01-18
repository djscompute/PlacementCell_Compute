import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/screens/coordinator/CoordinatorHomeScreen.dart';

import '../../utils/loginformfields.dart';
import '../optionscreen.dart';

class CoordinatorLoginScreen extends StatefulWidget {
  const CoordinatorLoginScreen({super.key});

  @override
  State<CoordinatorLoginScreen> createState() => _CoordinatorLoginScreenState();
}

class _CoordinatorLoginScreenState extends State<CoordinatorLoginScreen> {
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
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

          loginbtn(
              email: _emailEditingController.text,
              sapid: _sapidEditingController.text,
              password: _passwordEditingController.text),

          //one line
          // Positioned(
          //     bottom: 40,
          //     left: 40,
          //     right: 40,
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "Don't have an account?",
          //             style: GoogleFonts.montserrat(
          //                 color: const Color.fromRGBO(24, 23, 24, 10)),
          //           ),
          //           GestureDetector(
          //             onTap: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => CreateStudentAccount()));
          //             },
          //             child: Text(" Create one!",
          //                 style: GoogleFonts.montserrat(
          //                   color: Color.fromRGBO(1, 1, 24, 10),
          //                   fontWeight: FontWeight.bold,
          //                 )),
          //           )
          //         ],
          //       ),
          //     ))
        ],
      ),
    );
  }
}

class loginbtn extends StatelessWidget {
  final String email;
  final String sapid;
  final String password;
  loginbtn({required this.email, required this.sapid, required this.password});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 70,
      left: 40,
      right: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ElevatedButton(
          onPressed: () async {
            print("button pressed");
            if (email.isNotEmpty && sapid.isNotEmpty && password.isNotEmpty) {
              print('Button clicked');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoordinatorHomeScreen(),
                ),
              );
              // try {
              //   // var regBody = {
              //   //   "email": email,
              //   //   "Sapid": int.parse(sapid),
              //   //   "password": password,
              //   // };

              //   // var response = await http.post(
              //   //   Uri.parse("http://192.168.193.65:3000/student/login"),
              //   //   headers: {"Content-Type": "application/json"},
              //   //   body: jsonEncode(regBody),
              //   // );

              //   // var jsonResponse = jsonDecode(response.body);

              //   // if (jsonResponse['status'] == true) {
              //   //   var myToken = jsonResponse['token'];
              //   //   print(myToken);

              //   //   Map<String, dynamic> jwtdecodedToken =
              //   //       JwtDecoder.decode(myToken);
              //   //   print(jwtdecodedToken);

              //   //   String name = jwtdecodedToken['name'];
              //   //   String department = jwtdecodedToken['department'];
              //   } else {
              //     print("Something went wrong");
              //   }
              // } catch (error) {
              //   print("An error occurred: $error");
              // }
            }
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
