import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../models/student.dart';
import '../../utils/CardsStudents.dart';
import 'CoordinatorGetStudentDetails.dart';

class SelectedStudents extends StatefulWidget {
  final List<int> studentsApplied;
  SelectedStudents({required this.studentsApplied});

  @override
  State<SelectedStudents> createState() => _SelectedStudentsState();
}

class _SelectedStudentsState extends State<SelectedStudents> {
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
                      "Applied Students",
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
              future: getAllstudents(widget.studentsApplied),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.lightBlueAccent,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  List<User> students = snapshot.data ?? [];
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                        return StudentsCard(
                          name: students[index].name,
                          branch: students[index].department,
                          surname: students[index].surname,
                          email: students[index].email,
                        );
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

  Future<List<User>> getAllstudents(List<int> appliedStudents) async {
    print(appliedStudents);
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

      studentsList.forEach((element) {
        print(element.sapid);
      });

      studentsList.retainWhere((student) {
        bool shouldRetain = appliedStudents.contains(student.sapid);
        if (!shouldRetain) {
          print("Removing student: $student");
        }
        return shouldRetain;
      });

      print(studentsList);
      return studentsList;
    } else {
      throw Exception('Failed to load companies');
    }
  }
}
