import 'package:flutter/material.dart';
import 'package:placement_cell/screens/optionscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.lightBlue.shade200)),
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OptionScreen()));
              });
            },
            child: Text("Go to option screen")),
      ),
    );
  }
}
