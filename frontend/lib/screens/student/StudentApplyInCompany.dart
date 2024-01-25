import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class ApplyCompany extends StatefulWidget {
  final String nameCompany;
  final String department;
  final String companyEmail;
  final int studentSapid;

  ApplyCompany({
    required this.nameCompany,
    required this.department,
    required this.companyEmail,
    required this.studentSapid,
  });

  @override
  State<ApplyCompany> createState() => _ApplyCompanyState();
}

class _ApplyCompanyState extends State<ApplyCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                addStudentToCompany();
              },
              child: Container(
                height: 75,
                width: 75,
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
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 30,
                    color: Color.fromRGBO(1, 1, 24, 1),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 75,
            left: 20,
            right: 40,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 100,
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
                    child: Center(
                      child: Text(
                        widget.nameCompany[0] +
                            widget.nameCompany[1].toUpperCase(),
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.companyEmail,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // api function starts here
  Future<void> addStudentToCompany() async {
    final url = 'http://192.168.193.65:3000/company/applyCompany';

    final Map<String, dynamic> data = {
      "companyEmail": widget.companyEmail,
      "studentSapid": widget.studentSapid,
    };

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        _showSuccessDialog();
      } else {
        print("Error: ${responseBody['message']}");
      }
    } else {
      print('Error: ${response.statusCode}');
      print('Body: ${response.body}');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: LottieBuilder.network(
            'https://lottie.host/e3418798-02d3-45ca-b741-93a272044228/hCKpIC8lWE.json',
          ),
          actions: [],
        );
      },
    );

    // Delayed navigation after showing the dialog
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(
        context,
      );
    });
  }
}
