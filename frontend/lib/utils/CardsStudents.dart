import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentsCard extends StatefulWidget {
  final String name;
  final String surname;
  final String branch;
  final String email;
  StudentsCard(
      {required this.name,
      required this.branch,
      required this.surname,
      required this.email});

  @override
  State<StudentsCard> createState() => _StudentsCardState();
}

class _StudentsCardState extends State<StudentsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      height: 100,
      width: 160,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(221, 221, 254, 1),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(1, 1, 24, 1),
            ),
            child: Center(
                child: Text(
              widget.branch,
              style: GoogleFonts.montserrat(
                  color: Colors.lightBlueAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name.toUpperCase() + " " + widget.surname.toUpperCase(),
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                widget.email,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: const Color.fromRGBO(1, 1, 24, 10),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
