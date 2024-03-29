import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:placement_cell/screens/splashscreen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Placement',
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
