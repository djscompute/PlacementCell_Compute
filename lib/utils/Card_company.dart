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
      height: 140,
      width: 160,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(221, 221, 254, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(1, 1, 24, 1),
            ),
            child: Center(
                child: Text(
              widget.title[0] + widget.title[1].toUpperCase(),
              style: GoogleFonts.montserrat(
                  color: Colors.lightBlueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.montserrat(
                    fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Text(
                widget.description,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
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
