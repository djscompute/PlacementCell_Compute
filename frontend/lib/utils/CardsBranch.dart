import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BranchCard extends StatefulWidget {
  final String branch;
  bool isSelected;
  BranchCard({required this.branch, required this.isSelected});

  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        widget.isSelected ? Colors.lightBlueAccent : Colors.black;
    Color textColor = widget.isSelected ? Colors.black : Colors.lightBlueAccent;

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
