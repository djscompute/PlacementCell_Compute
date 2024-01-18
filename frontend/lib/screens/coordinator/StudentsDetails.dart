import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentsDetails extends StatefulWidget {
  final String name;
  final String middlename;
  final String surname;
  final String branch;
  final String email;
  final int Sapid;
  final int yearPassing;

  const StudentsDetails({
    Key? key,
    required this.name,
    required this.middlename,
    required this.surname,
    required this.branch,
    required this.Sapid,
    required this.email, required this.yearPassing,
  }) : super(key: key);

  @override
  State<StudentsDetails> createState() => _StudentsDetailsState();
}

class _StudentsDetailsState extends State<StudentsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromRGBO(221, 221, 254, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 35,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(1, 1, 24, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "SN",
                              style: GoogleFonts.montserrat(
                                color: Colors.lightBlueAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 40,
                    child: Text(
                      "Student Details",
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(1, 1, 24, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 160, 10, 0),
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                ProfileBoxes(name: "Full Name", value: widget.name),
                ProfileBoxes(name: "SAP ID", value: widget.Sapid.toString()),
                ProfileBoxes(name: "Branch", value: widget.branch),
                ProfileBoxes(name: "Email", value: widget.email),
                ProfileBoxes(name: "CGPA", value: "8.8"),
                ProfileBoxes(name: "Year of Passing", value: widget.yearPassing.toString()),
                ProfileBoxes(name: "Placed", value: "Not Yet"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileBoxes extends StatefulWidget {
  final String name;
  final String value;

  const ProfileBoxes({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  State<ProfileBoxes> createState() => _ProfileBoxesState();
}

class _ProfileBoxesState extends State<ProfileBoxes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lightBlueAccent,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.name.toUpperCase()} :",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
            ),
          ),
          Text(
            widget.value,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
