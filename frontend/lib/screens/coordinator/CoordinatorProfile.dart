import 'package:flutter/material.dart';

class CoordinatorProfile extends StatefulWidget {
  const CoordinatorProfile({super.key});

  @override
  State<CoordinatorProfile> createState() => _CoordinatorProfileState();
}

class _CoordinatorProfileState extends State<CoordinatorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("THis is the profile screen for the coordinator"),
    );
  }
}
