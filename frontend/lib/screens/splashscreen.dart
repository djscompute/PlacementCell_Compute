import 'package:flutter/material.dart';
import 'package:placement_cell/screens/optionscreen.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    navigateToHome();
    super.initState();
  }
  void navigateToHome() async{
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const OptionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 1, 24, 10),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 200, width: 200, color: Colors.lightBlue,
            child: Image.asset('images/logo.jpg'),),
          ],
        ),
      ),
    );
  }
}

//#010218