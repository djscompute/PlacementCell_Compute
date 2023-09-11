import 'package:flutter/material.dart';

class AppliedCompanies extends StatefulWidget {
  const AppliedCompanies({super.key});

  @override
  State<AppliedCompanies> createState() => _AppliedCompaniesState();
}

class _AppliedCompaniesState extends State<AppliedCompanies> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Check your applied companies here"),
      ),
    );
  }
}
