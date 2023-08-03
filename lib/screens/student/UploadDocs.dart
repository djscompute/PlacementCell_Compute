import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadDocs extends StatefulWidget {
  const UploadDocs({super.key});

  @override
  State<UploadDocs> createState() => _UploadDocsState();
}

class _UploadDocsState extends State<UploadDocs> {
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 35,
                          ),
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
                          ))
                    ],
                  ),
                ))
          ],
        ));
  }
}
