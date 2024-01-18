import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/models/student.dart';
import 'package:placement_cell/screens/coordinator/CoordinatorGetStudentDetails.dart';
import 'package:http/http.dart' as http;
import 'package:placement_cell/utils/CardsStudents.dart';

class SearchStudents extends StatefulWidget {
  const SearchStudents({super.key});

  @override
  State<SearchStudents> createState() => _SearchStudentsState();
}

class _SearchStudentsState extends State<SearchStudents> {
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
                      "Search Students",
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
            top: 180,
            left: 0,
            right: 0,
            bottom: 0,
            child: FutureBuilder<List<User>>(
              future: getAllstudents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While data is loading
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.lightBlueAccent,
                    ),
                  );
                } else if (snapshot.hasError) {
                  // If there is an error
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  // If data is loaded successfully
                  List<User> students = snapshot.data ?? [];
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While data is loading
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.lightBlueAccent,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        // If there is an error
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StudentsDetails(
                                            name: (students[index].name +
                                                " " +
                                                students[index].middleName +
                                                " " +
                                                students[index].surname),
                                            middlename:
                                                students[index].middleName,
                                            surname: students[index].surname,
                                            branch: students[index].department,
                                            Sapid: students[index].sapid,
                                            email: students[index].email,
                                            yearPassing:
                                                students[index].yearPassing,
                                          )));
                            },
                            child: StudentsCard(
                              name: students[index].name,
                              branch: students[index].department,
                              surname: students[index].surname,
                              email: students[index].email,
                            ));
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<User>> getAllstudents() async {
    var response = await http.get(
      Uri.parse("http://192.168.193.65:3000/student/allstudents"),
      headers: {"Content-Type": "application/json"},
    );
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status'] == true) {
      var studentsData = jsonResponse['students'] as List<dynamic>;

      List<User> studentsList = studentsData
          .map((companyJson) => User.fromJson(companyJson))
          .toList();
      print(studentsList);
      return studentsList;
    } else {
      throw Exception('Failed to load companies');
    }
  }
}
