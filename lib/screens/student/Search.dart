import 'package:flutter/material.dart';

class SearchCompanies extends StatefulWidget {
  const SearchCompanies({super.key});

  @override
  State<SearchCompanies> createState() => _SearchCompaniesState();
}

class _SearchCompaniesState extends State<SearchCompanies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Search for companies here"),
      ),
    );
  }
}
