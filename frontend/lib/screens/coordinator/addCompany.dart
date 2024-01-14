import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/utils/CompanyTextFields.dart';
import 'package:placement_cell/utils/branch.dart';
import 'package:placement_cell/utils/loginformfields.dart';
import 'package:http/http.dart' as http;

class AddCompany extends StatefulWidget {
  const AddCompany({super.key});

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  TextEditingController _companyname = new TextEditingController();
  TextEditingController _companyEmail = new TextEditingController();
  TextEditingController _companyDescription = new TextEditingController();
  String selectedBranch = '';

  @override
  Widget build(BuildContext context) {
    List<String> branches = [
      'CSE',
      'IT',
      'CSE(DS)',
      'AIML',
      "AIDS",
      "CSE(ICB)",
      'EXTC',
      'MECH'
    ];
    List<String> selectedBranches = [];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 1, 24, 1),
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
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(1, 1, 24, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            "SN",
                            style: GoogleFonts.montserrat(
                                color: Colors.lightBlueAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 40,
                    child: Text(
                      "Search Company",
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
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CompanyTextFields(
                  text: 'Company Name',
                  controller: _companyname,
                ),
                CompanyTextFields(
                  text: 'Company Email',
                  controller: _companyEmail,
                ),
                CompanyTextFields(
                  text: 'Company Role',
                  controller: _companyDescription,
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 5.0,
                  runSpacing: 8.0,
                  children: branches.map((branch) {
                    return GestureDetector(
                      onTap: () {
                        selectedBranches.add(branch);
                        print(selectedBranches);
                      },
                      child: BranchCard(
                        branch: branch,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Center(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(221, 221, 254, 1)),
                  elevation: MaterialStateProperty.all(10.0),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Add your desired border radius value
                    ),
                  ),
                ),
                onPressed: () {
                  addCompany(_companyEmail.text, _companyname.text,
                      selectedBranches[0]);
                },
                child: Text(
                  'Add Company',
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void addCompany(email, name, department) async {
    const url = 'http://192.168.193.65:3000/company/registration';

    Map<String, dynamic> data = {
      "email": email,
      "name": name,
      "department": department,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      print("Company added");
      print(jsonDecode(response.body));
    } else {
      print("Failed to create company");
      print(response.body);
    }
  }
}
