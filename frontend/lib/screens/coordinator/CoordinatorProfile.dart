import 'package:flutter/material.dart';

class ProfileCoordinator extends StatefulWidget {
  const ProfileCoordinator({super.key});

  @override
  State<ProfileCoordinator> createState() => _ProfileCoordinatorState();
}

class _ProfileCoordinatorState extends State<ProfileCoordinator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("THis is the profile screen for the coordinator"),
    );
  }
}
