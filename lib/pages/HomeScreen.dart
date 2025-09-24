import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:place_vitaapp/pages/HackathonDetails.dart';
import 'package:place_vitaapp/pages/HackathonScreen.dart';
import 'package:place_vitaapp/pages/InternshipListScreen.dart';
import 'package:place_vitaapp/pages/JobsScreenMain.dart';
import 'package:place_vitaapp/pages/Practicescreenh.dart';
import 'package:place_vitaapp/pages/ProfileScreen.dart';
import 'package:place_vitaapp/pages/ResumeTemplateScreen.dart';
import 'package:place_vitaapp/pages/forum.dart';
import 'package:place_vitaapp/pages/homeScreengetter.dart';
import 'package:place_vitaapp/pages/internshipgetter.dart';
import 'package:place_vitaapp/pages/resumedata.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List companyList = [];
  void companyListGetter() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('Companies').get();

    companyList.clear();

    for (int i = 0; i < response.docs.length; i++) {
      DocumentSnapshot docSnap = response.docs[i];
      Map<String, dynamic> map = {};
      map["Name"] = docSnap["Name"];
      map["Location"] = docSnap["Location"];
      map["CostOfCompany"] = docSnap["CostOfCompany"];
      map["Stipend"] = docSnap["Stipend"];
      map["Description"] = docSnap["Description"];
      map["EligibleCourse"] = docSnap["EligibleCourse"];
      map["ECriteria"] = docSnap["ECriteria"];
      map["RSchedule"] = docSnap["RSchedule"];
      map["Organisation"] = docSnap["Organisation"];
      map["url"] = docSnap["url"];

      companyList.add(map);
    }
    print(companyList);
  }

  List InternshipList = [];

  void InternshipListGetter() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('Internships').get();

    InternshipList.clear();

    for (int i = 0; i < response.docs.length; i++) {
      DocumentSnapshot docSnap = response.docs[i];
      Map<String, dynamic> map = {};
      map["Location"] = docSnap["Location"];
      map["ApplicationDeadline"] = docSnap["Location"];
      map["Company"] = docSnap["Company"];
      map["Duration"] = docSnap["Duration"];
      map["Description"] = docSnap["Description"];
      map["Eligibility"] = docSnap["Eligibility"];
      map["Perks"] = docSnap["Perks"];
      map["SkillsRequired"] = docSnap["SkillsRequired"];
      map["WorkArea"] = docSnap["WorkArea"];
      map["Stipend"] = docSnap["Stipend"];
      map["url"] = docSnap["url"];
      InternshipList.add(map);
    }
  }

  List HackathonList = [];
  void HackathonListGetter() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('Hakathone').get();

    HackathonList.clear();

    for (int i = 0; i < response.docs.length; i++) {
      DocumentSnapshot docSnap = response.docs[i];
      Map<String, dynamic> map = {};
      map["Name"] = docSnap["Name"];
      map["Location"] = docSnap["Location"];
      map["Organizer"] = docSnap["Organizer"];
      map["Prizes"] = docSnap["Prizes"];
      map["Description"] = docSnap["Description"];
      map["Theme"] = docSnap["Theme"];
      map["ApplicationDeadline"] = docSnap["ApplicationDeadline"];
      map["Duration"] = docSnap["Duration"];
      map["url"] = docSnap["url"];

      HackathonList.add(map);
    }
  }

  // Sample Resume Data for demonstration
  final ResumeData sampleResumeData = ResumeData(
    name: 'John Doe',
    title: 'Aspiring Software Developer',
    profileImage: 'assets/profile_pic.png', // Ensure this file exists
    profileSummary: 'Passionate about creating scalable software solutions.',
    education: [
      Education(
        degree: 'Bachelor of Technology in Computer Science',
        institution: 'XYZ University',
        duration: '2020 - 2024',
        details: 'CGPA: 9.2/10',
      ),
    ],
    skills: ['Java', 'Flutter', 'DSA', 'Spring Boot'],
    experience: [
      Experience(
        role: 'Flutter Developer Intern',
        company: 'Tech Solutions Pvt. Ltd.',
        duration: 'June 2023 - August 2023',
        description: 'Built cross-platform apps using Flutter.',
      ),
    ],
    projects: [
      Project(
        title: 'Placement Assistance App',
        description: 'Developed a mobile app providing placement insights.',
        duration: '',
      ),
    ],
    contact: Contact(
      email: 'johndoe@example.com',
      phone: '+91 12345 67890',
      linkedIn: 'linkedin.com/in/johndoe',
      github: '',
    ),
    certifications: [],
    awards: [],
    internships: [],
    languagesKnown: [],
    involvements: [],
  );

  // Bottom navigation on tap handler
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    companyListGetter();
    InternshipListGetter();
    HackathonListGetter();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes default back button
        title: Text(
          'Guide2Hire',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Visible against the gradient
            ),
          ),
        ),
        elevation: 10.0, // Adds depth with shadow
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), // Enhanced rounded corners
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade300,
                Colors.purple.shade600,
                Colors.purple.shade800,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.5), // Subtle border effect
              width: 1.5,
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 6), // Shadow below the AppBar
                blurRadius: 12,
              ),
            ],
          ),
        ),
      ),


      //backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeScreen(),
          const Practicescreenh(),
          JobsScreenMain(
            companyList: companyList,
          ),
          const ForumScreen2(),
          ResumeTemplateScreen(
            resumeData: sampleResumeData,
            resumeType: '',
          ), // Resume screen
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Practice'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Forum'),
          BottomNavigationBarItem(icon: Icon(Icons.file_open_rounded), label: 'Resume'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  // Home screen layout (Companies, Internships, Hackathons)
  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.blue
                ], // Gradient for a vibrant look
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: Colors.black.withOpacity(0.8),
                width: 3,
              ),
              boxShadow: [
                // Outer shadow for 3D raised effect
                BoxShadow(
                  color: Colors.black.withOpacity(0.6), // Dark outer shadow
                  offset: const Offset(6, 6),
                  blurRadius: 12,
                ),
                // Inner glow effect
                BoxShadow(
                  color: Colors.white.withOpacity(0.3), // Light inner glow
                  offset: const Offset(-3, -3),
                  blurRadius: 6,
                  spreadRadius:
                      -4, // Negative spread for glow inside the container
                ),
              ],
            ),
            clipBehavior:
                Clip.hardEdge, // Ensures the image respects the border radius
            child: Stack(
              children: [
                // Image background
                Positioned.fill(
                  child: Image.asset(
                    "assets/gui1.jpg",
                    fit: BoxFit.cover, // Ensures the image fills the container
                  ),
                ),
                // Overlay text or gradient
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.2), // Subtle dark overlay
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                // Centered content (optional, like text or icons)
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          const Text(
            'Companies for Placements',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: companyList.length,
              itemBuilder: (context, index) {
                return _buildCompanyItem(
                  companyList[index]['Name'],
                  index,
                  companyList[index]['url'],
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobsScreenMain(
                          companyList: companyList,
                        )),
              );
            },
            child: const Text('See All'),
          ),

          // Internships Section
          const SizedBox(height: 20),
          const Text(
            'Internships',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: InternshipList.length,
              itemBuilder: (context, index) {
                return _buildInternshipItem(
                  InternshipList[index]['Company'],
                  index,
                  InternshipList[index]['url'],
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Internshipmain(
                          internShipList: InternshipList,
                        )),
              );
            },
            child: const Text('See All'),
          ),

          // Hackathons Section
          const SizedBox(height: 20),
          const Text(
            'Hackathons',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: HackathonList.length,
                itemBuilder: (context, index) {
                  return _buildHackathonItem(
                    HackathonList[index]['Name'],
                    index,
                    HackathonList[index]['url'],
                  );
                }),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Hakathonemain(
                          hackathonList: HackathonList,
                        )),
              );
            },
            child: const Text('See All'),
          ),
        ],
      ),
    );
  }

  // Company Item Builder
  Widget _buildCompanyItem(String name, int index, String imagePath) {
    print(companyList[index]['url']);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  companydetails(companyList: companyList, itemIndex: index)),
        );
      },
      child: SizedBox(
        width: 200,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInternshipItem(String name, int index, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InternshipDetails(
                  InternshipList: InternshipList, itemIndex: index)),
        );
      },
      child: SizedBox(
        width: 200,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHackathonItem(String name, int index, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Hakathonedetails(Hackathon: HackathonList, itemIndex: index)),
        );
      },
      child: SizedBox(
        width: 200,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
