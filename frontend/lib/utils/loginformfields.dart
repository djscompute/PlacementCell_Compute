import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFormFields extends StatefulWidget {
  final String text;
  final TextEditingController _controller;
  const LoginFormFields(this.text, this._controller);
  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextField(
        
        controller: widget._controller,
        style: GoogleFonts.montserrat(color: Color.fromRGBO(1, 1, 24, 10)),
        decoration: InputDecoration(
          labelText: widget.text,
          labelStyle:
              GoogleFonts.montserrat(color: Color.fromRGBO(1, 1, 24, 10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(
                    1, 1, 24, 10), // Border color when not selected
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(
                    1, 1, 24, 10), // Border color when not selected
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
