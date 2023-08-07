import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/screens/optionscreen.dart';
import 'package:placement_cell/screens/student/HomeScreen.dart';

class Mybutton extends StatefulWidget {
  String option;
  int number;

  Mybutton({required this.option, required this.number});

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  final screens = [const HomeScreen(), const OptionScreen()];

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(1, 1, 24, 10)),
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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => screens[widget.number]));
      },
      child: Text(
        widget.option,
        style:
            GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
