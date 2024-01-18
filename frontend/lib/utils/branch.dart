import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BranchCard extends StatefulWidget {
  final String branch;

  const BranchCard({Key? key, required this.branch}) : super(key: key);

  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
  Color backgroundColor = Colors.black;
  Color textColor = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lightBlueAccent,
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        widget.branch,
        style: GoogleFonts.montserrat(color: textColor),
      ),
    );
  }
}