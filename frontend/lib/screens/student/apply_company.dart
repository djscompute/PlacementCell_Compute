import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplyCompany extends StatefulWidget {
  final String nameCompany;
  final String department;
  final String companyEmail;
  ApplyCompany(
      {required this.nameCompany,
      required this.department,
      required this.companyEmail});

  @override
  State<ApplyCompany> createState() => _ApplyCompanyState();
}

class _ApplyCompanyState extends State<ApplyCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 1, 24, 1),
      body: Stack(children: [
        // manual user defined function

        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(221, 221, 254, 1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
                child: Icon(
              Icons.check,
              size: 30,
              color: Color.fromRGBO(1, 1, 24, 1),
            )),
          ),
        ),

        Positioned(
          top: 75,
          left: 20,
          right: 40,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(221, 221, 254, 1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    widget.nameCompany[0] + widget.nameCompany[1].toUpperCase(),
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ),
                Text(
                  widget.nameCompany,
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
