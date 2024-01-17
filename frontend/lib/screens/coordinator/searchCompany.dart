import 'package:flutter/material.dart';

class Search_EditCompany extends StatefulWidget {
  const Search_EditCompany({super.key});

  @override
  State<Search_EditCompany> createState() => _Search_EditCompanyState();
}

class _Search_EditCompanyState extends State<Search_EditCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            "This is hte screen where the coordinator can search for the different companies"),
      ),
    );
  }
}
