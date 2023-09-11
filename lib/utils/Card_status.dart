import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStatus extends StatefulWidget {
  final String title;
  final String description;
  bool status;

  CardStatus(
      {super.key, required this.title, required this.description, required this.status});

  @override
  State<CardStatus> createState() => _CardStatusState();
}

class _CardStatusState extends State<CardStatus> {
  @override
  Widget build(BuildContext context) {
    final color = widget.status == true ? Colors.green : Colors.red;
    final icon = widget.status == true ? Icons.check : Icons.close;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 100,
      width: 160,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(221, 221, 254, 1),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
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
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12)),
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
