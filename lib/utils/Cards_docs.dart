import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Docs extends StatefulWidget {
  final String text;
  bool status;
  Docs({required this.text, required this.status});

  @override
  State<Docs> createState() => _DocsState();
}

class _DocsState extends State<Docs> {
  @override
  Widget build(BuildContext context) {
    final color =
        widget.status == true ? Colors.lightGreenAccent : Colors.transparent;
    final icon = widget.status == true ? Icons.check : Icons.add;
    final dashpattern =
        widget.status == true ? [10.0, 0.0, 10.0, 0.0] : [10.0, 8.0, 10.0, 8.0];

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(221, 221, 254, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.text,
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          DottedBorder(
            dashPattern: dashpattern,
            strokeWidth: 2,
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                color: color,
                height: 80,
                width: 300,
                child: Center(
                  child: Icon(
                    icon,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
