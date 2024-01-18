import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyCard extends StatefulWidget {
  final String title;
  final String description;
  const CompanyCard(
      {super.key, required this.title, required this.description});

  @override
  State<CompanyCard> createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 100,
      width: 160,
      decoration: BoxDecoration(
          color: Color.fromRGBO(221, 221, 254, 1),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(1, 1, 24, 1),
            ),
            child: Center(
                child: Text(
              widget.title[0].toUpperCase() + widget.title[1].toUpperCase(),
              style: GoogleFonts.montserrat(
                  color: Colors.lightBlueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title.toUpperCase(),
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                widget.description,
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
