import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../optionscreen.dart';

class ProfileCoordinator extends StatefulWidget {
  const ProfileCoordinator({super.key});

  @override
  State<ProfileCoordinator> createState() => _ProfileCoordinatorState();
}

class _ProfileCoordinatorState extends State<ProfileCoordinator> {
  String name = '';
  String middlename = '';
  String surname = '';
  String branch = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              height: 225,
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
                    top: 50,
                    left: 20,
                    child: Row(
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 30,
            right: 30,
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(1, 1, 24, 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "PV",
                            style: GoogleFonts.montserrat(
                                color: Colors.lightBlueAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pooja' + " " + 'Vartak',
                            style: GoogleFonts.montserrat(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(1, 1, 24, 10),
                            ),
                          ),
                          Text(
                            branch + " Coordinator",
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: const Color.fromRGBO(1, 1, 24, 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            top: 250,
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                ProfileBoxes(
                    name: "Full Name", value: ('POOJA' + " " + 'VARTAK')),
                ProfileBoxes(name: "SAP ID", value: '60009210083'),
                ProfileBoxes(name: "Branch", value: 'CSEDS'),
              ],
            ),
          ),
          const Positioned(
              bottom: 30, left: 20, right: 20, child: LogoutButton())
        ],
      ),
    );
  }

  // Future<void> fetchStudentetails(int sapid) async {
  //   final url = 'http://192.168.242.65:3000/student/studentDetails';

  //   final Map<String, dynamic> data = {
  //     "studentSapid": sapid,
  //   };

  //   final response = await http.post(
  //     Uri.parse(url),
  //     body: jsonEncode(data),
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> responseBody = jsonDecode(response.body);
  //     if (responseBody['status'] == true) {
  //       setState(() {
  //         name = (responseBody["student"]["name"]);
  //         middlename = (responseBody["student"]["middlename"]);
  //         surname = (responseBody["student"]["surname"]);
  //         branch = (responseBody["student"]["department"]);
  //       });
  //     } else {
  //       print("Error: ${responseBody['message']}");
  //     }
  //   } else {
  //     print('Error: ${response.statusCode}');
  //     print('Body: ${response.body}');
  //   }
  // }
}

class ProfileBoxes extends StatefulWidget {
  final String name;
  final String value;

  const ProfileBoxes({super.key, required this.name, required this.value});

  @override
  State<ProfileBoxes> createState() => _ProfileBoxesState();
}

class _ProfileBoxesState extends State<ProfileBoxes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      height: 90,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(221, 221, 254, 1), // Border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.name.toUpperCase()} :",
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(221, 221, 254, 1),
            ),
          ),
          Text(
            widget.value,
            style: GoogleFonts.montserrat(
              fontSize: 22,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

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
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(
              color: Color.fromRGBO(221, 221, 254, 1), // Border color
              width: 2.0, // Border width
            ), // Add your desired border radius value
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OptionScreen()));
      },
      child: Text(
        "LOG OUT",
        style:
            GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
