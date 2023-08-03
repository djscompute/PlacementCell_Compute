import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/screens/student/homescreen.dart';
import 'package:placement_cell/utils/Buttons.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 1, 24, 10),
      body: Container(
        child: Stack(children: [
          Positioned(
              top: screenHeight * 0.3,
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
              child: Container(
                height: screenHeight * 0.45,
                width: screenWidth * 0.7,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(221, 221, 254, 100),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      width: 1, color: const Color.fromRGBO(1, 1, 24, 10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Login as :",
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(1, 1, 24, 10),
                      ),
                    ),
                    Mybutton(
                      option: "Student",
                      number: 1,
                    ),
                    Mybutton(
                      option: "Cordinator",
                      number: 1,
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}

