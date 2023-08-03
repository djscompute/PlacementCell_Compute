import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/screens/student/Profile.dart';
import 'package:placement_cell/screens/student/Search.dart';
import 'package:placement_cell/screens/student/Status.dart';
import 'package:placement_cell/screens/student/UploadDocs.dart';

class CardDescription extends StatefulWidget {
  final String title;
  final Icon icon;
  final int index;
  CardDescription(
      {required this.title, required this.icon, required this.index});

  @override
  State<CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {
  final screens = [UploadDocs(), SearchCompanies(), Status(), ProfileStudent()];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => screens[widget.index]));
      },
      child: Container(
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
      ),
    );
  }
}
