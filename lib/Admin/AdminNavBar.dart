import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:place_vitaapp/Admin/AdminHackathonForm.dart';
import 'package:place_vitaapp/Admin/AdminHomeScreen.dart';
import 'package:place_vitaapp/Admin/AdminInternshipData.dart';
import 'package:place_vitaapp/Admin/Admincompanyscreen.dart';
import 'package:place_vitaapp/Admin/adminSignup.dart';
import 'package:place_vitaapp/Admin/adminprofile.dart';
class AdminNavBar extends StatefulWidget {
  const AdminNavBar({super.key});

  @override
  State createState() {
    return _AdminNavBarState();
  }
}

class _AdminNavBarState extends State<AdminNavBar> {
  List selectedScreenIndexList = [
    const AdminHomeScreen(),
    const AdminProfileScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedScreenIndexList[selectedIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        barColor: Colors.white,
        controller: FloatingBottomBarController(initialIndex: 0),
        bottomBar: [
          BottomBarItem(
            icon: const Icon(Icons.home),
            iconSelected: const Icon(
              Icons.home,
              color:  Color.fromARGB(255, 52, 137, 234),
            ),
            title: "Home",
            dotColor:  Color.fromARGB(255, 52, 137, 234),
            onTap: (value) {
              selectedIndex = 0;

              setState(() {});
            },
          ),
          BottomBarItem(
            icon: const Icon(Icons.person),
            iconSelected: const Icon(
              Icons.person,
              color:  Color.fromARGB(255, 52, 137, 234),
            ),
            title: "Profile",
            dotColor:  Color.fromARGB(255, 52, 137, 234),
            onTap: (value) {
              selectedIndex = 1;
              setState(() {});
            },
          ),
        ],
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor:  Color.fromARGB(255, 52, 137, 234),
          centerIcon: const FloatingCenterButton(
            child: SizedBox(
              height: 70,
              width: 70,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size:
                    28, // Slightly smaller icon size to give more room for text
              ),
            ),
          ),
          centerIconChild: [
            FloatingCenterButtonChild(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.code_outlined,
                    color: Colors.black,
                    size: 22, // Reduced icon size further
                  ),
                  SizedBox(height: 2), // Reduced space between icon and text
                  FittedBox(
                    // Ensure text fits in the available space
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Hackathon',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 9, // Reduced font size to fit properly
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminHackathonForm()));
                setState(() {});
              },
            ),
            FloatingCenterButtonChild(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_city,
                    color: Colors.black,
                    size: 22, // Reduced icon size further
                  ),
                  SizedBox(height: 2), // Reduced space between icon and text
                  FittedBox(
                    // Ensure text fits in the available space
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Company',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 9, // Reduced font size to fit properly
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Admincompanyscreen()));
                setState(() {});
              },
            ),
            FloatingCenterButtonChild(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assignment,
                    color: Colors.black,
                    size: 22, // Reduced icon size further
                  ),
                  SizedBox(height: 2), // Reduced space between icon and text
                  FittedBox(
                    // Ensure text fits in the available space
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Internship',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 9, // Reduced font size to fit properly
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminInternshipData()));
                setState(() {});
              },
            ),
          ],
        ),
     ),
);
}
}
