import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/utils/Cards_docs.dart';

class UploadDocs extends StatelessWidget {
  const UploadDocs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 1, 24, 1),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(221, 221, 254, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
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
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "SN",
                              style: GoogleFonts.montserrat(
                                color: const Color.fromRGBO(1, 1, 24, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 20,
                    child: Text(
                      "Upload Docs",
                      style: GoogleFonts.montserrat(
                        fontSize: 35,
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
            top: 210,
            left: 20,
            right: 20,
            bottom: 0,
            child: ListView(
              children: [
                Docs(
                  text: "Resume",
                  status: true,
                ),
                Docs(
                  text: "Internship Letter",
                  status: false,
                ),
                Docs(
                  text: "Marksheet Sem 1",
                  status: true,
                ),
                Docs(
                  text: "Marksheet Sem 2",
                  status: false,
                ),
                Docs(
                  text: "Marksheet Sem 3",
                  status: true,
                ),
                Docs(
                  text: "Marksheet Sem 4",
                  status: false,
                ),
                Docs(
                  text: "Marksheet Sem 5",
                  status: true,
                ),
                Docs(
                  text: "Marksheet Sem 6",
                  status: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
