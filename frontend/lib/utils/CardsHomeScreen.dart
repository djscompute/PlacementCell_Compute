import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/screens/student/StudentProfile.dart';
import 'package:placement_cell/screens/student/StudentCompanySearch.dart';
import 'package:placement_cell/screens/student/StudentAppliedCompany.dart';
import 'package:placement_cell/screens/student/testinguploadddocs.dart';

class CardDescription extends StatefulWidget {
  final String title;
  final Icon icon;
  final int index;
  final int studentSapid;

  CardDescription({
    super.key,
    required this.title,
    required this.icon,
    required this.index,
    required this.studentSapid,
  });

  @override
  State<CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {
  @override
  Widget build(BuildContext context) {
    final screens = [
      PdfUploadScreen(),
      SearchCompanies(studentSapid: widget.studentSapid),
       AppliedCompanies( Sapid: widget.studentSapid),
      ProfileStudent(sapid: widget.studentSapid,)
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screens[widget.index]),
        );
      },
      child: Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(221, 221, 254, 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
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
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
