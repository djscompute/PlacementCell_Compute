import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyTextFields extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  const CompanyTextFields(
      {super.key, required this.text, required this.controller});

  @override
  State<CompanyTextFields> createState() => _CompanyTextFieldsState();
}

class _CompanyTextFieldsState extends State<CompanyTextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
      child: TextField(
        controller: widget.controller,
        style: GoogleFonts.montserrat(color: Colors.lightBlueAccent),
        decoration: InputDecoration(
          labelText: widget.text,
          labelStyle: GoogleFonts.montserrat(color: Colors.lightBlueAccent),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.lightBlueAccent, // Border color when not selected
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.lightBlueAccent, // Border color when not selected
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
