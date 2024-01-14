import 'package:flutter/material.dart';

class SearchStudents extends StatefulWidget {
  const SearchStudents({super.key});

  @override
  State<SearchStudents> createState() => _SearchStudentsState();
}

class _SearchStudentsState extends State<SearchStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is the place where the cooridnator will be able to search for his students"),
      ),
    );
  }
}