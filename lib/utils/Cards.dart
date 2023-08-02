import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDescription extends StatefulWidget {
  final String title;
  final Icon icon;
  CardDescription({required this.title, required this.icon});

  @override
  State<CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(221, 221, 254, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.icon,
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Text(
              widget.title,
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
