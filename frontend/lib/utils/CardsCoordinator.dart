import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/screens/coordinator/CoordinatorProfile.dart';
import 'package:placement_cell/screens/coordinator/myStudents.dart';
import 'package:placement_cell/screens/student/Search.dart';

import '../screens/coordinator/addCompany.dart';

class CoordinatorCards extends StatefulWidget {
  final String title;
  final Icon icon;
  final int index;
  final int studentSapid;

  CoordinatorCards({
    super.key,
    required this.title,
    required this.icon,
    required this.index,
    required this.studentSapid,
  });

  @override
  State<CoordinatorCards> createState() => _CoordinatorCardsState();
}

class _CoordinatorCardsState extends State<CoordinatorCards> {
  @override
  Widget build(BuildContext context) {
    final screens = [
      const AddCompany(),
      const SearchCompanies(studentSapid: 0),
      const SearchStudents(),
      const ProfileCoordinator()
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
