import 'package:flutter/material.dart';

class EditCompany extends StatefulWidget {
  const EditCompany({super.key});

  @override
  State<EditCompany> createState() => _EditCompanyState();
}

class _EditCompanyState extends State<EditCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
          "this is the screen where the coordinator can edit the company which is existed int he server"),
    );
  }
}
