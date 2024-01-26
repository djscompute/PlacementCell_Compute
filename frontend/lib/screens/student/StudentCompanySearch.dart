import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:placement_cell/models/company_model.dart';
import 'package:placement_cell/screens/student/StudentApplyInCompany.dart';
import 'package:placement_cell/utils/CardsCompany.dart';

class SearchCompanies extends StatefulWidget {
  final int studentSapid;
  const SearchCompanies({super.key, required this.studentSapid});

  @override
  State<SearchCompanies> createState() => _SearchCompaniesState();
}

class _SearchCompaniesState extends State<SearchCompanies> {
  late Future<List<Company>> listofCompanies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listofCompanies = fetchAllCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(221, 221, 254, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 35,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(1, 1, 24, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            "SN",
                            style: GoogleFonts.montserrat(
                                color: Colors.lightBlueAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 40,
                    child: Text(
                      "Search Company",
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
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
            top: 170,
            left: 20,
            right: 20,
            bottom: 0,
            child: FutureBuilder<List<Company>>(
              future: listofCompanies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While data is loading
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.lightBlueAccent,
                    ),
                  );
                } else if (snapshot.hasError) {
                  // If there is an error
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  // If data is loaded successfully
                  List<Company> companies = snapshot.data ?? [];
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: companies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApplyCompany(
                                        nameCompany:
                                            companies[index].nameCompany,
                                        department: companies[index].department[0],
                                        companyEmail: companies[index].email,
                                        studentSapid: widget.studentSapid,
                                      )));
                        },
                        child: CompanyCard(
                          title: companies[index].nameCompany,
                          description: 'THis is a company',
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Company>> fetchAllCompanies() async {
    var response = await http.get(
      Uri.parse("http://192.168.193.65:3000/company/findallCompanies"),
      headers: {"Content-Type": "application/json"},
    );

    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status'] == true) {
      var companiesData = jsonResponse['companies'] as List<dynamic>;

      List<Company> companiesList = companiesData
          .map((companyJson) => Company.fromJson(companyJson))
          .toList();
      return companiesList;
    } else {
      throw Exception('Failed to load companies');
    }
  }
}
