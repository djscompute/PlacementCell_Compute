import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/utils/Buttons.dart';
import 'package:placement_cell/utils/Cards_HomeScreen.dart';

class CoordinatorHomeScreen extends StatefulWidget {
  const CoordinatorHomeScreen({super.key});

  @override
  State<CoordinatorHomeScreen> createState() => _CoordinatorHomeScreenState();
}

class _CoordinatorHomeScreenState extends State<CoordinatorHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(1, 1, 24, 1),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 350,
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
                              color: Color.fromRGBO(1, 1, 24, 1),
                              size: 40,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hello, ",
                                style: GoogleFonts.montserrat(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromRGBO(1, 1, 24, 10),
                                ),
                              ),
                              Text(
                                "Elon",
                                style: GoogleFonts.montserrat(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromRGBO(1, 1, 24, 10),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Placement coordinator of CSE(DS)",
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: const Color.fromRGBO(1, 1, 24, 10),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "What would you like to see?",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      top: 240,
                      left: 40,
                      child: Row(
                        children: [
                          SearchIcon(
                              icon: Icon(
                                Icons.timer_outlined,
                                size: 40,
                                color: Color.fromRGBO(1, 1, 24, 1),
                              ),
                              searchoption: "Status"),
                          SizedBox(
                            width: 30,
                          ),
                          SearchIcon(
                              icon: Icon(
                                Icons.design_services_outlined,
                                size: 40,
                                color: Color.fromRGBO(1, 1, 24, 1),
                              ),
                              searchoption: "My Companies"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
           Positioned(
            top: 400,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // upload documents
                    CardDescription(
                      icon: Icon(
                        Icons.add,
                        size: 50,
                        color: Color.fromRGBO(1, 1, 24, 10),
                      ),
                      title: '      Add \nCompanies',
                      index: 0,
                    ),
                    // apply for companies
                    CardDescription(
                      icon: Icon(
                        Icons.search,
                        size: 50,
                        color: Color.fromRGBO(1, 1, 24, 10),
                      ),
                      title: "    Search\nCompanies",
                      index: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // applied or not
                    CardDescription(
                      title: "My Students",
                      icon: Icon(
                        Icons.school,
                        size: 50,
                        color: Color.fromRGBO(1, 1, 24, 10),
                      ),
                      index: 2,
                    ),

                    // profile
                    CardDescription(
                      title: "Profile",
                      icon: Icon(
                        Icons.person_2_outlined,
                        size: 50,
                        color: Color.fromRGBO(1, 1, 24, 1),
                      ),
                      index: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "POWERED BY DJS COMPUTE",
                style: GoogleFonts.montserrat(
                    color: Colors.lightBlueAccent, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Color.fromRGBO(221, 221, 254, 1),
        child: HomeDrawer(),
      ),
    );
  }
}

class SearchIcon extends StatefulWidget {
  final Icon icon;
  final String searchoption;
  const SearchIcon({super.key, required this.icon, required this.searchoption});

  @override
  State<SearchIcon> createState() => _SearchIconState();
}

class _SearchIconState extends State<SearchIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: widget.icon),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.searchoption,
          style:
          GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
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
                        "EM",
                        style: GoogleFonts.montserrat(
                            color: Colors.lightBlueAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Elon",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(1, 1, 24, 10),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 220,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Feedback",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                const Icon(
                  Icons.feedback_outlined,
                  size: 30,
                ),
              ],
            )),
        Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(child: Mybutton(option: "Logout", number: 1)))
      ],
    );
  }
}
