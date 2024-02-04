import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/screens/coordinator/CoordinatorSelectedStudents.dart';
import 'package:placement_cell/screens/coordinator/CoordinatorStudentsApplied.dart';

class EditCompany extends StatefulWidget {
  final String companyEmail;
  final String nameCompany;
  final List<String> department;
  final List<int> studentsApplied;
  final List<int> studentsSelected;
  EditCompany(
      {required this.companyEmail,
      required this.nameCompany,
      required this.department,
      required this.studentsApplied,
      required this.studentsSelected});

  @override
  State<EditCompany> createState() => _EditCompanyState();
}

class _EditCompanyState extends State<EditCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(221, 221, 254, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 90,
                      left: 40,
                      child: Text(
                        "Edit Company",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(1, 1, 24, 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 170,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlueAccent, width: 2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  widget.nameCompany,
                  style: GoogleFonts.montserrat(
                      color: Colors.lightBlueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Positioned(
              top: 240,
              left: 20,
              right: 20,
              bottom: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade800.withOpacity(0.4),
                      ),
                      child: Center(
                          child: Text(
                        "here description about the company",
                        style: GoogleFonts.montserrat(
                            color: Colors.lightBlueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 8.0,
                    children: widget.department.map((branch) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                          ),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          branch,
                          style: GoogleFonts.montserrat(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            // branches allowed

            Positioned(
                bottom: 130,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompanyStudentsAppliedIn(
                                      companyEmail: widget.companyEmail,
                                      studentsApplied: widget.studentsApplied,
                                    )));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Check Students Applied",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectedStudents(
                                      studentsApplied: widget.studentsApplied,
                                    )));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Edit Students Selected",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
