import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/utils/Card_company.dart';

class SearchCompanies extends StatefulWidget {
  const SearchCompanies({super.key});

  @override
  State<SearchCompanies> createState() => _SearchCompaniesState();
}

class _SearchCompaniesState extends State<SearchCompanies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 1, 24, 1),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(221, 221, 254, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 35,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 20,
                    child: Text(
                      "Search Company",
                      style: GoogleFonts.montserrat(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(1, 1, 24, 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 210,
            left: 20,
            right: 20,
            bottom: 0,
            child: ListView(
              padding: EdgeInsets.all(0),
              children: const [
                CompanyCard(
                    title: "JP MORGAN",
                    description: "This is a test example 1"),
                CompanyCard(
                    title: "Dolat Capital",
                    description: "This is a test example 2"),
                CompanyCard(
                    title: "Morgan Stanley",
                    description: "This is a test example 3"),
                CompanyCard(
                    title: "Adobe", description: "This is a test example 4"),
                CompanyCard(
                    title: "Oracle", description: "This is a test example 5"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
