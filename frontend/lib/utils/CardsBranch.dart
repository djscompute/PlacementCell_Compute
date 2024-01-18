import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BranchCard extends StatefulWidget {
  final String branch;
  final bool isSelected;
  const BranchCard({
    required this.branch,
    required this.isSelected,
  });

  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        widget.isSelected ? Colors.black : Colors.lightBlueAccent;
    Color textColor = widget.isSelected ? Colors.lightBlueAccent : Colors.black;

    return GestureDetector(
      child: Container(
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
      ),
    );
  }
}
