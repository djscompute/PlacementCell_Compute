import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(1, 1, 24, 10),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(221, 221, 254, 100),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  right: 40,
                  left: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hi, ",
                            style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(1, 1, 24, 10),
                            ),
                          ),
                          Text(
                            "Shivam",
                            style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(1, 1, 24, 10),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Second year CSE(DS) student",
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Color.fromRGBO(1, 1, 24, 10),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "What you would like to search?",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Color.fromRGBO(221, 221, 254, 100),
      ),
    );
  }
}
